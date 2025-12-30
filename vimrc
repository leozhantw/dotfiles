set nu
set cursorline
set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.
set shiftwidth=4    " Indents will have a width of 4
set softtabstop=4   " Sets the number of columns for a TAB
set expandtab       " Expand TABs to spaces
set maxmempattern=1000000

" Color configuration
" set bg=dark
" color evening  " Same as :colorscheme evening
" hi LineNr cterm=bold ctermfg=DarkGrey ctermbg=NONE
" hi CursorLineNr cterm=bold ctermfg=Green ctermbg=NONE

syntax enable
colorscheme monokai

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
