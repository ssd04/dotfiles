" Neovim configuration file - ssd04
"
if &compatible
    set nocompatible
endif

" ################### Plug setup #####################
"
" install vim-plug if not already there
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    augroup install_vim_plug
        autocmd!
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    augroup END
endif

call plug#begin(stdpath('data') . '/plugged')

Plug '~/.cache/dein'
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/neosnippet'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'

" Python
Plug 'davidhalter/jedi-vim'

" Go
"Plug 'fatih/vim-go'
"Plug 'Shougo/deoplete.nvim'
"Plug 'deoplete-plugins/deoplete-go', {'build': 'make'})

" Web
"Plug 'mattn/emmet-vim'

" Initialize plugin system
call plug#end()

" ################### Basic setup #####################

" enable syntax and plugins
syntax enable
filetype plugin on
"autocmd vimenter * NERDTree

let g:mapleader = ","                   " Change leader to a comma
let g:enable_bold_font = 1              " Enable bold font in colorscheme

"let g:python_host_prog = '/usr/bin/python'
"let g:python3_host_prog = '/usr/bin/python3'

set background=dark                     " Set background to dark
set hidden                              " Hide buffers in background
set listchars=tab:\ \ ,trail:·          " Set trails for tabs and spaces
set showmatch                           " Highlight matching bracket
set showcmd                             " Show incomplete cmds down the bottom
set noshowmode                          " Hide showmode because of the powerline plugin
set conceallevel=2 concealcursor=i      " neosnippets conceal marker
set pastetoggle=<F2>
set ruler
set undolevels=100
set laststatus=2                        " Always show the status line

" Colors
colorscheme hybrid_material
set t_Co=256        "Set 256 colors
"highlight LineNr ctermfg=grey


set number
set relativenumber
set numberwidth=4

" Tabs
set autoindent
set tabstop=4
set shiftwidth=4
set smartindent
set nofoldenable
set expandtab
set smarttab

" Window splitting setup
set splitright
set splitbelow

" turn off swap files
set noswapfile
set nobackup
set nowb

" Scrolling
set scrolloff=8                           " Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=5

" ################### Auto commands #####################

augroup vimrc
    autocmd!
augroup END

"autocmd vimrc BufWritePre * :call s:StripTrailingWhitespaces()                 " Auto-remove trailing spaces
"autocmd vimrc InsertLeave * NeoSnippetClearMarkers                             " Remove unused markers for snippets
autocmd vimrc InsertEnter * :set nocul                                          " Remove cursorline highlight
autocmd vimrc InsertLeave * :set cul                                            " Add cursorline highlight in normal mode
autocmd vimrc FileType html,javascript,coffee,cucumber setlocal sw=2 sts=2 ts=2 " Set 2 indent for html
autocmd vimrc FileType php,javascript setlocal cc=80                            " Set right margin only for php and js
"autocmd vimrc VimEnter,BufNewFile,BufReadPost * call s:LoadLocalVimrc()        " Load per project vimrc (Used for custom test mappings, etc.)
"autocmd VimEnter * call deoplete#custom#source('_',  'disabled_syntaxes', ['Comment', 'String'])

autocmd vimrc VimEnter * set vb t_vb=

autocmd vimrc FileType nerdtree syntax match hideBracketsInNerdTree
            \ "\]" contained conceal containedin=ALL

" ################### Mappings #####################
inoremap jk <esc>
inoremap kj <esc>
inoremap kl <esc>
"nnoremap ; <shift>:
nnoremap <C-n> :NERDTreeToggle<CR>

" easier moving between tabs
nnoremap <Leader>n <esc>:tabprevious<CR>
nnoremap <Leader>m <esc>:tabnext<CR>

" better indentation
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv
vnoremap > >gv

" Terminal mappings
tnoremap jk <C-\><C-n>

" Python related
nnoremap <Leader>b oimport pdb; pdb.set_trace()<esc>
nnoremap <Leader>B Oimport pdb; pdb.set_trace()<esc>
"nnoremap <Leader>b obreakpoint()<esc>
"nnoremap <Leader>B Obreakpoint()<esc>

" Copy to system clipboard
vnoremap <C-c> "+y
" Paste from system clipboard with Ctrl + v
inoremap <C-v> <Esc>"+p

" Hacky solution to current window fullscreen toggle
nnoremap <C-w>z :tabnew %<CR>

" Abbreviations
cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev wrap set wrap
cnoreabbrev nowrap set nowrap
cnoreabbrev git Git

" ################### Completion #####################
set wildmode=list:full
set wildignore=*.o,*.obj,*~             " stuff to ignore when tab completing
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

" ################## Plugins related setup #####################

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
"let g:deoplete#file#enable_buffer_path = 0        "Autocomplete files relative to current buffer

" Go config
let g:go_info_mode='guru'
let g:go_version_warning = 0

" Emmet configurations
let g:user_emmet_leader_key='<C-L>'

" Airline bar config
let g:airline_powerline_fonts = 1       " Enable powerline fonts
let g:airline_theme = "hybrid"          " Set theme to powerline default theme
let g:airline_section_y = '%{substitute(getcwd(), expand("$HOME"), "~", "g")}'  " Set relative path
let g:airline#extensions#whitespace#enabled = 0             " Disable whitespace extension
let g:airline#extensions#tabline#enabled = 1                " Enable tabline extension
let g:airline#extensions#tabline#left_sep = ' '             " Left separator for tabline
let g:airline#extensions#tabline#left_alt_sep = '│'         " Right separator for tabline

" NerdTree config
let g:NERDTreeChDirMode = 2             " Always change the root directory
let g:NERDTreeMinimalUI = 1             " Disable help text and bookmark title
let g:NERDTreeShowHidden = 1            " Show hidden files in NERDTree
