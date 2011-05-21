""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PATHOGEN
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off
call pathogen#runtime_append_all_bundles()
"call pathogen#helptags()

set nocompatible
set cpoptions=aABceFsmq
"set autochdir
set nostartofline " don't jump to the first character when paging
set title
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set ttyfast
let mapleader = ','
let g:mapleader = ','
let localleader = ','
let g:localleader = ','
let leader = ','
let g:leader = ','

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" DISPLAY
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ruler
set number
set showcmd
set laststatus=2
set winminheight=0
set winminwidth=0
set winheight=10
set display+=lastline
set textwidth=0
set columns=90
set wrapmargin=10
set numberwidth=5
"set relativenumber

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BEHAVIOR
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoread
set noautowrite
set visualbell
set t_vb= " visual bell
set shellcmdflag=-c
set shell=bash\ -l
set modeline
set modelines=5
set tabpagemax=100
set mousemodel=extend
set mouse=a
set ttymouse=xterm2
set noea
set shortmess=aOstTI " shortens messages to avoid 'press a key' prompt
set magic
set viminfo='10,\"100,:20,%,n~/.viminfo
set confirm
set report=0
set smartcase

" Saving sessions
set sessionoptions=buffers,folds,tabpages

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TEXT EDITING
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set imd
set wildmenu
set wildmode=list:longest,full
set wildignore+=*.o,*~,.lo,*.pyc,*.bak,*.jpg,*.png,*.gif
set whichwrap=b,s,h,l,<,>,~,[,] "everything wraps
set undolevels=5000
set autoindent
set preserveindent
set nosmartindent
set smarttab
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set wrap
set formatoptions=lcroqwan2vb1
set showmatch
set matchtime=5
set list
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬,trail:-
set showbreak=…
set encoding=utf-8 fileencodings=.
set showfulltag
set completeopt=longest,menuone,preview

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FOLDS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set foldmethod=indent
set foldmethod=manual
set foldenable
set foldopen=block,hor,mark,percent,quickfix,tag
set foldminlines=2
set fillchars+=fold:\
set foldcolumn=2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BUFFERS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
set bufhidden=hide
set hidden " you can change buffers without saving
set switchbuf=usetab
set splitright
set scrolloff=2
set sidescrolloff=2
set showtabline=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLORS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
colorscheme wombat256
set background=dark
set colorcolumn=80
hi NonText ctermfg=7 guifg=gray
hi SpecialKey ctermfg=8

" Use the below highlight group when displaying bad whitespace is desired.
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" full Python syntax highlighting
let python_highlight_all=1
let g:pyflakes_use_quickfix=0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" STATUS LINE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2

set statusline=%-.50F " Full path to file, 50 characters max
set statusline+=\ %{fugitive#statusline()} " Fugitive status line
set statusline+=\ %{g:HgStatusForFile()} " Thermometer status line
set statusline+=\ (%n) " buffer number
set statusline+=\ %([%M%R%H%W]\ %) " Modified, Read-only, Help, and Preview flags
set statusline+=\ %y " Filetype
set statusline+=\ %#error# " switch to error color
set statusline+=%{StatuslineTabWarning()} " show warning about mixed tabs or bad &et
set statusline+=%{StatuslineTrailingSpaceWarning()} " show warning about trailing whitespace
"set statusline+=%{StatuslineLongLineWarning()} " show warning about long 
"lines
set statusline+=%* " back to normal color
set statusline+=\ %#warningmsg# " switch to warningmsg color
set statusline+=%{SyntasticStatuslineFlag()} " show Syntastic flag
set statusline+=%* " back to normal color
set statusline+=\ %=%< " Right-align and start truncation
set statusline+=%{TagInStatusLine()} " Show current class/function in Python
set statusline+=\ [%04l/%04L\ %03c] " Show current line number, total lines, current column
set statusline+=\ %p%% " Percentage through file in lines

" recalculate the warning flags when idle and after writing
autocmd cursorhold,bufwritepost * unlet! b:statusline_tab_warning
autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning
autocmd cursorhold,bufwritepost * unlet! b:statusline_long_line_warning

" return '[mixed]' if spaces and tabs are used to indent
" return an empty string if everything is fine
function! StatuslineTabWarning()
    if !exists("b:statusline_tab_warning")
        let tabs = search('^\t', 'nw') != 0
        let spaces = search('^ ', 'nw') != 0

        if tabs && spaces
            let b:statusline_tab_warning = '[mixed]'
        else
            let b:statusline_tab_warning = ''
        endif
    endif
    return b:statusline_tab_warning
endfunction

" return '[\s]' if trailing white space is detected
" return '' otherwise
function! StatuslineTrailingSpaceWarning()
    if !exists("b:statusline_trailing_space_warning")
        let tabs = search('\t\+$', 'nw') != 0
        let spaces = search('\s\+$', 'nw') != 0
        if tabs || spaces
            let b:statusline_trailing_spaces_warning = '[\s]'
        else
            let b:statusline_trailing_spaces_warning = ''
        endif
    endif
    return b:statusline_trailing_spaces_warning
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SPELLING
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if v:version >= 700
    setlocal spell spelllang=en_us
    nmap <localleader>ss :set spell!<CR>
endif
try
    lang en_US
catch
endtry

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SEARCH
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set incsearch   " do incremental searching
set ignorecase
set infercase
set hlsearch
set showmatch
set diffopt=filler,iwhite
nnoremap / /\v
vnoremap / /\v
set gdefault

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COMMAND-LINE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cno $q <C-\>eDeleteTilSlash()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SETTINGS PER FILETYPE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin on
filetype indent on
if has("autocmd")
    " Syntax of these languages is fussy over tabs Vs spaces
    autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
    autocmd FileType yaml setlocal ts=4 sts=4 sw=4 expandtab

    " Customisations based on house-style (arbitrary)
    autocmd FileType html setlocal ts=4 sts=4 sw=4 noexpandtab nowrap
    autocmd FileType xhtml setlocal ts=4 sts=4 sw=4 noexpandtab nowrap
    autocmd FileType html.django_template setlocal ts=4 sts=4 sw=4 noexpandtab nowrap
    autocmd FileType htmldjango setlocal ts=4 sts=4 sw=4 noexpandtab nowrap
    autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType javascript setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab nocindent
    autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab

    " Treat .rss files as XML
    autocmd BufNewFile,BufRead *.rss setfiletype xml

    " Autodetect todo files
    autocmd BufNewFile,BufRead *.todo setfiletype todo

    " Autodetect Actionscript files
    au BufNewFile,BufRead *.as set filetype=actionscript

    " Automatically strip extraneous whitespace when saving Python or
    " Javascript files.
    " autocmd BufWritePre *.py,*.js :call <SID>StripTrailingWhitespaces()

    " markdown
    augroup mkd
        autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:>
    augroup END

    " JSON syntax
    au! BufRead,BufNewFile *.json setfiletype json

    " jQuery syntax
    au! BufRead,BufNewFile *.js set ft=javascript.jquery

    " Display tabs at the beginning of a line in Python mode as bad
    au BufRead,BufNewFile *.py,*.pyw match ExtraWhitespace /^\t\+/
    " Make trailing whitespace be flagged as bad
    au BufRead,BufNewFile *.py,*.pyw match ExtraWhitespace /\s\+$/
    au BufRead,BufNewFile *.py,*.pyw let python_space_errors = 1
    au BufRead,BufNewfile *.py,*.pyw call s:HighlightLongLines(79)

    " only UNIX line endings.
    au BufNewFile *.* set fileformat=unix

    autocmd BufEnter * :syntax sync fromstart

    autocmd BufRead *.html set filetype=htmldjango
    autocmd BufRead *.py set smartindent cinwords=if,else,elif,for,while,try,except,finally,def,class

    " mapping to mark HTML5 files
    autocmd BufEnter *html nmap <F7> :setfiletype html5<CR>

    if version >= 700
        autocmd FileType python set omnifunc=pythoncomplete#Complete
        autocmd FileType css,sass set omnifunc=csscomplete#CompleteCSS
        autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
        autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
        autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
        autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
        autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
    endif

    " CSS, XML, and HTML file shoulds be folded based on indent
    au BufNewFile,BufRead *css,*xml,*htm* set foldmethod=indent

    " CSS and Sass files should see - as part of a keyword
    au! BufRead,BufNewFile *.sass,*.scss setfiletype sass

    " PHP
    augroup php
        autocmd!
        autocmd FileType php let php_sql_query=1
        autocmd FileType php let php_htmlInString=1
        autocmd FileType php let php_noShortTags=1
        autocmd FileType php let php_folding=1
        autocmd FileType php set omnifunc=phpcomplete#CompletePHP
    augroup END

    " USE GOOGLE'S JAVASCRIPT LINTER
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    au BufNewFile,BufRead *.js set makeprg=gjslint\ %
    au BufNewFile,BufRead *.js set errorformat=%-P-----\ FILE\ \ :\ \ %f\ -----,Line\ %l\\,\ E:%n:\ %m,%-Q,%-GFound\ %s,%-GSome\ %s,%-Gfixjsstyles%s,%-Gscript\ can\ %s,%-G

    " SAVE FILES WHEN VIM LOSES FOCUS
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    autocmd BufLeave,FocusLost *.htm*,*.js,*.css,*.php :wa

endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" KEY MAPPINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Shortcut for square brackets "
onoremap id i[
onoremap ad a[

" Next ()
vnoremap <silent> inb :<C-U>normal! f(vib<cr>
onoremap <silent> inb :<C-U>normal! f(vib<cr>
vnoremap <silent> anb :<C-U>normal! f(vab<cr>
onoremap <silent> anb :<C-U>normal! f(vab<cr>
vnoremap <silent> in( :<C-U>normal! f(vi(<cr>
onoremap <silent> in( :<C-U>normal! f(vi(<cr>
vnoremap <silent> an( :<C-U>normal! f(va(<cr>
onoremap <silent> an( :<C-U>normal! f(va(<cr>

" Next {}
vnoremap <silent> inB :<C-U>normal! f{viB<cr>
onoremap <silent> inB :<C-U>normal! f{viB<cr>
vnoremap <silent> anB :<C-U>normal! f{vaB<cr>
onoremap <silent> anB :<C-U>normal! f{vaB<cr>
vnoremap <silent> in{ :<C-U>normal! f{vi{<cr>
onoremap <silent> in{ :<C-U>normal! f{vi{<cr>
vnoremap <silent> an{ :<C-U>normal! f{va{<cr>
onoremap <silent> an{ :<C-U>normal! f{va{<cr>

" Next []
vnoremap <silent> ind :<C-U>normal! f[vi[<cr>
onoremap <silent> ind :<C-U>normal! f[vi[<cr>
vnoremap <silent> and :<C-U>normal! f[va[<cr>
onoremap <silent> and :<C-U>normal! f[va[<cr>
vnoremap <silent> in[ :<C-U>normal! f[vi[<cr>
onoremap <silent> in[ :<C-U>normal! f[vi[<cr>
vnoremap <silent> an[ :<C-U>normal! f[va[<cr>
onoremap <silent> an[ :<C-U>normal! f[va[<cr>

" Next <>
vnoremap <silent> in< :<C-U>normal! f<vi<<cr>
onoremap <silent> in< :<C-U>normal! f<vi<<cr>
vnoremap <silent> an< :<C-U>normal! f<va<<cr>
onoremap <silent> an< :<C-U>normal! f<va<<cr>

" Next ''
vnoremap <silent> in' :<C-U>normal! f'vi'<cr>
onoremap <silent> in' :<C-U>normal! f'vi'<cr>
vnoremap <silent> an' :<C-U>normal! f'va'<cr>
onoremap <silent> an' :<C-U>normal! f'va'<cr>

" Next ""
vnoremap <silent> in" :<C-U>normal! f"vi"<cr>
onoremap <silent> in" :<C-U>normal! f"vi"<cr>
vnoremap <silent> an" :<C-U>normal! f"va"<cr>
onoremap <silent> an" :<C-U>normal! f"va"<cr>

" CD to directory of current file
map <Leader>cd :cd %:p:h<CR>

" Easily move chunks of text
nnoremap <A-j> :m+<CR>==
nnoremap <A-k> :m-2<CR>==
inoremap <A-j> <Esc>:m+<CR>==gi
inoremap <A-k> <Esc>:m-2<CR>==gi
vnoremap <A-j> :m'>+<CR>gv=gv
vnoremap <A-k> :m-2<CR>gv=gv

" Mac OS X/Safari keybindings for tabs
nmap <D-[> :tabprevious<CR>
nmap <D-]> :tabnext<CR>
map <D-[> :tabprevious<CR>
map <D-]> :tabnext<CR>
imap <D-[> <Esc>:tabprevious<CR>i
imap <D-]> <Esc>:tabnext<CR>i
nmap <D-t> :tabnew<CR>
imap <D-t> <Esc>:tabnew<CR>

" Command-T Bindings

nmap <silent> <Leader>t :CommandT<CR>
nmap <silent> <Leader>b :CommandTBuffer<CR>

" Bind Command-arrow/movement to move between windows
map <D-J> <C-W>j
map <D-S-Down> <C-W>j
map <D-K> <C-W>k
map <D-S-Up> <C-W>k
map <D-H> <C-W>h
map <D-S-Left> <C-W>h
map <D-L> <C-W>l
map <D-S-Right> <C-W>l

map <D-0> <C-W>= " make Command-0 equal windows

nnoremap <leader>w <C-w>v<C-w>l

" If I forgot to sudo a file, do that with :w!!
cmap w!! %!sudo tee > /dev/null %

" Don't use Ex mode, use Q for formatting
nmap Q gq

" Turn hidden characters on/off
nmap <silent> <LocalLeader>s :set nolist!<CR>

" Up/down go visually instead of by physical lines
" Interactive ones need to check whether we're in the autocomplete popup
map <up> gk
"inoremap <up> <C-R>=pumvisible() ? "\<lt>up>" : "\<lt>C-o>gk"<Enter>
map <down> gj
"inoremap <down> <C-R>=pumvisible() ? "\<lt>down>" : "\<lt>C-o>gj"<Enter>

" Map normal mode Enter to add a new line before the current one
nmap <Enter> O<Esc>

" Makes ; work for :
nnoremap ; :

" Makes W send w when it's a command
command! W w

" Deactivate the default F1 behavior of launching VIM help.
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" bind command-]/command-[ to act like TextMate
nmap <D-]> >>
nmap <D-[> <<
vmap <D-]> >gv
vmap <D-[> <gv

" Toggle search highlight
nnoremap <silent> <Leader>ts :silent :set invhlsearch<CR>:set hlsearch?<CR>

" Folds
nnoremap <silent> <Space> @=(foldlevel('.')?'za':'l')<CR>
" set <space> to toggle folds in normal & visual modes
nnoremap <space> za
vnoremap <space> zf

" Searching
nmap n nzzzv
nmap N Nzzzv
nmap * *zzzv
nmap # #zzzv
nmap g* g*zzzv
nmap g# g#zzzv

" Parenthesis/bracket expanding
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a"<esc>`<i"<esc>

" Map auto complete of (, ", ', [
inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>O
inoremap $q ''<esc>i
inoremap $e ""<esc>i

" Mappings for cope
nmap <leader>cc :botright cope<CR>
nmap <leader>n :cn<CR>
nmap <leader>p :cp<CR>
nmap <leader>ll :ll<CR>

" Mapping for tabs/buffers
nmap gz :bdelete<CR>
nmap gb :bnext<CR>
nmap gB :bprev<CR>
nmap <leader>reset :0,3000bd<CR>

" Sort CSS files alphabetically
nmap sort :g#\({\n\)\@<=#.,/}/sort<CR>

" Make <leader>ft fold an HTML tag
nnoremap <leader>ft Vatzf

" Sort CSS properties
nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>

" Reselect just-pasted text
nnoremap <leader>v V`]

" In addition to <esc>, jj will exit to normal mode.
inoremap jj <ESC>

" Cmd-/ for comment toggle.
nnoremap <D-/> :TComment<CR>
vnoremap <D-/> :TComment<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" RAGTAG
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <M-o>       <Esc>o
inoremap <C-j>       <Down>
let g:ragtag_global_maps = 1

" TASKLIST
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>td <Plug>TaskList

" VIMWIKI
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>tt <Plug>VimwikiToggleListItem
let g:vimwiki_list= [{'path': '~/Dropbox/App\ Data/vimwiki/', 'path_html': '~/Dropbox/Public/vimwiki/', 'ext': '.txt'}]

" ZENCODING
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:user_zen_expandabbr_key = '<c-e>'

" GUNDO
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <F4> :GundoToggle<CR>

" NERD_COMMENTER
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <D-/> ,c<space>
vmap <D-/> ,c<space>
imap <D-/> <C-O>,c<space>

" NERD_TREE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <Leader>d :NERDTreeFind<CR>
let g:NERDChristmasTree = 1
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeWinPos = 'right'
let g:NERDTreeChDirMode = 2
let g:NERDTreeShowHidden = 1
let g:NERDTreeAutoCenter = 1
let g:NERDTreeIgnore = ['\.git$', '\.svn$', '\.jpg$', '\.gif$', '\.png$', '\.pyc', '\.DS_Store', '^\._']
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeSortOrder = ['\/$', '*']
let g:NERDTreeShowLineNumbers = 1
map <F2> :NERDTreeToggle<CR>

" VIMTODO
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:todo_done_file = 'done.txt'

" SYNTASTIC
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" use signs to indicate lines with errors
" only if signs are available
if has('signs')
    let g:syntastic_enable_signs = 1
endif
"let g:syntastic_enable_signs = 1

" automatically open the location list when a buffer has errors
let g:syntastic_auto_loc_list = 1

" always show warnings
let g:syntastic_quiet_warnings = 0

" ignore djangohtml
let g:syntastic_disabled_filetypes = ['htmldjango', 'txt', 'text', 'tumblr', 'css']

" FUGITIVE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gc :Gcommit<CR>

" BUFEXPLORER
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:bufExplorerSortBy = 'mru'
let g:bufExplorerSplitBelow = 1
let g:bufExplorerSplitRight = 1
let g:bufExplorerDefaultHelp = 0
let g:bufExplorerShowRelativePath = 1

" MINIBUFEXPL
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FUNCTIONS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" HIGHLIGHT LONG LINES
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! -nargs=? HighlightLongLines call s:HighlightLongLines('<args>')
function! s:HighlightLongLines(width)
    let targetWidth = a:width != '' ? a:width : 79
    if targetWidth > 0
        exec 'match Error /\%>' . (targetWidth) . 'v/'
    else
        echomsg "Usage: HighlightLongLines [natural number]"
    endif
endfunction
nmap <leader>h :HighlightLongLines<CR>

" SEARCH FOR VISUAL SELECTION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction

vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR>

" STAB: SET TABSTOPS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set tabstop, softtabstop and shiftwidth to the same value
command! -nargs=* Stab call Stab()
function! Stab()
    let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
    if l:tabstop > 0
        let &l:sts = l:tabstop
        let &l:ts = l:tabstop
        let &l:sw = l:tabstop
    endif
    call SummarizeTabs()
endfunction

function! SummarizeTabs()
    try
        echohl ModeMsg
        echon 'tabstop='.&l:ts
        echon ' shiftwidth='.&l:sw
        echon ' softtabstop='.&l:sts
        if &l:et
            echon ' expandtab'
        else
            echon ' noexpandtab'
        end
    finally
        echohl None
    endtry
endfunction

" STRIP TRAILING WHITESPACE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

nnoremap <silent> <F5> :call <SID>StripTrailingWhitespaces()<CR>

" DISPLAY OUTPUT OF SHELL COMMANDS IN SCRATCH BUFFER
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  let isfirst = 1
  let words = []
  for word in split(a:cmdline)
    if isfirst
      let isfirst = 0  " don't change first word (shell command)
    else
      if word[0] =~ '\v[%#<]'
        let word = expand(word)
      endif
      let word = shellescape(word, 1)
    endif
    call add(words, word)
  endfor
  let expanded_cmdline = join(words)
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  silent execute '$read !'. expanded_cmdline
  1
endfunction

func! Cwd()
    let cwd = getcwd()
    return "e " . cwd
endfunc

func! DeleteTilSlash()
    let g:cmd = getcmdline()
    let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*", "\\1", "")
    if g:cmd == g:cmd_edited
        let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*/", "\\1", "")
    endif
    return g:cmd_edited
endfunc

func! CurrentFileDir(cmd)
    return a:cmd . " " . expand("%:p:h") . "/"
endfunc

func! CurDir()
    let curdir = substitute(getcwd(), '/Users/kennethlove', "~/", "g")
    return curdir
endfunc

function! Todos()
    bel sp ~/Dropbox/Winners/Tasks/todo/shared.todo
    set ft=todo
    resize 10
endfunction
nnoremap <leader>todo :call Todos()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISCELLANEOUS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This beauty remembers where you were the last time you edited the file, and returns to the same position.
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
