" Be iMproved!
set nocompatible


" ------------------
" Custom keybindings
" ------------------

" Keybindings
let mapleader=","
nnoremap ; :
nnoremap : ;

" Set up tab to switch to last used buffer
nnoremap <Tab> :b#<CR>

" Set leader p to paste from register 0 (last yank)
nnoremap <leader>P "0P=`]
nnoremap <leader>p "0p=`]

" Set p to paste and reindent
nnoremap P P=`]
nnoremap p p=`]

" Ctrl-S saves
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>


" -----------------
" Plugin management
" -----------------

" Vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'Lokaltog/vim-powerline'
Bundle 'Valloric/YouCompleteMe'
Bundle 'airblade/vim-gitgutter'
Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
" Bundle 'maxbrunsfeld/vim-yankstack'
Bundle 'nanotech/jellybeans.vim'
Bundle 'scrooloose/syntastic'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-surround'
Bundle 'vim-scripts/BufOnly.vim'
Bundle 'Yggdroot/indentLine'
Bundle 'mileszs/ack.vim'
Bundle 'vim-scripts/scratch.vim'

" -------------------------------
" Plugin customizations and setup
" -------------------------------

" CtrlP setup
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_working_path_mode = 'rc'
let g:ctrlp_mruf_relative = 1
" let g:ctrlp_cmd = 'CtrlPMRU'
nnoremap <C-L> :CtrlPBuffer<CR>

" Powerline setup
set noshowmode
let g:Powerline_symbols='fancy'

" YouCompleteMe setup
let g:ycm_complete_in_comments_and_strings = 1

" vim-gitgutter
nnoremap <Leader>gg :GitGutterToggle<CR>

" indentline setup
let g:indentLine_char = '┆'
let g:indentLine_color_term = 237


" ----------------------------
" Colors, display options, etc
" ----------------------------

" Make paren matching more subtle, Syntastic errors match other errors, Todo more prominent
let g:jellybeans_overrides = {
\  'MatchParen': { 'guifg': 'ffffff', 'ctermfg': '231', 'attr': 'underline,bold' },
\  'SyntasticError': { 'guibg': '902020', 'ctermbg': 'DarkRed' },
\  'Todo': { 'attr': 'reverse,bold' },
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

" Use option as meta on a mac
set macmeta


" ---------------
" Custom commands
" ---------------

" Retain window position when switching buffers
autocmd BufLeave * let b:winview = winsaveview()
autocmd BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif

" Elementary Ruby text objects
autocmd FileType ruby vnoremap ar <ESC>?do<CR>v/end/e<CR>
autocmd FileType ruby vnoremap ir <ESC>?do?e+1<CR>v/\s*end/s-1<CR>
autocmd FileType ruby omap ar :normal var<CR>
autocmd FileType ruby omap ir :normal vir<CR>

" Highlight extraneous whitespace
autocmd BufWinEnter * match Error /\s\+$/
autocmd InsertEnter * match Error /\s\+\%#\@<!$/
autocmd InsertLeave * match Error /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Reformat entire file
nnoremap <leader>fa ggVG=

" Reformat paragraph
nnoremap <leader>fp vap=

" ------------
" Experimental
" ------------

" Based on https://github.com/burke/matcher
function! BurkeMatcher(items, str, limit, mmode, ispath, crfile, regex)
  let results = []

  " No search string, just return the list we were passed
  if len(a:str) == 0
    let results = a:items[0:(a:limit)]

  " We have a search string
  else
    let match_cmd = g:path_to_matcher . ' --limit ' . a:limit . ' --no-dotfiles ' . a:str
    let results = split(system(match_cmd, join(a:items, "\n")), "\n")

  endif

  " Exclude current file from results when a:ispath == 1
  if a:ispath == 1
    remove(results, index(results, a:crfile))
  endif

  return results
endfunction
let g:path_to_matcher = "~/bin/matcher"
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --other --exclude-standard']
let g:ctrlp_use_caching = 0
let g:ctrlp_match_func = { 'match': 'BurkeMatcher' }

