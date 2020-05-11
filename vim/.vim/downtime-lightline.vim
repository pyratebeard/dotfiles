" =============================================================================
" Filename: autoload/lightline/colorscheme/downtime.vim
" Author: pyratebeard
" License: MIT License
" Last Change: 2018/06/25 
" =============================================================================
"let s:base03 = [ '#242424', 235 ]
"let s:base023 = [ '#353535 ', 236 ]
"let s:base02 = [ '#777777 ', 238 ] "cyan
"let s:base01 = [ '#666666', 240 ] "green
"let s:base00 = [ '#666666', 242  ]

let s:base0 = [ '#212021', 0 ] "bg
let s:base1 = [ '#fbf6f6', 7 ] "white
let s:red = [ '#e29e84', 1 ] "red
let s:green = [ '#b6ce63', 2 ] "green
let s:yellow = [ '#d4cd61', 3 ] "yellow
let s:blue = [ '#8fbed3', 4 ] "blue
let s:magenta = [ '#888aa9', 5 ] "magenta
let s:cyan = [ '#cfe063', 6 ] "cyan
let s:grey = [ '#6b6573', 8 ] "grey
let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
" [ [ fg, bg ], [ fg, bg ] ]

" normal
let s:p.normal.left = [ [ s:base1, s:grey ], [ s:base1, s:grey ] ]
let s:p.normal.right = [ [ s:base0, s:base1 ], [ s:base1, s:grey ] ]
let s:p.normal.middle = [ [ s:base0, s:base0 ] ]
let s:p.normal.error = [ [ s:base0, s:red ] ]
let s:p.normal.warning = [ [ s:base0, s:yellow ] ]

" inactive
let s:p.inactive.left =  [ [ s:grey, s:base0 ], [ s:grey, s:base0 ] ]
let s:p.inactive.right = [ [ s:grey, s:base0 ], [ s:grey, s:base0 ] ]
let s:p.inactive.middle = [ [ s:grey, s:base0 ] ]

" insert
let s:p.insert.left = [ [ s:base0, s:green ], [ s:base1, s:grey ] ]

" replace
let s:p.replace.left = [ [ s:base0, s:red ], [ s:base1, s:grey ] ]

" visual
let s:p.visual.left = [ [ s:base0, s:cyan ], [ s:base1, s:grey ] ]

" tjbline
let s:p.tabline.left = [ [ s:base1, s:base0 ] ]
let s:p.tabline.right = [ [ s:base1, s:base0 ] ]
let s:p.tabline.middle = [ [ s:base1, s:base0 ] ]
let s:p.tabline.tabsel = [ [ s:base0, s:base1 ] ]

let g:lightline#colorscheme#downtime#palette = lightline#colorscheme#flatten(s:p)
