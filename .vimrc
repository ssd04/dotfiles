
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
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
"NeoBundle 'roxma/nvim-yarp'
"NeoBundle 'roxma/vim-hug-neovim-rpc'
NeoBundle 'shougo/deoplete.nvim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'powerline/powerline'
"NeoBundle 'kien/ctrlp.vim'
"NeoBundle 'tpope/vim-commentary'
"NeoBundle 'tpope/vim-surround'
"NeoBundle 'tpope/vim-repeat'
"NeoBundle 'tpope/vim-fugitive'

" themes
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'kristijanhusak/vim-hybrid-material'
"NeoBundle 'kiddos/malokai.vim'
NeoBundle 'itchyny/landscape.vim'

"NeoBundle 'sheerun/vim-polyglot'
"NeoBundle 'w0rp/ale'
" HTML
"NeoBundle 'othree/html5.vim'
"NeoBundle 'othree/html5-syntax.vim'
"NeoBundle 'mattn/emmet-vim'

" python
"NeoBundle 'klen/python-mode'
""
" php
"NeoBundle 'joonty/vdebug'
"NeoBundle 'brookhong/dbgpavim'

<<<<<<< HEAD
" go
"NeoBundle 'fatih/vim-go'
"NeoBundle 'deoplete-plugins/deoplete-go', {'build': {'unix': 'make'}}
=======
NeoBundle 'jamessan/vim-gnupg'

>>>>>>> First commit work setup

" Rust
NeoBundle 'rust-lang/rust.vim'

" Typescript
"NeoBundle 'leafgarland/typescript-vim'
"NeoBundle 'mhartington/nvim-typescript', { 'do': './install.sh' }

" Required:
call neobundle#end()

" Required:
filetype indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

let g:go_gocode_propose_source=0

"- Basic setup -
set nocompatible
set background=dark                                                             "Set background to dark
set hidden                                                                      "Hide buffers in background
set listchars=tab:\ \ ,trail:·                                                  "Set trails for tabs and spaces
set showmatch                                                                   "Highlight matching bracket
set showcmd                                                                     "Show incomplete cmds down the bottom
set noshowmode                                                                  "Hide showmode because of the powerline plugin
set conceallevel=2 concealcursor=i                                              "neosnippets conceal marker

" enable syntax and plugins
syntax enable
filetype plugin on
"autocmd vimenter * NERDTree

colorscheme landscape
colorscheme hybrid_material
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

" Mappings
inoremap jk <esc>
inoremap kj <esc>
inoremap kl <esc>
"nnoremap ; <shift>:
nnoremap <C-n> :NERDTreeToggle<CR>

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

"inoremap <esc> <nop>
" ---------------------------

" Emmet configurations
let g:user_emmet_leader_key='<C-L>'

" -----Configuration from mbrochh - github------

" Automatic reloading of .vimrc

" turn off swap files
set noswapfile
set nobackup
set nowb

set pastetoggle=<F2>

" added later
set t_Co=256                                                                    "Set 256 colors

" Expand snippets on tab if snippets exists, otherwise do autocompletion
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\ : pumvisible() ? "\<C-n>" : "\<TAB>"
" If popup window is visible do autocompletion from back
imap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Fix for jumping over placeholders for neosnippet
smap <expr><TAB> neosnippet#jumpable() ?
\ "\<Plug>(neosnippet_jump)"
\: "\<TAB>"
  
" Deoplete config
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#enable_at_startup = 1                                            "Enable deoplete autocompletion
let g:deoplete#file#enable_buffer_path = 0                                      "Autocomplete files relative to current buffer

set wildmode=list:full
set wildignore=*.o,*.obj,*~                                                     "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*cache*
set wildignore+=*logs*
set wildignore+=*node_modules/**
set wildignore+=*DS_Store*
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

let g:enable_bold_font = 1                                                      "Enable bold font in colorscheme
let g:go_info_mode='guru'

" Airline bar config
let g:airline_powerline_fonts = 1                                               "Enable powerline fonts
let g:airline_theme = "hybrid"                                                  "Set theme to powerline default theme
let g:airline_section_y = '%{substitute(getcwd(), expand("$HOME"), "~", "g")}'  "Set relative path
let g:airline#extensions#whitespace#enabled = 0                                 "Disable whitespace extension
let g:airline#extensions#tabline#enabled = 1                                    "Enable tabline extension
let g:airline#extensions#tabline#left_sep = ' '                                 "Left separator for tabline
let g:airline#extensions#tabline#left_alt_sep = '│'                             "Right separator for tabline

" NerdTree config
let g:NERDTreeChDirMode = 2                                                     "Always change the root directory
let g:NERDTreeMinimalUI = 1                                                     "Disable help text and bookmark title
let g:NERDTreeShowHidden = 1                                                    "Show hidden files in NERDTree

" Rust config
let g:rustfmt_autosave = 1
