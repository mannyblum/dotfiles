call pathogen#infect()

""""""" General
set number
set ruler
set laststatus=2
set backspace=indent,eol,start
set showcmd
set display+=lastline
set listchars=tab:▸\ ,eol:¬,trail:-

let mapleader = ','
let g:mapleader = ','
let localleader = '\'
let g:localleader = '\'
let leader = ','
let g:leader = ','

set nosmartindent
set smarttab
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

set hlsearch

""""""" Colors
syntax on
set t_Co=256
"let g:solarized_termcolors=256
set background=dark
colorscheme solarized

"let g:zenburn_high_Contrast = 1
"colors zenburn

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

""""""" Deactivate default F1 behavior
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

""""""" Status Line
set laststatus=2

set statusline=%-.50F " Full path to file, 50 characters max
"set statusline=%{fugitive#statusline()} " fugitive info
set statusline+=\ (%n) " buffer number
set statusline+=\ %([%M%R%H%W]\ %) " Modified, Read-only, Help, and Preview flags
set statusline+=\ %y " Filetype
set statusline+=\ %#error# " switch to error color
set statusline+=%* " back to normal color
set statusline+=\ %#warningmsg# " switch to warningmsg color
set statusline+=%* " back to normal color
set statusline+=\ %=%< " Right-align and start truncation
set statusline+=\ [%04l/%04L\ %03c] " Show current line number, total lines, current column
set statusline+=\ %p%% " Percentage through file in lines

""""""" Filetype settings
filetype plugin indent on
if has("autocmd")
    autocmd FileType html setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType html setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType xhtml setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType htmldjango.html setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType htmldjango setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType javascript setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab nocindent
    autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
    " markdown
    augroup mkd
        autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:>
    augroup END

endif

autocmd filetype css setlocal equalprg=csstidy\ -\ --silent=true

nnoremap ,m :w <BAR> !lessc % > %:t:r.css<CR><space>
