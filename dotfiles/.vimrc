" Turn on syntax highlighting
syntax on
colorscheme monokai
" Set to relative line number by default
set relativenumber number
" Map H and L to navigate between tabs
nnoremap H gT
nnoremap L gt
" Toggle relative line number using ctrl-L twice
nmap <C-L><C-L> :set invrelativenumber<CR>
" Incrementally search while typing
set incsearch
" Use smart case for searching
set ignorecase
set smartcase
" Highlight searches
set hlsearch
" ESC to clear highlight searches
nnoremap <esc> :noh<return><esc>
" Automatically zz after control d or u
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
set ts=2 sw=2
