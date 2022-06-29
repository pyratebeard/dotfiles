"  ███▄ ▄███▓ █    ██ ▄▄▄█████▓ ██▓ ███▄    █▓██   ██▓
" ▓██▒▀█▀ ██▒ ██  ▓██▒▓  ██▒ ▓▒▓██▒ ██ ▀█   █ ▒██  ██▒
" ▓██    ▓██░▓██  ▒██░▒ ▓██░ ▒░▒██▒▓██  ▀█ ██▒ ▒██ ██░
" ▒██    ▒██ ▓▓█  ░██░░ ▓██▓ ░ ░██░▓██▒  ▐▌██▒ ░ ▐██▓░
" ▒██▒   ░██▒▒▒█████▓   ▒██▒ ░ ░██░▒██░   ▓██░ ░ ██▒▓░
" ░ ▒░   ░  ░░▒▓▒ ▒ ▒   ▒ ░░   ░▓  ░ ▒░   ▒ ▒   ██▒▒▒
" ░  ░      ░░░▒░ ░ ░     ░     ▒ ░░ ░░   ░ ▒░▓██ ░▒░
" ░      ░    ░░░ ░ ░   ░       ▒ ░   ░   ░ ░ ▒ ▒ ░░
"        ░      ░               ░           ░ ░ ░
"                                             ░ ░
" mutiny by pyratebeard (https://git.pyratebeard.net/?p=mutiny)
"  └─ inspired by sourcerer by xero (https://sourcerer.xero.nu)

set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name="mutiny"

hi ColorColumn  term=NONE cterm=NONE ctermfg=NONE ctermbg=234
hi Comment      term=NONE cterm=NONE ctermfg=5    ctermbg=NONE
hi Constant     term=NONE cterm=NONE ctermfg=3    ctermbg=NONE
hi Conditional  term=NONE cterm=NONE ctermfg=255  ctermbg=NONE
hi Cursor       term=NONE cterm=NONE ctermfg=242  ctermbg=NONE
hi CursorLine   term=NONE cterm=NONE ctermfg=NONE ctermbg=235
hi DiffAdd      term=NONE cterm=NONE ctermfg=2    ctermbg=235
hi DiffChange   term=NONE cterm=NONE ctermfg=11   ctermbg=235
hi DiffDelete   term=NONE cterm=NONE ctermfg=1    ctermbg=235
hi DiffText     term=NONE cterm=NONE ctermfg=1    ctermbg=235
hi Directory    term=NONE cterm=NONE ctermfg=4    ctermbg=NONE
hi Error        term=NONE cterm=NONE ctermfg=238  ctermbg=1
hi ErrorMsg     term=NONE cterm=NONE ctermfg=1    ctermbg=16
hi FoldColumn   term=NONE cterm=NONE ctermfg=238  ctermbg=NONE
hi Folded       term=NONE cterm=NONE ctermfg=238  ctermbg=NONE
hi Function     term=NONE cterm=NONE ctermfg=14   ctermbg=NONE
hi Identifier   term=NONE cterm=NONE ctermfg=13   ctermbg=NONE
hi IncSearch    term=NONE cterm=NONE ctermfg=0    ctermbg=3
hi MatchParen   term=NONE cterm=NONE ctermfg=0    ctermbg=1
hi NonText      term=NONE cterm=NONE ctermfg=238  ctermbg=NONE
hi Normal       term=NONE cterm=NONE ctermfg=249  ctermbg=NONE
hi PreProc      term=NONE cterm=NONE ctermfg=10   ctermbg=NONE
hi Search       term=NONE cterm=NONE ctermfg=0    ctermbg=11
hi SignColumn   term=NONE cterm=NONE ctermfg=NONE ctermbg=235
hi Special      term=NONE cterm=NONE ctermfg=2    ctermbg=NONE
hi SpecialKey   term=NONE cterm=NONE ctermfg=3    ctermbg=NONE
hi SpellBad     term=NONE cterm=NONE ctermfg=15   ctermbg=1
hi SpellCap     term=NONE cterm=NONE ctermfg=15   ctermbg=4
hi Statement    term=NONE cterm=NONE ctermfg=251  ctermbg=NONE
hi StatusLine   term=NONE cterm=NONE ctermfg=238  ctermbg=NONE
hi String       term=NONE cterm=NONE ctermfg=11   ctermbg=NONE
hi TabLineSel   term=NONE cterm=NONE ctermfg=251  ctermbg=NONE
hi Todo         term=NONE cterm=NONE ctermfg=3    ctermbg=5
hi Type         term=NONE cterm=NONE ctermfg=4    ctermbg=NONE
hi VertSplit    term=NONE cterm=NONE ctermfg=236  ctermbg=0
hi Visual       term=NONE cterm=NONE ctermfg=16   ctermbg=11
hi WarningMsg   term=NONE cterm=NONE ctermfg=1    ctermbg=NONE
hi LineNr       term=NONE cterm=NONE ctermfg=241  ctermbg=235
hi CursorLineNr term=NONE cterm=NONE ctermfg=241  ctermbg=233
hi Pmenu        term=NONE cterm=NONE ctermfg=249  ctermbg=235
hi PmenuSel     term=NONE cterm=NONE ctermfg=3    ctermbg=5
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
