" Neovim configuration file - ssd04
"
if &compatible
    set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/deoplete.vim

if dein#load_state('~/.cache/dein')
    call dein#begin('~/.cache/dein')

    call dein#add('~/.cache/dein')
    call dein#add('Shougo/deoplete.nvim')
    call dein#add('Shougo/neosnippet')
    call dein#add('scrooloose/nerdtree')
    call dein#add('vim-airline/vim-airline')
    call dein#add('vim-airline/vim-airline-themes')
    call dein#add('kristijanhusak/vim-hybrid-material')
    call dein#add('tpope/vim-commentary')
    call dein#add('tpope/vim-surround')
    call dein#add('tpope/vim-repeat')
    call dein#add('tpope/vim-fugitive')

    " Go
    call dein#add('fatih/vim-go')
    call dein#add('Shougo/deoplete.nvim')
    call dein#add('deoplete-plugins/deoplete-go', {'build': 'make'})

    if !has('nvim')
        call dein#add('roxma/nvim-yarp')
        call dein#add('roxma/vim-hug-neovim-rpc')
    endif

    call dein#end()
    call dein#save_state()
endif

if dein#check_install()
    call dein#install()
endif

" Autocommands
autocmd VimEnter * call deoplete#custom#source('_',  'disabled_syntaxes', ['Comment', 'String'])

"- Basic setup -
let g:mapleader = ","       "Change leader to a comma
let g:enable_bold_font = 1  "Enable bold font in colorscheme

"let g:python_host_prog = '/usr/bin/python'
"let g:python3_host_prog = '/usr/bin/python3'

set nocompatible
set background=dark                     "Set background to dark
set hidden                              "Hide buffers in background
set listchars=tab:\ \ ,trail:·          "Set trails for tabs and spaces
set showmatch                           "Highlight matching bracket
set showcmd                             "Show incomplete cmds down the bottom
set noshowmode                          "Hide showmode because of the powerline plugin
set conceallevel=2 concealcursor=i      "neosnippets conceal marker

" enable syntax and plugins
syntax enable
filetype plugin on
"autocmd vimenter * NERDTree

colorscheme hybrid_material

set laststatus=2

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

" better indentation
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv
vnoremap > >gv

" turn off swap files
set noswapfile
set nobackup
set nowb

set pastetoggle=<F2>

" added later
set t_Co=256        "Set 256 colors

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
  
let g:neosnippet#disable_runtime_snippets = {'_' : 1}       "Snippets setup

" Deoplete config
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#enable_at_startup = 1              "Enable deoplete autocompletion
let g:deoplete#file#enable_buffer_path = 0        "Autocomplete files relative to current buffer

set wildmode=list:full
set wildignore=*.o,*.obj,*~             "stuff to ignore when tab completing
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

" Go config
let g:go_info_mode='guru'
let g:go_version_warning = 0

" Emmet configurations
let g:user_emmet_leader_key='<C-L>'

" Airline bar config
let g:airline_powerline_fonts = 1       "Enable powerline fonts
let g:airline_theme = "hybrid"          "Set theme to powerline default theme
let g:airline_section_y = '%{substitute(getcwd(), expand("$HOME"), "~", "g")}'  "Set relative path
let g:airline#extensions#whitespace#enabled = 0             "Disable whitespace extension
let g:airline#extensions#tabline#enabled = 1                "Enable tabline extension
let g:airline#extensions#tabline#left_sep = ' '             "Left separator for tabline
let g:airline#extensions#tabline#left_alt_sep = '│'         "Right separator for tabline

" NerdTree config
let g:NERDTreeChDirMode = 2             "Always change the root directory
let g:NERDTreeMinimalUI = 1             "Disable help text and bookmark title
let g:NERDTreeShowHidden = 1            "Show hidden files in NERDTree
