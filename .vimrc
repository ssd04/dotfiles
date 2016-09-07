
let mapleader=','

set number
set numberwidth=4
highlight LineNr ctermfg=grey

set autoindent
set tabstop=4
set shiftwidth=4
set smartindent
set expandtab

" set smarttab
" set softtabstop=4

set ruler

set undolevels=100


function TrimWhiteSpace()
    %s/\s*$//
    ''
	echom "Trim white spaces"
:endfunction

map <F2> : call TrimWhiteSpace()<CR>
map! <F2> : call TrimWhiteSpace()<CR>

function ToggleShiftWidth()
    if &shiftwidth == 4
	set tabstop=8
	set shiftwidth=8
	echom "Set indents to 8"
    else 
		set tabstop=4
	set shiftwidth=4
	echom "Set indents to 4"
    endif
endfunction

map <F3> : call ToggleShiftWidth()<CR>


" mappings
inoremap jk <esc>
inoremap .' <esc>
"nnoremap ; <shift>:

"inoremap <esc> <nop> 


