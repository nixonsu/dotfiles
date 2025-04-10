" Have j and k navigate visual lines rather than logical ones
nmap j gj
nmap k gk

" Go to beginning/end of line
nmap gh ^
nmap gl $

" Cycle between tabs
exmap tabprev obcommand workspace:previous-tab
nmap H :tabprev<CR>
exmap tabnext obcommand workspace:next-tab
nmap L :tabnext<CR>

" Map J, K to go back, forward in history
exmap back obcommand app:go-back
nmap J :back<CR>
exmap forward obcommand app:go-forward
nmap K :forward<CR>

" Yank to system clipboard
set clipboard=unnamed

" Focus on splits
" exmap ftop obcommand editor:focus-top
" nmap <C-k> :ftop<CR>
" exmap fbottom obcommand editor:focus-bottom
" nmap <C-j> :fbottom<CR>
exmap fleft obcommand editor:focus-left
nmap <C-h> :fleft<CR>
exmap fright obcommand editor:focus-right
nmap <C-l> :fright<CR>

" Have to unmap space to use it
unmap <Space>

" Go to link
exmap follow obcommand editor:follow-link
nmap gd :follow<CR>

" Rename title
exmap rename obcommand workspace:edit-file-title
nmap <Space>r :rename<CR>

" Insert templates
" exmap ins_temp obcommand templater-obsidian:insert-templater
" nmap <Space>t :ins_temp<CR>

" Toggle file explorer
exmap tleftbar obcommand app:toggle-left-sidebar
nmap <Space>e :tleftbar<CR>

" Paste into selection (for creating links)
map <Space>p :pasteinto<CR>

" Splits
exmap vsplit obcommand workspace:split-vertical
nmap <Space>v :vsplit<CR>

" Toggle calendar
exmap trightbar obcommand app:toggle-right-sidebar
nmap <Space>c :trightbar<CR>

" exmap hsplit obcommand workspace:split-horizontal
" nmap <Space>h :hsplit<CR>

" Surround
exmap surround_wiki surround [[ ]]
exmap surround_double_quotes surround " "
exmap surround_single_quotes surround ' '
exmap surround_backticks surround ` `
exmap surround_brackets surround ( )
exmap surround_square_brackets surround [ ]
exmap surround_curly_brackets surround { }

map [[ :surround_wiki
nunmap s
vunmap s
map s" :surround_double_quotes
map s' :surround_single_quotes
map s` :surround_backticks
map sb :surround_brackets
map s( :surround_brackets
map s) :surround_brackets
map s[ :surround_square_brackets
map s] :surround_square_brackets
map s{ :surround_curly_brackets
map s} :surround_curly_brackets

