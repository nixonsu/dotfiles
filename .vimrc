" Set leader key
let mapleader = " "
" Turn on syntax highlighting
syntax on
" start scrolling once 12 lines remain
set scrolloff=12
" Set to relative line number by default
set relativenumber number
" Map H and L to navigate between tabs
nnoremap H gT
nnoremap L gt
" Toggle relative line number using ctrl-L twice
nnoremap <C-L><C-L> :set invrelativenumber<CR>

" Yank to system clipboard using <Leader>y
nnoremap <Leader>y "+y
vnoremap <Leader>y "+y

" SEARCHING
" Incrementally search while typing
set incsearch
" Use smart case for searching
set ignorecase
set smartcase
" Highlight searches
set hlsearch
" ESC to clear highlight searches
nnoremap <esc> :noh<return><esc>

" NAVIGATION
" Automatically zz after control d or u
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
set ts=2 sw=2

" Move code blocks when highlighted
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

