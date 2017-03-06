" Vim color file
" Converted from Textmate theme Pacific Dark using Coloration v0.4.0 (http://github.com/sickill/coloration)

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "Pacific Dark"

hi Cursor ctermfg=59 ctermbg=231 cterm=NONE guifg=#354551 guibg=#f8f8f0 gui=NONE
hi Visual ctermfg=NONE ctermbg=23 cterm=NONE guifg=NONE guibg=#2a3034 gui=NONE
hi CursorLine ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#495761 gui=NONE
hi CursorColumn ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#495761 gui=NONE
hi ColorColumn ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#495761 gui=NONE
hi LineNr ctermfg=109 ctermbg=59 cterm=NONE guifg=#979fa2 guibg=#495761 gui=NONE
hi VertSplit ctermfg=66 ctermbg=66 cterm=NONE guifg=#6e7980 guibg=#6e7980 gui=NONE
hi MatchParen ctermfg=209 ctermbg=NONE cterm=underline guifg=#ff8973 guibg=NONE gui=underline
hi StatusLine ctermfg=231 ctermbg=66 cterm=bold guifg=#f8f8f2 guibg=#6e7980 gui=bold
hi StatusLineNC ctermfg=231 ctermbg=66 cterm=NONE guifg=#f8f8f2 guibg=#6e7980 gui=NONE
hi Pmenu ctermfg=15 ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE gui=NONE
hi PmenuSel ctermfg=NONE ctermbg=23 cterm=NONE guifg=NONE guibg=#2a3034 gui=NONE
hi IncSearch ctermfg=59 ctermbg=222 cterm=NONE guifg=#354551 guibg=#ffe083 gui=NONE
hi Search ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi Directory ctermfg=140 ctermbg=NONE cterm=NONE guifg=#ae9ad3 guibg=NONE gui=NONE
hi Folded ctermfg=66 ctermbg=59 cterm=NONE guifg=#5b798c guibg=#354551 gui=NONE

hi Normal ctermfg=231 ctermbg=59 cterm=NONE guifg=#f8f8f2 guibg=#354551 gui=NONE
hi Boolean ctermfg=140 ctermbg=NONE cterm=NONE guifg=#ae9ad3 guibg=NONE gui=NONE
hi Character ctermfg=140 ctermbg=NONE cterm=NONE guifg=#ae9ad3 guibg=NONE gui=NONE
hi Comment ctermfg=66 ctermbg=NONE cterm=NONE guifg=#5b798c guibg=NONE gui=NONE
hi Conditional ctermfg=209 ctermbg=NONE cterm=NONE guifg=#ff8973 guibg=NONE gui=NONE
hi Constant ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Define ctermfg=209 ctermbg=NONE cterm=NONE guifg=#ff8973 guibg=NONE gui=NONE
hi DiffAdd ctermfg=231 ctermbg=64 cterm=bold guifg=#f8f8f2 guibg=#498915 gui=bold
hi DiffDelete ctermfg=88 ctermbg=NONE cterm=NONE guifg=#8e0e10 guibg=NONE gui=NONE
hi DiffChange ctermfg=231 ctermbg=23 cterm=NONE guifg=#f8f8f2 guibg=#2b486c gui=NONE
hi DiffText ctermfg=231 ctermbg=24 cterm=bold guifg=#f8f8f2 guibg=#204a87 gui=bold
hi ErrorMsg ctermfg=59 ctermbg=222 cterm=NONE guifg=#354551 guibg=#ffe083 gui=NONE
hi WarningMsg ctermfg=59 ctermbg=222 cterm=NONE guifg=#354551 guibg=#ffe083 gui=NONE
hi Float ctermfg=140 ctermbg=NONE cterm=NONE guifg=#ae9ad3 guibg=NONE gui=NONE
hi Function ctermfg=186 ctermbg=NONE cterm=NONE guifg=#c5e88c guibg=NONE gui=NONE
hi Identifier ctermfg=152 ctermbg=NONE cterm=NONE guifg=#a4cccb guibg=NONE gui=italic
hi Keyword ctermfg=209 ctermbg=NONE cterm=NONE guifg=#ff8973 guibg=NONE gui=NONE
hi Label ctermfg=222 ctermbg=NONE cterm=NONE guifg=#ffe083 guibg=NONE gui=NONE
hi NonText ctermfg=59 ctermbg=59 cterm=NONE guifg=#3b3a32 guibg=#3f4e59 gui=NONE
hi Number ctermfg=140 ctermbg=NONE cterm=NONE guifg=#ae9ad3 guibg=NONE gui=NONE
hi Operator ctermfg=209 ctermbg=NONE cterm=NONE guifg=#ff8973 guibg=NONE gui=NONE
hi PreProc ctermfg=209 ctermbg=NONE cterm=NONE guifg=#ff8973 guibg=NONE gui=NONE
hi Special ctermfg=231 ctermbg=NONE cterm=NONE guifg=#f8f8f2 guibg=NONE gui=NONE
hi SpecialKey ctermfg=59 ctermbg=59 cterm=NONE guifg=#3b3a32 guibg=#495761 gui=NONE
hi Statement ctermfg=209 ctermbg=NONE cterm=NONE guifg=#ff8973 guibg=NONE gui=NONE
hi StorageClass ctermfg=152 ctermbg=NONE cterm=NONE guifg=#a4cccb guibg=NONE gui=italic
hi String ctermfg=222 ctermbg=NONE cterm=NONE guifg=#ffe083 guibg=NONE gui=NONE
hi Tag ctermfg=209 ctermbg=NONE cterm=NONE guifg=#ff8973 guibg=NONE gui=NONE
hi Title ctermfg=231 ctermbg=NONE cterm=bold guifg=#f8f8f2 guibg=NONE gui=bold
hi Todo ctermfg=66 ctermbg=NONE cterm=inverse,bold guifg=#5b798c guibg=NONE gui=inverse,bold
hi Type ctermfg=15 ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE gui=NONE
hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi rubyClass ctermfg=209 ctermbg=NONE cterm=NONE guifg=#ff8973 guibg=NONE gui=NONE
hi rubyFunction ctermfg=186 ctermbg=NONE cterm=NONE guifg=#c5e88c guibg=NONE gui=NONE
hi rubyInterpolationDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubySymbol ctermfg=152 ctermbg=NONE cterm=NONE guifg=#a4cccb guibg=NONE gui=NONE
hi rubyConstant ctermfg=15 ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE gui=italic
hi rubyStringDelimiter ctermfg=222 ctermbg=NONE cterm=NONE guifg=#ffe083 guibg=NONE gui=NONE
hi rubyBlockParameter ctermfg=179 ctermbg=NONE cterm=NONE guifg=#e7a358 guibg=NONE gui=italic
hi rubyInstanceVariable ctermfg=15 ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE gui=NONE
hi rubyInclude ctermfg=152 ctermbg=NONE cterm=NONE guifg=#a4cccb guibg=NONE gui=NONE
hi rubyGlobalVariable ctermfg=15 ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE gui=NONE
hi rubyRegexp ctermfg=222 ctermbg=NONE cterm=NONE guifg=#ffe083 guibg=NONE gui=NONE
hi rubyRegexpDelimiter ctermfg=222 ctermbg=NONE cterm=NONE guifg=#ffe083 guibg=NONE gui=NONE
hi rubyEscape ctermfg=140 ctermbg=NONE cterm=NONE guifg=#ae9ad3 guibg=NONE gui=NONE
hi rubyControl ctermfg=209 ctermbg=NONE cterm=NONE guifg=#ff8973 guibg=NONE gui=NONE
hi rubyClassVariable ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubyOperator ctermfg=209 ctermbg=NONE cterm=NONE guifg=#ff8973 guibg=NONE gui=NONE
hi rubyException ctermfg=152 ctermbg=NONE cterm=NONE guifg=#a4cccb guibg=NONE gui=NONE
hi rubyPseudoVariable ctermfg=15 ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE gui=NONE
hi rubyRailsUserClass ctermfg=15 ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE gui=italic
hi rubyRailsARAssociationMethod ctermfg=152 ctermbg=NONE cterm=NONE guifg=#a4cccb guibg=NONE gui=NONE
hi rubyRailsARMethod ctermfg=152 ctermbg=NONE cterm=NONE guifg=#a4cccb guibg=NONE gui=NONE
hi rubyRailsRenderMethod ctermfg=152 ctermbg=NONE cterm=NONE guifg=#a4cccb guibg=NONE gui=NONE
hi rubyRailsMethod ctermfg=152 ctermbg=NONE cterm=NONE guifg=#a4cccb guibg=NONE gui=NONE
hi erubyDelimiter ctermfg=15 ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE gui=NONE
hi erubyComment ctermfg=66 ctermbg=NONE cterm=NONE guifg=#5b798c guibg=NONE gui=NONE
hi erubyRailsMethod ctermfg=152 ctermbg=NONE cterm=NONE guifg=#a4cccb guibg=NONE gui=NONE
hi htmlTag ctermfg=15 ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE gui=NONE
hi htmlEndTag ctermfg=15 ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE gui=NONE
hi htmlTagName ctermfg=15 ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE gui=NONE
hi htmlArg ctermfg=15 ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE gui=NONE
hi htmlSpecialChar ctermfg=140 ctermbg=NONE cterm=NONE guifg=#ae9ad3 guibg=NONE gui=NONE
hi javaScriptFunction ctermfg=152 ctermbg=NONE cterm=NONE guifg=#a4cccb guibg=NONE gui=italic
hi javaScriptRailsFunction ctermfg=152 ctermbg=NONE cterm=NONE guifg=#a4cccb guibg=NONE gui=NONE
hi javaScriptBraces ctermfg=15 ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE gui=NONE
hi yamlKey ctermfg=209 ctermbg=NONE cterm=NONE guifg=#ff8973 guibg=NONE gui=NONE
hi yamlAnchor ctermfg=15 ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE gui=NONE
hi yamlAlias ctermfg=15 ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE gui=NONE
hi yamlDocumentHeader ctermfg=222 ctermbg=NONE cterm=NONE guifg=#ffe083 guibg=NONE gui=NONE
hi cssURL ctermfg=179 ctermbg=NONE cterm=NONE guifg=#e7a358 guibg=NONE gui=italic
hi cssFunctionName ctermfg=152 ctermbg=NONE cterm=NONE guifg=#a4cccb guibg=NONE gui=NONE
hi cssColor ctermfg=140 ctermbg=NONE cterm=NONE guifg=#ae9ad3 guibg=NONE gui=NONE
hi cssPseudoClassId ctermfg=186 ctermbg=NONE cterm=NONE guifg=#c5e88c guibg=NONE gui=NONE
hi cssClassName ctermfg=186 ctermbg=NONE cterm=NONE guifg=#c5e88c guibg=NONE gui=NONE
hi cssValueLength ctermfg=140 ctermbg=NONE cterm=NONE guifg=#ae9ad3 guibg=NONE gui=NONE
hi cssCommonAttr ctermfg=152 ctermbg=NONE cterm=NONE guifg=#a4cccb guibg=NONE gui=NONE
hi cssBraces ctermfg=15 ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE gui=NONE