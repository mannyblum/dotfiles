" Generated by Inspiration at Sweyla
" http://inspiration.sweyla.com/code/seed/914695/

set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "inspiration-914695"

if version >= 700
  hi CursorLine     guibg=#130002
  hi CursorColumn   guibg=#130002
  hi MatchParen     guifg=#91701B guibg=#130002 gui=bold
  hi Pmenu          guifg=#FFFFFF guibg=#323232
  hi PmenuSel       guifg=#FFFFFF guibg=#57D149
endif

" Background and menu colors
hi Cursor           guifg=NONE guibg=#FFFFFF gui=none
hi Normal           guifg=#FFFFFF guibg=#130002 gui=none
hi NonText          guifg=#FFFFFF guibg=#220F11 gui=none
hi LineNr           guifg=#FFFFFF guibg=#2C191B gui=none
hi Normal           guifg=#FFFFFF guibg=#130002 gui=none
hi StatusLine       guifg=#FFFFFF guibg=#202910 gui=italic
hi StatusLineNC     guifg=#FFFFFF guibg=#3B282A gui=none
hi VertSplit        guifg=#FFFFFF guibg=#2C191B gui=none
hi Folded           guifg=#FFFFFF guibg=#130002 gui=none
hi Title            guifg=#57D149 guibg=NONE	gui=bold
hi Visual           guifg=#91701B guibg=#220F11 gui=none
hi SpecialKey       guifg=#BFA456 guibg=#220F11 gui=none

" Syntax highlighting
hi Comment guifg=#57D149 gui=none
hi Constant guifg=#BFA456 gui=none
hi Number guifg=#BFA456 gui=none
hi Identifier guifg=#D24C00 gui=none
hi Statement guifg=#91701B gui=none
hi Function guifg=#C1DAA3 gui=none
hi Special guifg=#6A7B4F gui=none
hi PreProc guifg=#6A7B4F gui=none
hi Keyword guifg=#91701B gui=none
hi String guifg=#9EFF9B gui=none
hi Type guifg=#EBED5E gui=none
hi pythonBuiltin guifg=#D24C00 gui=none
