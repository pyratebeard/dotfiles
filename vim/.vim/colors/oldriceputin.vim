" oldriceputin by pyratebeard (root@pyratbeard.net)

set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name="oldriceputin"

hi ColorColumn  term=NONE cterm=NONE ctermfg=NONE ctermbg=235
hi Comment      term=NONE cterm=NONE ctermfg=240  ctermbg=NONE
hi Constant     term=NONE cterm=NONE ctermfg=14    ctermbg=NONE
hi Conditional  term=NONE cterm=NONE ctermfg=255  ctermbg=NONE
hi Cursor       term=NONE cterm=NONE ctermfg=242  ctermbg=NONE
hi CursorLine   term=NONE cterm=NONE ctermfg=NONE ctermbg=235
hi DiffAdd      term=NONE cterm=NONE ctermfg=2    ctermbg=237
hi DiffChange   term=NONE cterm=NONE ctermfg=11   ctermbg=237
hi DiffDelete   term=NONE cterm=NONE ctermfg=1    ctermbg=237
hi DiffText     term=NONE cterm=NONE ctermfg=1    ctermbg=235
hi Directory    term=NONE cterm=NONE ctermfg=243   ctermbg=NONE
hi Error        term=NONE cterm=NONE ctermfg=238  ctermbg=1
hi ErrorMsg     term=NONE cterm=NONE ctermfg=1    ctermbg=16
hi FoldColumn   term=NONE cterm=NONE ctermfg=238  ctermbg=NONE
hi Folded       term=NONE cterm=NONE ctermfg=238  ctermbg=NONE
hi Function     term=NONE cterm=NONE ctermfg=13   ctermbg=NONE
hi Identifier   term=NONE cterm=NONE ctermfg=9   ctermbg=NONE
hi IncSearch    term=NONE cterm=NONE ctermfg=237    ctermbg=11
hi MatchParen   term=NONE cterm=NONE ctermfg=7    ctermbg=3
hi NonText      term=NONE cterm=NONE ctermfg=238  ctermbg=NONE
hi Normal       term=NONE cterm=NONE ctermfg=249  ctermbg=NONE
hi Operator     term=NONE cterm=NONE ctermfg=247    ctermbg=NONE
hi PreProc      term=NONE cterm=NONE ctermfg=11   ctermbg=NONE
hi Search       term=NONE cterm=NONE ctermfg=11    ctermbg=241
hi SignColumn   term=NONE cterm=NONE ctermfg=NONE ctermbg=237
hi Special      term=NONE cterm=NONE ctermfg=6    ctermbg=NONE
hi SpecialKey   term=NONE cterm=NONE ctermfg=241    ctermbg=NONE
hi SpellBad     term=NONE cterm=NONE ctermfg=15   ctermbg=1
hi SpellCap     term=NONE cterm=NONE ctermfg=15   ctermbg=4
hi Statement    term=NONE cterm=NONE ctermfg=255  ctermbg=NONE
hi StatusLine   term=NONE cterm=NONE ctermfg=238  ctermbg=NONE
hi String       term=NONE cterm=NONE ctermfg=12   ctermbg=NONE
hi TabLineSel   term=NONE cterm=NONE ctermfg=251  ctermbg=NONE
hi Todo         term=NONE cterm=NONE ctermfg=250  ctermbg=1
hi Type         term=NONE cterm=NONE ctermfg=247    ctermbg=NONE
hi htmlString   term=NONE cterm=NONE ctermfg=15  ctermbg=NONE
hi htmlTagName   term=NONE cterm=NONE ctermfg=255  ctermbg=NONE
hi VertSplit    term=NONE cterm=NONE ctermfg=236  ctermbg=0
hi Visual       term=NONE cterm=NONE ctermfg=16   ctermbg=11
hi WarningMsg   term=NONE cterm=NONE ctermfg=1    ctermbg=NONE
hi LineNr       term=NONE cterm=NONE ctermfg=244  ctermbg=237
hi CursorLineNr term=NONE cterm=NONE ctermfg=1  ctermbg=235
hi Pmenu        term=NONE cterm=NONE ctermfg=0  ctermbg=244
hi PmenuSel     term=NONE cterm=NONE ctermfg=0    ctermbg=10
hi PmenuSbar    term=NONE cterm=NONE ctermfg=238  ctermbg=241
hi PmenuThumb   term=NONE cterm=NONE ctermfg=238  ctermbg=13
hi Underlined   term=underline cterm=underline ctermfg=NONE   ctermbg=NONE

hi! link diffAdded       DiffAdd
hi! link diffRemoved     DiffDelete
hi! link diffChanged     DiffChange
hi! link StatusLineNC    StatusLine
hi! link Title           Normal
hi! link MoreMsg         Normal
hi! link Question        DiffChange
hi! link TabLine         StatusLineNC
hi! link TabLineFill     StatusLineNC
hi! link VimHiGroup      VimGroup
