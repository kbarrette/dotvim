set nocompatible

" Vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'Lokaltog/vim-powerline'
Bundle 'ervandew/supertab'
Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'techlivezheng/vim-plugin-minibufexpl'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-surround'

" Look and feel
colorscheme Sunburst
filetype plugin indent on
syntax on
set number
set ruler
set encoding=utf-8

" Always show status line
set laststatus=2

" Ignore case in searches unless there are upper-case characters in the search
set ignorecase
set smartcase

" Show some info about the current command
set showcmd

" Search incrementally
set incsearch

" Use wildmenu
set wildmenu
set wildmode=list:longest

" Keybindings
let mapleader=" "
:nmap ; :

" Set up tab to switch to last used buffer
nnoremap <Tab> :b#<CR>

" Set leader p to paste from register 0 (last yank)
nnoremap <leader>P "0P=`]
nnoremap <leader>p "0p=`]

" Set p to paste and reindent
nnoremap P P=`]
nnoremap p p=`]

" Live dangerously - turn off backups
set nobackup
set nowritebackup
set noswapfile

" Don't warn about unsaved buffers
set hidden

" Whitespace
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set nowrap
set autoindent
set copyindent

" Use host OS clipboard
set clipboard=unnamed

" Syntax highlighting for JSON
autocmd BufRead,BufNewFile *.json set filetype=json

" MiniBufExplorer setup
let g:statusLineText=''
let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplUseSingleClick=1
let g:miniBufExplForceSyntaxEnable=1

" CtrlP setup
let g:ctrlp_clear_cache_on_exit = 1

" Powerline setup
set noshowmode

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

