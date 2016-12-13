
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
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'kien/ctrlp.vim'

" python
NeoBundle 'klen/python-mode'

" php
NeoBundle 'joonty/vdebug'


" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
  "End NeoBundle Scripts-------------------------
  

"- Basic setup -
" set nocompatible

" enable syntax and plugins
" syntax enable
" filetype plugin on
" autocmd vimenter * NERDTree

colorscheme landscape
set laststatus=2


let mapleader=','

set number
set numberwidth=4
"highlight LineNr ctermfg=grey

set autoindent
set tabstop=4
set shiftwidth=4
set smartindent
set expandtab

" set smarttab
" set softtabstop=4

set ruler

set undolevels=100

" mappings
inoremap jk <esc>
inoremap .' <esc>
"nnoremap ; <shift>:

"inoremap <esc> <nop>

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
