""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" WINDOW/DISPLAY SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ch=2 " Make command line two lines high
set mousehide " Hide the mouse when typing text
set lines=60
set columns=160

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GUI COLORING
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set gfn=Droid\ Sans\ Mono:h15

syntax enable
set background=dark
colorscheme solarized

"Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59
"set transparency=10

"hi CursorLine gui=underline
"set cursorline
"set cursorcolumn

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GUI SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Don't show toolbar
set guioptions-=T
" Don't show scrolbars
set guioptions-=L
set guioptions-=r
" Use console dialogs for simple choices
set guioptions+=c

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CURSOR
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
hi Cursor guifg=gainsboro guibg=#ff00ff
hi iCursor guifg=#000000 guibg=#00ffff
set guicursor=n-v-c:block-Cursor
set guicursor+=i-ci:ver10-iCursor-blinkwait300-blinkon200-blinkoff150
set guicursor+=n-v-c:blinkon0-Cursor

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MACVIM SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("gui_macvim")
  set transp=5
  set formatoptions-=tc
  let macvim_hig_shift_movement = 1
endif

"Automatically enter fullscreen
if has("gui_running")
    set fuoptions+=maxvert,maxhorz
    au GUIEnter * set fullscreen
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ToggleBackground SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <unique> <F6> <Plug>ToggleBackground
imap <unique> <F6> <Plug>ToggleBackground
vmap <unique> <F6> <Plug>ToggleBackground
