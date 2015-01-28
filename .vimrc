" Pathogen {{{
execute pathogen#infect()
" }}}

" Misc {{{
syntax on
filetype plugin indent on
set backspace=indent,eol,start
highlight ExtraWhitespace ctermbg=red guibg=red
set omnifunc=syntaxcomplete#Complete
" }}}

" Colors {{{
let base16colorspace=256
set t_Co=256
set background=dark
colorscheme base16-tomorrow
" }}}

" Spaces & Tabs {{{
set nosmartindent
set smarttab
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
" }}}

" UI Config {{{
set number
set ruler
set showcmd
set showmatch
set display+=lastline
" }}}

" Leader Shortcuts {{{
let mapleader = ','
let g:mapleader = ','
let localleader = '\'
let g:localleader = '\'
let leader = ','
let g:leader = ','
" }}}

" Searching {{{
set hlsearch
set incsearch
" }}}

" ExtraWhiteSpace {{{
match ExtraWhiteSpace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
" }}}

" Remaps {{{
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

"""""" remap jj to ESC
inoremap jj <ESC>

"""""" increase/decrease number remap
nnoremap <A-a> <C-a>
nnoremap <A-x> <C-x>

" }}}

" Status Line {{{
set laststatus=2
set pastetoggle=<F2>
" }}}

" Folding {{{
set foldmethod=indent   " fold based on indent level
set foldnestmax=10      " max 10 depth
set foldenable          " don't fold files by default on open
nnoremap <space> za
set foldlevelstart=10    " start with fold level of 1
" }}}

" Filetype Settings {{{
filetype plugin indent on
if has("autocmd")
    autocmd FileType html setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType html setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType xhtml setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType htmldjango.html setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType htmldjango setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
    "autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab equalprg=csstidy\ -\ --silent=true
    "autocmd FileType css setlocal equalprg=csstidy\ -\ --silent=true
    autocmd FileType less setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab nocindent
    autocmd FileType scss setlocal ts=2 sts=2 sw=2 expandtab
    autocmd BufRead *.j2 set filetype=htmljinja
    autocmd BufRead *.html set filetype=htmldjango
    " markdown
    augroup mkd
        autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:>
    augroup END

endif
" }}}

" NerdTree {{{
nmap <C-n> :NERDTreeFind<CR>
let g:NERDChristmasTree = 1
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeWinPos = 'right'
let g:NERDTreeWinSize = 50
let g:NERDTreeChDirMode = 2
let g:NERDTreeShowHidden = 1
let g:NERDTreeAutoCenter = 1
let g:NERDTreeIgnore = ['\.git$', '\.svn$', '\.jpg$', '\.gif$', '\.png$', '\.pyc', '\.DS_Store', '\.swp$', '\.swo$']
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeSortOrder = ['\/$', '*']
let g:NERDTreeShowLineNumbers = 1
let g:NERDTreeMinimalUI = 1
" }}}

" Buffers {{{
" Explore/next/previous: Alt-F12, F12, Shift-F12.
nnoremap <silent> <M-F12> :BufExplorer<CR>
nnoremap <silent> <F12> :bn<CR>
nnoremap <silent> <S-F12> :bp<CR>

nnoremap <leader>b :BufExplorer<CR>
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bp :bp<CR>

" Easy buffer navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" }}}

" Handlebars
let g:mustache_abbreviations = 1

" Airline {{{

let g:airline_powerline_fonts=0
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_fugitive_prefix = ''
let g:airline#extensions#tabline#enabled = 1

" }}}

" CtrlP {{{
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
" }}}

" Custom Functions {{{
function! FileSize()
    let bytes = getfsize(expand("%:p"))
    if bytes <= 0
        return ""
    endif
    if bytes < 1024
        return bytes
    else
        return (bytes / 1024) . "K"
    endif
endfunction
" }}}

" Airline {{{
function! AirlineInit()
    let g:airline_section_a = airline#section#create(['mode', ' ', 'branch'])
    let g:airline_section_b = airline#section#create_left(['ffenc', 'hunks', '%f'])
    let g:airline_section_c = airline#section#create(['filetype'])
    let g:airline_section_x = airline#section#create(['%P'])
    let g:airline_section_y = airline#section#create(['%B'])
    let g:airline_section_z = airline#section#create_right(['%l', '%c'])
endfunction
autocmd VimEnter * call AirlineInit()
" }}}

" vim:foldmethod=marker:foldlevel=0
