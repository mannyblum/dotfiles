call pathogen#infect()

""""""" General
set number
set ruler
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
"set t_Co=256
"let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme base16-tomorrow
"let g:solarized_termcolors=256
"let g:zenburn_high_Contrast = 1
set background=dark
"colorscheme solarized
"let g:molokai_original = 1
"colorscheme molokai
"colors zenburn
"colors Tomorrow-Night-Bright

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

""""""" Remap jj to ESC
inoremap jj <ESC>

""""""" increase/decrease number remap
nnoremap <A-a> <C-a>
nnoremap <A-x> <C-x>


""""""" Status Line
set laststatus=2

"set statusline=%-.50F " Full path to file, 50 characters max
"set statusline=%{fugitive#statusline()} " fugitive info
"set statusline+=\ (%n) " buffer number
"set statusline+=\ %([%M%R%H%W]\ %) " Modified, Read-only, Help, and Preview flags
"set statusline+=\ %y " Filetype
"set statusline+=\ %#error# " switch to error color
"set statusline+=%* " back to normal color
"set statusline+=\ %#warningmsg# " switch to warningmsg color
"set statusline+=%* " back to normal color
"set statusline+=\ %=%< " Right-align and start truncation
"set statusline+=\ [%04l/%04L\ %03c] " Show current line number, total lines, current column
"set statusline+=\ %{FileSize()}
"set statusline+=\ %p%% " Percentage through file in lines

""""""" Filetype settings
filetype plugin indent on
if has("autocmd")
    autocmd FileType html setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType html setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType xhtml setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType htmldjango.html setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType htmldjango setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType less setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType javascript setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab nocindent
    autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
    autocmd BufRead *.j2 set filetype=htmljinja
    autocmd BufRead *.html set filetype=htmldjango
    " markdown
    augroup mkd
        autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:>
    augroup END

endif

autocmd filetype css setlocal equalprg=csstidy\ -\ --silent=true

nnoremap ,m :w <BAR> !lessc % > %:t:r.css<CR><space>

""""""" Pretty json format
map <leader>jt <Esc>:%!json_xs -f json -t json-pretty<CR>

""""""" Coffeescript
au BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable "fold by indentation
au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab "standard two-space indentation in CoffeeScript

""""""" JSHint
au BufWritePost *.js :JSHint

""""""" NERD_TREE
nmap <F2> :NERDTreeFind<CR>
let g:NERDChristmasTree = 1
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeWinPos = 'right'
let g:NERDTreeWinSize = 30
let g:NERDTreeChDirMode = 2
let g:NERDTreeShowHidden = 1
let g:NERDTreeAutoCenter = 1
let g:NERDTreeIgnore = ['\.git$', '\.svn$', '\.jpg$', '\.gif$', '\.png$', '\.pyc', '\.DS_Store', '\.swp$', '\.swo$']
"let g:NERDTreeShowBookmarks = 1
let g:NERDTreeSortOrder = ['\/$', '*']
let g:NERDTreeShowLineNumbers = 1
let g:NERDTreeMinimalUI = 1

""""""" Buffers - explore/next/previous: Alt-F12, F12, Shift-F12.
nnoremap <silent> <M-F12> :BufExplorer<CR>
nnoremap <silent> <F12> :bn<CR>
nnoremap <silent> <S-F12> :bp<CR>

nnoremap <leader>b :BufExplorer<CR>
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bp :bp<CR>

" Airline {{{

let g:airline_powerline_fonts=0
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_fugitive_prefix = ''

" }}}

"I know it's obvious, but those mappings require FileType (just remove "au FileType " if you don't have it)
"type igm tab to start a module
"I'd like to use zencoding instead of those hacks, but no time for now :)
au FileType javascript inoremap igm<Tab> ig.module(<CR>'game.entities.<C-R>=expand("%:t:r")<CR>'<CR>).requires(<CR>''<CR>).defines(function(){<CR><CR>});<Esc>3k$hi
au FileType javascript inoremap igc<Tab> =ig.Class.extend({<CR>init: function(){<CR><Tab><CR>}<CR>});<Esc>4kI

"will actually insert the filename there, so you won't go crazy figuring out what's missing (but I didn't replace dashes by caps, no time now!)
au FileType javascript inoremap ige<Tab> =ig.Entity.extend({<CR>type:ig.Entity.TYPE.NONE,<CR>checkAgainst:ig.Entity.TYPE.NONE,<CR>collides: ig.Entity.COLLIDES.NEVER,<CR><CR>size:{x:8,y:8},<CR><CR>animSheet: new ig.AnimationSheet( 'media/sprite<C-R>=expand("%:t:r")<CR>.png', 8, 8 ),<CR><CR>init: function(x,y,settings){<CR>this.parent( x, y, settings );<CR>this.addAnim( 'idle', 1, [0] );<CR>},<CR><CR>update: function(){<CR>this.parent();<CR>}<CR>});<Esc>17kI<C-R>=expand("%:t:r")<CR><Esc>bguw~l<Esc>IEntity


" get filesize
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

function! AirlineInit()
    let g:airline_section_a = airline#section#create(['mode', ' ', 'branch'])
    let g:airline_section_b = airline#section#create_left(['ffenc', 'hunks', '%f'])
    let g:airline_section_c = airline#section#create(['filetype'])
    let g:airline_section_x = airline#section#create(['%P'])
    let g:airline_section_y = airline#section#create(['%B'])
    let g:airline_section_z = airline#section#create_right(['%l', '%c'])
endfunction
autocmd VimEnter * call AirlineInit()
