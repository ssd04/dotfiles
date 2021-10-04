" Vim configuration file - ssd04
"
if &compatible
    set nocompatible
endif

" ################### Basic setup #####################

" enable syntax and plugins
syntax enable
filetype plugin on
set encoding=UTF-8

let g:mapleader = ","                   " Change leader to a comma
let g:enable_bold_font = 1              " Enable bold font in colorscheme

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
set nohlsearch                          " Disable search highlight

" Colors
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

autocmd vimrc VimEnter * set vb t_vb=

" ################### Mappings #####################
inoremap jk <esc>
inoremap kj <esc>
inoremap kl <esc>
"nnoremap ; <shift>:

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

" Copy to system clipboard
vnoremap <C-c> "+y
" Paste from system clipboard with Ctrl + v
inoremap <C-v> <Esc>"+p

" Hacky solution to current window fullscreen toggle
nnoremap <C-w>z :tabnew %<CR>

" Scrolling
nnoremap J <C-d>    " scroll down
nnoremap K <C-u>    " scroll up

" Abbreviations
cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev wrap set wrap
cnoreabbrev nowrap set nowrap

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
