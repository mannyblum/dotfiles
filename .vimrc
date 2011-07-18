""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PATHOGEN
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" DISPLAY
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ruler
set number
set showcmd
set laststatus=2
set display+=lastline

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BEHAVIOR
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set sessionoptions=buffers,folds,tabpages

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TEXT EDITING
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
" COLORS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
set t_Co=256
colorscheme desert256
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
set statusline+=\ %{fugitive#statusline()} " Fugitive status
set statusline+=\ %{g:HgStatusForFile()} " Thermometer status line
set statusline+=\ (%n) " buffer number
set statusline+=\ %([%M%R%H%W]\ %) " Modified, Read-only, Help, and Preview flags
set statusline+=\ %y " Filetype
set statusline+=\ %#error# " switch to error color
"set statusline+=%{StatuslineTabWarning()} " show warning about mixed tabs or bad &et
"set statusline+=%{StatuslineTrailingSpaceWarning()} " show warning about trailing whitespace
set statusline+=%* " back to normal color
set statusline+=\ %#warningmsg# " switch to warningmsg color
"set statusline+=%{SyntasticStatuslineFlag()} " show Syntastic flag
set statusline+=%* " back to normal color
set statusline+=\ %=%< " Right-align and start truncation
set statusline+=\ [%04l/%04L\ %03c] " Show current line number, total lines, current column
set statusline+=\ %p%% " Percentage through file in lines

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" KEY MAPPINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" CD to directory of current file
map <Leader>cd :cd %:p:h<CR>

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
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l

map <D-0> <C-W>= " make Command-0 equal windows

nnoremap <leader>w <C-w>v<C-w>l

" If I forgot to sudo a file, do that with :w!!
cmap w!! %!sudo tee > /dev/null %

" Don't use Ex mode, use Q for formatting
nmap Q gq

" Turn hidden characters on/off
nmap <silent> <LocalLeader>s :set nolist!<CR>

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

" Mappings for cope
nmap <leader>cc :botright cope<CR>
nmap <leader>n :cn<CR>
nmap <leader>p :cp<CR>
nmap <leader>ll :ll<CR>

" Make <leader>ft fold an HTML tag
nnoremap <leader>ft Vatzf

" In addition to <esc>, jj will exit to normal mode.
inoremap jj <ESC>

" Cmd-/ for comment toggle.
nnoremap <D-/> :TComment<CR>
vnoremap <D-/> :TComment<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ZENCODING
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:user_zen_expandabbr_key = '<c-e>'

" NERD_TREE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <Leader>d :NERDTreeFind<CR>
let g:NERDChristmasTree = 1
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeWinPos = 'left'
let g:NERDTreeChDirMode = 2
let g:NERDTreeShowHidden = 1
let g:NERDTreeAutoCenter = 1
let g:NERDTreeIgnore = ['\.git$', '\.svn$', '\.jpg$', '\.gif$', '\.png$', '\.pyc', '\.DS_Store', '^\._']
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeSortOrder = ['\/$', '*']
let g:NERDTreeShowLineNumbers = 1
map <F2> :NERDTreeToggle<CR>

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FUNCTIONS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISCELLANEOUS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This beauty remembers where you were the last time you edited the file, and returns to the same position.
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
