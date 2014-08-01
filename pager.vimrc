set nocompatible

" Gotta have jellybeans
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'nanotech/jellybeans.vim'
colorscheme jellybeans

" Clean up window dressing
set laststatus=0
set cmdheight=1
set guioptions=aiMr

" Read-only
set nomodifiable
set readonly

" Be pretty
filetype plugin indent on
syntax on

nnoremap ; :
nnoremap q :q!<CR>

" Space pages down
nmap <Space> <C-F><C-G>

" Use host OS clipboard
set clipboard=unnamed

" Ignore case in searches unless there are upper-case characters in the search
set ignorecase
set smartcase

" Search incrementally
set incsearch

