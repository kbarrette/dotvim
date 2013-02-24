" Be iMproved!
set nocompatible


" -----------------
" Plugin management
" -----------------

" Vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'Lokaltog/vim-powerline'
Bundle 'Valloric/YouCompleteMe'
Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'nanotech/jellybeans.vim'
Bundle 'scrooloose/syntastic'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-surround'


" -------------------------------
" Plugin customizations and setup
" -------------------------------

" CtrlP setup
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_cmd = 'CtrlPMRU'
nnoremap <C-L> :CtrlPBuffer<CR>

" Powerline setup
set noshowmode

" YouCompleteMe setup
let g:ycm_complete_in_comments_and_strings = 1


" ----------------------------
" Colors, display options, etc
" ----------------------------

" Make paren matching more subtle, make Syntastic errors match other errors
let g:jellybeans_overrides = {
\  'MatchParen': { 'guifg': 'ffffff', 'ctermfg': '231', 'attr': 'underline,bold' },
\  'SyntasticError': { 'guibg': '902020', 'ctermbg': 'DarkRed' },
\}
colorscheme jellybeans

" Enable filetype-specific plugins and indenting
filetype plugin indent on

" Syntax highlighting on
syntax on

" Show line number
set number

" Show row and column
set ruler

" Set encoding to a sensible UTF-8
set encoding=utf-8

" Always show status line
set laststatus=2

" Show some info about the current command
set showcmd

" GUI setup
if has('gui_running')
  if has("win32") || has("win16")
    set guifont=Inconsolata:h12
  else
    set guifont=Inconsolata\ for\ Powerline:h15

    " Powerline setup
    let g:Powerline_symbols='fancy'
  endif

  " Remove left and right scrollbars
  set guioptions-=L
  set guioptions-=r

" Terminal setup
else
  set t_Co=256
endif


" --------------------
" General vim behavior
" --------------------

" Use host OS clipboard
set clipboard=unnamed

" Ignore case in searches unless there are upper-case characters in the search
set ignorecase
set smartcase

" Search incrementally
set incsearch

" Use wildmenu
set wildmenu
set wildmode=list:longest

" Live dangerously - turn off backups
set nobackup
set nowritebackup
set noswapfile

" Don't warn about unsaved buffers
set hidden

" Whitespace
set tabstop=2
set softtabstop=2
set expandtab
set autoindent
set shiftwidth=2
set copyindent
set nowrap


" -------------------------------
" Custom keybindings and commands
" -------------------------------

" Keybindings
let mapleader=" "
nnoremap ; :

" Set up tab to switch to last used buffer
nnoremap <Tab> :b#<CR>

" Set leader p to paste from register 0 (last yank)
nnoremap <leader>P "0P=`]
nnoremap <leader>p "0p=`]

" Set p to paste and reindent
nnoremap P P=`]
nnoremap p p=`]


" Retain window position when switching buffers
autocmd BufLeave * let b:winview = winsaveview()
autocmd BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif

