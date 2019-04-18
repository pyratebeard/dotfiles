" venganza by pyratebeard

set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name="venganza"

hi ColorColumn  term=NONE cterm=NONE ctermfg=NONE ctermbg=0
hi Comment      term=NONE cterm=NONE ctermfg=10   ctermbg=NONE
hi Constant     term=NONE cterm=NONE ctermfg=3    ctermbg=NONE
hi Conditional  term=NONE cterm=NONE ctermfg=4    ctermbg=NONE
hi Cursor       term=NONE cterm=NONE ctermfg=15   ctermbg=NONE
hi CursorLine   term=NONE cterm=NONE ctermfg=NONE ctermbg=0
hi DiffAdd      term=NONE cterm=NONE ctermfg=8    ctermbg=4
hi DiffChange   term=NONE cterm=NONE ctermfg=8    ctermbg=3
hi DiffDelete   term=NONE cterm=NONE ctermfg=1    ctermbg=8
hi DiffText     term=NONE cterm=NONE ctermfg=1    ctermbg=8
hi Directory    term=NONE cterm=NONE ctermfg=7    ctermbg=NONE
hi Error        term=NONE cterm=NONE ctermfg=1    ctermbg=NONE
hi ErrorMsg     term=NONE cterm=NONE ctermfg=0    ctermbg=1
hi FoldColumn   term=NONE cterm=NONE ctermfg=238  ctermbg=NONE
hi Folded       term=NONE cterm=NONE ctermfg=238  ctermbg=NONE
hi Function     term=NONE cterm=NONE ctermfg=2    ctermbg=NONE
hi Identifier   term=NONE cterm=NONE ctermfg=7    ctermbg=NONE
hi IncSearch    term=NONE cterm=NONE ctermfg=0    ctermbg=14
hi MatchParen   term=NONE cterm=NONE ctermfg=1    ctermbg=NONE
hi NonText      term=NONE cterm=NONE ctermfg=238  ctermbg=NONE
hi Normal       term=NONE cterm=NONE ctermfg=15   ctermbg=NONE
hi PreProc      term=NONE cterm=NONE ctermfg=7    ctermbg=NONE
hi Search       term=NONE cterm=NONE ctermfg=0    ctermbg=14
hi Special      term=NONE cterm=NONE ctermfg=7    ctermbg=NONE
hi SpecialKey   term=NONE cterm=NONE ctermfg=238  ctermbg=NONE
hi SpellBad     term=NONE cterm=NONE ctermfg=1    ctermbg=8
hi Statement    term=NONE cterm=NONE ctermfg=5    ctermbg=NONE
hi StatusLine   term=NONE cterm=NONE ctermfg=8    ctermbg=0
hi String       term=NONE cterm=NONE ctermfg=6    ctermbg=NONE
hi TabLineSel   term=NONE cterm=NONE ctermfg=251  ctermbg=NONE
hi Todo         term=NONE cterm=NONE ctermfg=251  ctermbg=66
hi Type         term=NONE cterm=NONE ctermfg=15   ctermbg=NONE
hi VertSplit    term=NONE cterm=NONE ctermfg=0    ctermbg=0
hi Visual       term=NONE cterm=NONE ctermfg=0    ctermbg=6
hi WarningMsg   term=NONE cterm=NONE ctermfg=242  ctermbg=NONE
hi LineNr       term=NONE cterm=NONE ctermfg=8    ctermbg=NONE
hi CursorLineNr term=NONE cterm=NONE ctermfg=3    ctermbg=0
hi Pmenu        term=NONE cterm=NONE ctermfg=7    ctermbg=8
hi PmenuSel     term=NONE cterm=NONE ctermfg=15   ctermbg=4
hi PmenuSbar    term=NONE cterm=NONE ctermfg=238  ctermbg=14
hi PmenuThumb   term=NONE cterm=NONE ctermfg=238  ctermbg=66
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
