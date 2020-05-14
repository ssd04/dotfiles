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
    call dein#add('w0rp/ale')
    call dein#add('mileszs/ack.vim')
    call dein#add('yko/mojo.vim')
    call dein#add('vifm/vifm.vim')

    " Pyhton
    "call dein#add('zchee/deoplete-jedi')
    call dein#add('klen/python-mode')
    call dein#add('python-mode/python-mode')

    " Go
    "call dein#add('fatih/vim-go')
    "call dein#add('deoplete-plugins/deoplete-go', {'build': 'make'})

    " Terraform
    call dein#add('hashivim/vim-terraform')

    " the plugin are from other configuration - not usefull right now
    "call dein#add(s:plugin_dir . '/Shougo/dein.vim')
    "call dein#add('christoomey/vim-tmux-navigator')
    "call dein#add('ryanoasis/vim-devicons')
    "call dein#add('w0rp/ale')
    "call dein#add('nelstrom/vim-visual-star-search')
    "call dein#add('mileszs/ack.vim')
    "call dein#add('Raimondi/delimitMate')
    "call dein#add('mattn/emmet-vim')
    "call dein#add('tpope/vim-commentary')
    "call dein#add('tpope/vim-surround')
    "call dein#add('tpope/vim-repeat')
    "call dein#add('tpope/vim-fugitive')
    "call dein#add('scrooloose/nerdtree')
    "call dein#add('airblade/vim-gitgutter')
    "call dein#add('vim-airline/vim-airline')
    "call dein#add('vim-airline/vim-airline-themes')
    "call dein#add('duff/vim-bufonly')
    "call dein#add('gregsexton/MatchTag')
    "call dein#add('sheerun/vim-polyglot')
    "call dein#add('kristijanhusak/vim-hybrid-material')
    "call dein#add('Shougo/deoplete.nvim')
    "call dein#add('honza/vim-snippets')
    "call dein#add('dyng/ctrlsf.vim')
    "call dein#add('ctrlpvim/ctrlp.vim')
    "call dein#add('junegunn/goyo.vim')
    " ===============================================================
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

" set text line width
set textwidth=110
set colorcolumn=-2

" enable syntax and plugins
syntax enable
filetype plugin on
if has("autocmd")
  filetype plugin indent on
endif
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
set softtabstop=4
set smartindent
set nofoldenable

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
set splitbelow splitright

" ================ Auto commands ======================

augroup vimrc
    autocmd!
augroup END

"autocmd vimrc InsertLeave * NeoSnippetClearMarkers                              "Remove unused markers for snippets
autocmd vimrc InsertEnter * :set nocul                                          "Remove cursorline highlight
autocmd vimrc InsertLeave * :set cul                                            "Add cursorline highlight in normal mode
autocmd vimrc FileType html,javascript,coffee,cucumber setlocal sw=2 sts=2 ts=2 "Set 2 indent for html
autocmd vimrc FileType perl setlocal sw=2 sts=2 ts=2
autocmd vimrc FileType php,javascript setlocal cc=80                            "Set right margin only for php and js
"autocmd vimrc VimEnter,BufNewFile,BufReadPost * call s:LoadLocalVimrc()         "Load per project vimrc (Used for custom test mappings, etc.)

autocmd vimrc VimEnter * set vb t_vb=

autocmd vimrc FileType nerdtree syntax match hideBracketsInNerdTree
            \ "\]" contained conceal containedin=ALL

" Jenkinsfile VIM syntax highlighting
au BufNewFile,BufRead Jenkinsfile setf groovy

" ================ Completion =======================

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

" ================ Scrolling ========================

set scrolloff=8                                                                 "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=5

" ================ Abbreviations ====================

cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qa qa
cnoreabbrev Bd bd
cnoreabbrev bD bd
cnoreabbrev wrap set wrap
cnoreabbrev nowrap set nowrap
cnoreabbrev bda BufOnly
cnoreabbrev t tabe
cnoreabbrev T tabe
set expandtab

set smarttab
set softtabstop=4

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
" Map for Escape key
inoremap jk  <Esc>

" Yank to the end of the line
nnoremap Y y$

" Copy to system clipboard
vnoremap <C-c> "+y
" Paste from system clipboard with Ctrl + v
inoremap <C-v> <Esc>"+p
nnoremap <Leader>p "0p
vnoremap <Leader>p "0p

" Move to the end of yanked text after yank and paste
nnoremap p p`]
vnoremap y y`]
vnoremap p p`]

" Move selected lines up and down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Clear search highlight
nnoremap <Leader><space> :noh<CR>

" Toggle distraction free mode
nnoremap <Leader>g :Goyo<CR>

" Handle syntastic error window
nnoremap <Leader>e :lopen<CR>
nnoremap <Leader>q :lclose<CR>

" Find current file in NERDTree
"nnoremap <Leader>hf :NERDTreeFind<CR>
" Open NERDTree
"nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <C-n> :NERDTreeToggle<CR>

" Hacky solution to current window fullscreen toggle
nnoremap <C-w>z :tabnew %<CR>

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv
" better indentation
vnoremap > >gv
" better indentation

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
let g:neosnippet#disable_runtime_snippets = {'_' : 1}                           "Snippets setup
"let g:neosnippet#snippets_directory = [
"            \ s:plugin_dir . '/honza/vim-snippets/snippets',
"            \ '~/.config/nvim/snippets']

let g:deoplete#enable_at_startup = 1                                            "Enable deoplete autocompletion
let g:deoplete#file#enable_buffer_path = 1                                      "Autocomplete files relative to current buffer

let g:ackhighlight = 1                                                          "Highlight current search
let g:ackprg = 'ag --vimgrep'                                                   "Use ag instead of ack for searching

let g:delimitMate_expand_cr = 1                                                 "auto indent on enter

let g:ale_linters = {'javascript': ['eslint']}                                  "Lint js with eslint
let g:ale_lint_on_save = 1                                                      "Lint when saving a file
let g:ale_sign_error = '✖'                                                      "Lint error sign
let g:ale_sign_warning = '⚠'                                                    "Lint warning sign

let g:goyo_width = 100                                                          "100 chars width
let g:goyo_height = 100                                                         "100% height

let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '                                "Set up spacing for sidebar icons

let g:jsx_ext_required = 1                                                      "Force jsx extension for jsx filetype

" Python
let g:pymode_python = 'python3'

" Terraform
let g:terraform_align = 1
let g:terraform_fold_sections = 1
let g:terraform_fmt_on_save = 0
