" NEVERNESS colour scheme
" Author:      Yann GOLANSKI
" Version:     1.0
" Last Change: 22 May 2006
" url http://web.njit.edu/~kevin/rgb.txt.html

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = 'me'

" Comments: darkgray
hi Comment        ctermfg=darkgray ctermbg=black  guifg=#848484 guibg=#000000 gui=none 

" Constants: SkyBlue
hi Boolean        ctermfg=gray      ctermbg=black  guifg=#87ceeb guibg=#000000 gui=none
hi Character      ctermfg=gray      ctermbg=black  guifg=#87ceeb guibg=#000000 gui=none
hi Constant       ctermfg=gray      ctermbg=black  guifg=#87ceeb guibg=#000000 gui=none
hi Float          ctermfg=gray      ctermbg=black  guifg=#87ceeb guibg=#000000 gui=none
hi Number         ctermfg=gray      ctermbg=black  guifg=#87ceeb guibg=#000000 gui=none
hi String         ctermfg=250      ctermbg=black  guifg=#87ceeb guibg=#000000 gui=none

" Identifier: SteelBlue1
hi Identifier     ctermfg=LightCyan ctermbg=black  guifg=#63b8ff guibg=#000000 gui=none
hi Function       ctermfg=LightCyan ctermbg=black  guifg=#63b8ff guibg=#000000 gui=none

" Statement: SteelBlue
hi Conditional    ctermfg=61  ctermbg=black  guifg=#4682b4 guibg=#000000 gui=bold
hi Exception      ctermfg=61  ctermbg=black  guifg=#4682b4 guibg=#000000 gui=bold
hi Keyword        ctermfg=61  ctermbg=black  guifg=#4682b4 guibg=#000000 gui=bold
hi Label          ctermfg=61  ctermbg=black  guifg=#4682b4 guibg=#000000 gui=bold
hi Operator       ctermfg=61  ctermbg=black  guifg=#4682b4 guibg=#000000 gui=bold
hi Repeat         ctermfg=61  ctermbg=black  guifg=#4682b4 guibg=#000000 gui=bold
hi Statement      ctermfg=61  ctermbg=black  guifg=#4682b4 guibg=#000000 gui=bold

" PreProc: DarkOrchid1
hi PreProc        ctermfg=DarkGreen ctermbg=black  guifg=#bf3eff guibg=#000000 gui=none
hi Include        ctermfg=DarkGreen ctermbg=black  guifg=#bf3eff guibg=#000000 gui=none
hi Define         ctermfg=DarkGreen ctermbg=black  guifg=#bf3eff guibg=#000000 gui=none
hi Macro          ctermfg=DarkGreen ctermbg=black  guifg=#bf3eff guibg=#000000 gui=none
hi PreCondit      ctermfg=DarkGreen ctermbg=black  guifg=#bf3eff guibg=#000000 gui=none

" Type: orchid2
hi Type           ctermfg=DarkGreen ctermbg=black  guifg=#ee7ae9 guibg=#000000 gui=bold
hi StorageClass   ctermfg=DarkGreen ctermbg=black  guifg=#ee7ae9 guibg=#000000 gui=bold
hi Structure      ctermfg=DarkGreen ctermbg=black  guifg=#ee7ae9 guibg=#000000 gui=bold
hi Typedef        ctermfg=DarkGreen ctermbg=black  guifg=#ee7ae9 guibg=#000000 gui=bold

" Special: cyan2
hi Special        ctermfg=DarkGray  ctermbg=black  guifg=#00eeee guibg=#000000 gui=none
hi SpecialChar    ctermfg=DarkGray  ctermbg=black  guifg=#00eeee guibg=#000000 gui=none
hi Tag            ctermfg=DarkGray  ctermbg=black  guifg=#00eeee guibg=#000000 gui=none
hi SpecialComment ctermfg=DarkGray  ctermbg=black  guifg=#00eeee guibg=#000000 gui=none
hi Delimiter      ctermfg=DarkGray  ctermbg=black  guifg=#00eeee guibg=#000000 gui=none
hi Debug          ctermfg=DarkGray  ctermbg=black  guifg=#00eeee guibg=#000000 gui=none

" Underline: NavajoWhite2
hi Underlined     ctermfg=LightGray ctermbg=black  guifg=#eecfa1 guibg=#000000 gui=none

" Ignore: black
hi Ignore         ctermfg=LightGray ctermbg=black  guifg=#ffffff guibg=#000000 gui=none

" Error: red
hi Error          ctermfg=LightGray ctermbg=black  guifg=#ff0000 guibg=#232323 gui=bold

" To do: SlateGray3
hi Todo           ctermfg=LightMagenta ctermbg=black  guifg=#9fb6cd guibg=#232323 gui=none

" Others:  These are "highlight-groups" and "highlight-default" in help section.
hi Cursor         guifg=#43705a guibg=#e6fff3 gui=none
hi DiffAdd        guifg=#e6fff3 guibg=#43705a gui=bold
hi DiffChange     guifg=#e6fff3 guibg=#43705a gui=none
hi DiffDelete     guifg=#e6fff3 guibg=#43705a gui=none
hi DiffText       guifg=#000000 guibg=#e6fff3 gui=bold
hi Directory      guifg=#e6fff3 guibg=#000000 gui=none
hi ErrorMsg       guifg=#e6fff3 guibg=#61a181 gui=bold
hi FoldColumn     guifg=#9bcfb5 guibg=#43705a gui=bold
hi Folded         guifg=#9bcfb5 guibg=#43705a gui=bold
hi IncSearch      guifg=#1d3026 guibg=#61a181 gui=bold
hi lCursor        guifg=#43705a guibg=#e6fff3 gui=none
hi LineNr         ctermfg=DarkMagenta ctermbg=black  guifg=#9bcfb5 guibg=#000000 gui=bold
hi ModeMsg        guifg=#9bcfb5 guibg=#000000 gui=bold
hi MoreMsg        guifg=#9bcfb5 guibg=#000000 gui=bold
hi NonText        guifg=#c0c0c0 guibg=#000000 gui=bold
hi Normal         guifg=#ffffff guibg=#000000 gui=none
hi Question       guifg=#9bcfb5 guibg=#000000 gui=bold
hi Search         guifg=#1d3026 guibg=#61a181 gui=bold
hi SpecialKey     guifg=#9bcfb5 guibg=#000000 gui=none
hi StatusLine     guifg=#e6fff3 guibg=#61a181 gui=bold
hi StatusLineNC   guifg=#1d3026 guibg=#61a181 gui=bold
hi Title          guifg=#e6fff3 guibg=#1d3026 gui=bold
hi VertSplit      guifg=#61a181 guibg=#61a181 gui=none
hi Visual         guifg=#e6fff3 guibg=#61a181 gui=none
hi VisualNOS      guifg=#9bcfb5 guibg=#000000 gui=none
hi WarningMsg     guifg=#1d3026 guibg=#61a181 gui=bold
hi WildMenu       guifg=#43705a guibg=#e6fff3 gui=none

" Spelling...
hi SpellBad    ctermfg=DarkRed    ctermbg=black
hi SpellCap    ctermfg=DarkBlue   ctermbg=black
hi SpellRare   ctermfg=DarkYellow ctermbg=black
hi SpellLocal  ctermfg=DarkGreen  ctermbg=black
