"  ▄█    █▄   ▄█    ▄▄▄▄███▄▄▄▄
" ███    ███ ███  ▄██▀▀▀███▀▀▀██▄
" ███    ███ ███▌ ███   ███   ███
" ███    ███ ███▌ ███   ███   ███
" ███    ███ ███▌ ███   ███   ███
" ███    ███ ███  ███   ███   ███
" ███    ███ ███  ███   ███   ███
"  ▀██████▀  █▀    ▀█   ███   █▀


" Pathogen {{{
execute pathogen#infect()
Helptags
" }}}

" Misc {{{
syntax on
filetype plugin indent on
set backspace=indent,eol,start
set omnifunc=syntaxcomplete#Complete
set spell spelllang=en_us
set noswapfile
" }}}

" Colors {{{
"let base16colorspace=256
set t_Co=256
set background=dark
"colorscheme base16-eighties
let g:gruvbox_italic=1
colorscheme gruvbox
" }}}

" Spaces & Tabs {{{
set nosmartindent
set smarttab
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set colorcolumn=80
" }}}

" UI Config {{{
set number
set ruler
set showcmd
set showmatch
set display+=lastline
set mouse=a
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
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
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

""""" break at cursor location
nnoremap K i<CR> <ESC>

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
    autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType less setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab nocindent
    autocmd FileType scss setlocal ts=2 sts=2 sw=2 expandtab
    autocmd BufRead *.j2 set filetype=htmljinja
    autocmd BufRead *.conf set filetype=toml
    " markdown
    augroup mkd
        autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:>
    augroup END

endif
" }}}

" Highlights {{{
highlight htmlArg cterm=italic
highlight sassVariable cterm=italic
highlight xmlAttrib cterm=italic
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
let g:NERDTreeShowLineNumbers = 0
let g:NERDTreeMinimalUI = 1

autocmd vimenter * if !argc() | NERDTree | endif
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

" Handlebars {{{
let g:mustache_abbreviations = 1
" }}}

" Airline {{{

let g:airline_powerline_fonts=1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_fugitive_prefix = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1

" }}}

" ALE {{{
let g:ale_javascript_eslint_use_global=1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_linters = {
\   'javascript': ['eslint']
\}
" }}}

" CtrlP {{{
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
" }}}

" Syntastic {{{
" let g:syntastic_javascript_checkers = ['jshint']
 "let g:syntastic_javascript_checkers = ['eslint']
" }}}

" JSX {{{
" let g:javascript_plugin_flow = 1
let g:jsx_ext_required = 0 " Allow JSX in normal JS Files
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
let g:airline_powerline_fonts=1
let g:airline_theme='gruvbox'
function! AirlineInit()
    "let g:airline_section_a = airline#section#create(['mode', ' ', 'branch'])
    "let g:airline_section_b = airline#section#create_left(['ffenc', 'hunks', '%f'])
    "let g:airline_section_c = airline#section#create(['filetype'])
    "let g:airline_section_x = airline#section#create(['%P'])
    "let g:airline_section_y = airline#section#create(['%B'])
    "let g:airline_section_z = airline#section#create_right(['%l', '%c'])
endfunction
autocmd VimEnter * call AirlineInit()
" }}}

" XML {{{
hi Tag        ctermfg=04
hi xmlTag     ctermfg=04
hi xmlTagName ctermfg=04
hi xmlEndTag  ctermfg=04
" }}}

" JSHINT {{{
let g:JSHintHighlightErrorLine = 0
" }}}

" Numbers {{{
nnoremap <F3> :NumbersToggle<CR>

let g:numbers_exclude = ['nerdtree', 'minibufexpl']
" }}}

" Prettier {{{

" }}}

" UltiSnips {{{
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsUsePythonVersion=2
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"
let g:UltiSnipsEditSplit="vertical"
" }}}

let g:gitgutter_realtime=0
set guifont=Operator\ Mono\ Medium\ Nerd\ Font\ 10
set encoding=utf8
let g:webdevicons_enable=1
let g:webdevicons_enable_nerdtree=1
let g:WebDevIconsUnicodeDecorateFolderNodes=1

" vim:foldmethod=marker:foldlevel=0
