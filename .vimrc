
autocmd! bufwritepost .vimrc source %

"NeoBundle Scripts-----------------------------
if &compatible
set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'itchyny/landscape.vim'
NeoBundle 'nanotech/jellybeans.vim'
"NeoBundle 'vim-airline/vim-airline'
NeoBundle 'powerline/powerline'
"NeoBundle 'kien/ctrlp.vim'
NeoBundle 'kiddos/malokai.vim'

" HTML
NeoBundle 'othree/html5.vim'
NeoBundle 'othree/html5-syntax.vim'
NeoBundle 'mattn/emmet-vim'

" python
"NeoBundle 'klen/python-mode'
""
" php
NeoBundle 'joonty/vdebug'
NeoBundle 'brookhong/dbgpavim'


" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" Required:
call neobundle#end()

" Required:
filetype indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
  "End NeoBundle Scripts-------------------------
  

"- Basic setup -
set nocompatible

" enable syntax and plugins
syntax enable
filetype plugin on
"autocmd vimenter * NERDTree

colorscheme landscape
set laststatus=2


let mapleader=','

set number
set relativenumber
set numberwidth=4
"highlight LineNr ctermfg=grey

set autoindent
set tabstop=4
set shiftwidth=4
set smartindent
set expandtab

set smarttab
" set softtabstop=4

set ruler

set undolevels=100

" mappings
inoremap jk <esc>
inoremap kj <esc>
inoremap kl <esc>
"nnoremap ; <shift>:

"inoremap <esc> <nop>

" Emmet configurations
let g:user_emmet_leader_key='<C-L>'

" -----Configuration from mbrochh - github------

" Automatic reloading of .vimrc

" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv
" better indentation
vnoremap > >gv
" better indentation

set pastetoggle=<F2>
