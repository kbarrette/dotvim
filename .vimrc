" Look and feel
colorscheme Sunburst
filetype plugin indent on
syntax on
set number

" Spacing
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set nowrap
set autoindent
set copyindent

" MacOS preferences
set clipboard=unnamed

" Use pathogen to wrangle runtimepath so everything in bundle/ is included
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

" MiniBufExplorer setup
let g:statusLineText=''
let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplUseSingleClick=1
let g:miniBufExplForceSyntaxEnable=1

" CtrlP setup
let g:ctrlp_lazy_update=1

" GUI vs terminal setup
if has('gui_running')
  set guifont=Inconsolata:h15
else
  set t_Co=256
endif
