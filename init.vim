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

" Plug '~/.cache/dein'
" Plug 'Shougo/deoplete.nvim'
" Plug 'Shougo/neosnippet'

Plug 'junegunn/vader.vim'

Plug 'scrooloose/nerdtree'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
"Plug 'ryanoasis/nerd-fonts'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'cocopon/iceberg.vim'
Plug 'majutsushi/tagbar'
Plug 'junegunn/fzf'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'hashivim/vim-terraform'

" Git
Plug 'tpope/vim-fugitive'
Plug 'apzelos/blamer.nvim'

" Python
Plug 'psf/black'

Plug 'dpelle/vim-LanguageTool'

let g:languagetool_jar='~/LanguageTool/*/languagetool-commandline.jar'

" Latex
Plug 'lervag/vimtex'
" Plug 'ssd04/vim-piano-chords-latex'

let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_view_general_options
    \ = '-reuse-instance -forward-search @tex @line @pdf'
let g:vimtex_view_general_options_latexmk = '-reuse-instance'
let g:vimtex_compiler_latexmk = { 
        \ 'executable' : 'latexmk',
        \ 'options' : [ 
        \   '-xelatex',
        \   '-file-line-error',
        \   '-synctex=1',
        \   '-interaction=nonstopmode',
        \ ],
        \}
let g:vimtex_compiler_latexmk_engines = {
    \ '_'                : '-xelatex',
    \ 'pdflatex'         : '-pdf',
    \ 'dvipdfex'         : '-pdfdvi',
    \ 'lualatex'         : '-lualatex',
    \ 'xelatex'          : '-xelatex',
    \ 'context (pdftex)' : '-pdf -pdflatex=texexec',
    \ 'context (luatex)' : '-pdf -pdflatex=context',
    \ 'context (xetex)'  : '-pdf -pdflatex=''texexec --xtx''',
    \}

Plug 'junegunn/limelight.vim'
Plug 'ap/vim-css-color'

" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
"Plug 'Shougo/deoplete.nvim'
"Plug 'deoplete-plugins/deoplete-go', {'build': 'make'})

" Web
"Plug 'mattn/emmet-vim'
"
Plug 'ryanoasis/vim-devicons'

" Initialize plugin system
call plug#end()

" ################### Basic setup #####################

" enable syntax and plugins
syntax enable
filetype plugin on
set encoding=UTF-8
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
set nohlsearch                          " Disable search highlight

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
autocmd FileType nerdtree setlocal nolist

autocmd filetype nerdtree highlight haskell_icon ctermbg=none ctermfg=Red guifg=#ffa500
autocmd filetype nerdtree highlight html_icon ctermbg=none ctermfg=Red guifg=#ffa500
autocmd filetype nerdtree highlight go_icon ctermbg=none ctermfg=Red guifg=#ffa500
autocmd filetype nerdtree highlight python_icon ctermbg=none ctermfg=Blue guifg=#ffa500

autocmd filetype nerdtree syn match haskell_icon ## containedin=NERDTreeFlags

autocmd BufWritePre *.py execute ':Black'

autocmd BufWritePre *.tf execute ':TerraformFmt'

" ################### Mappings #####################
inoremap jk <esc>
inoremap kj <esc>
inoremap kl <esc>
"nnoremap ; <shift>:
nnoremap <C-n> :call ToggleNERDTree()<CR>

function! ToggleNERDTree()
  NERDTreeToggle
  silent NERDTreeMirror
endfunction

try 
  source ~/dev/vim/vim-piano-chords-latex/plugin/piano-chords-latex.vim
catch
  " No such file? No problem; just ignore it.
endtry

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

nnoremap <Leader>t :!pytest

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
cnoreabbrev git Git
cnoreabbrev black Black
cnoreabbrev co Commentary

" Remap for rename current word
nmap <leader>r <Plug>(coc-rename)
nmap gr <Plug>(coc-references)
nmap <leader>gi <Plug>(coc-implementation)

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

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

" Go config
let g:go_info_mode='guru'
let g:go_version_warning = 0
let g:go_gopls_enabled = 0
let g:go_fmt_autosave = 0
" let g:go_fmt_command = "goimports"

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
"let g:NERDTreeMinimalUI = 1             " Disable help text and bookmark title
let g:NERDTreeShowHidden = 1            " Show hidden files in NERDTree
let g:NERDTreeLimitedSyntax = 0 " limit syntax for the most popular extensions
let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '
let g:WebDevIconsDisableDefaultFolderSymbolColorFromNERDTreeDir = 1
let g:WebDevIconsDisableDefaultFileSymbolColorFromNERDTreeFile = 1
let g:DevIconsEnableFolderExtensionPatternMatching = 1
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:webdevicons_enable_nerdtree = 1
let g:WebDevIconsDisableDefaultFileSymbolColorFromNERDTreeFile = 1

let g:WebDevIconsUnicodeDecorateFileNodes = 0
let g:WebDevIconsUnicodeGlyphDoubleWidth = 0

" Ale config
let g:ale_python_flake8_options = '--ignore=E501'

set guifont=DroidSansMono\ Nerd\ Font\ 11
