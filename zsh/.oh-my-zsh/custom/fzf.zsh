# fcd - cd to a selected directory
fcd() {
  local dir
  dir=$(find "${1:-.}" -path '*/\.*' -prune -o -type d -print 2>/dev/null | fzf +m) && cd "$dir"
}

# fh - search command history and execute a selected command
fh() {
  local selected
  selected=$(fc -l 1 | fzf +s --tac | sed 's/ *[0-9]* *//') || return
  [[ -n "$selected" ]] && eval "$selected"
}

# fchr - browse Chrome/Chromium history. Override for another browser profile.
fchr() {
  local database="${CHROME_HISTORY_FILE:-${XDG_CONFIG_HOME:-$HOME/.config}/google-chrome/Default/History}"
  if [[ ! -f "$database" && -z "${CHROME_HISTORY_FILE:-}" ]]; then
    database="${XDG_CONFIG_HOME:-$HOME/.config}/chromium/Default/History"
  fi
  if [[ ! -f "$database" ]]; then
    print -u2 'History not found. Set CHROME_HISTORY_FILE to your profile History database.'
    return 1
  fi
  local snapshot selected
  snapshot=$(mktemp "${TMPDIR:-/tmp}/dotfiles-history.XXXXXXXX") || return
  {
    sqlite3 "$database" '.timeout 2000' ".backup '$snapshot'" || return
    selected=$(sqlite3 -separator $'\t' "$snapshot" \
      "select replace(replace(title,char(9),' '),char(10),' '),url from urls order by last_visit_time desc" |
      fzf --delimiter=$'\t' --with-nth=1 | cut -f2-) || return
    [[ -n "$selected" ]] && xdg-open "$selected"
  } always {
    rm -f "$snapshot"
  }
}
