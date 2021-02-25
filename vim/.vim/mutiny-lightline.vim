" =============================================================================
" Filename: autoload/lightline/colorscheme/mutiny.vim
" Author: pyratebeard
" License: MIT License
" Last Change: 2018/06/25 
" =============================================================================
"let s:base03 = [ '#242424', 235 ]
"let s:base023 = [ '#353535 ', 236 ]
"let s:base02 = [ '#777777 ', 238 ] "cyan
"let s:base01 = [ '#666666', 240 ] "green
"let s:base00 = [ '#666666', 242  ]

let s:base0 = [ '#161616', 0 ] "bg
let s:base1 = [ '#c1c1c1', 7 ] "white
let s:red = [ '#875052', 1 ] "red
let s:green = [ '#666666', 2 ] "green
let s:yellow = [ '#857e5f', 3 ] "yellow
let s:darkyellow = [ '#857e5f', 11 ] "yellow
let s:blue = [ '#888888', 4 ] "blue
let s:magenta = [ '#875666', 5 ] "magenta
let s:cyan = [ '#777777', 6 ] "cyan
let s:grey = [ '#161616', 8 ] "grey
let s:base234 = [ '#1c1c1c', 234 ] "lightblack
let s:base235 = [ '#1c1c1c', 235 ] "lightblack
let s:base237 = [ '#1c1c1c', 237 ] "lighterblack
let s:base239 = [ '#4e4e43', 239 ] "lighterblack
let s:base242 = [ '#4e4e43', 242 ] "lighterblack
let s:base248 = [ '#4e4e43', 248 ] "lighterblack
let s:none = [ 'NONE', 'NONE' ]
let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
" [ [ fg, bg ], [ fg, bg ] ]

" normal
let s:p.normal.left = [ [ s:base1, s:base237 ], [ s:base1, s:base235 ] ]
let s:p.normal.right = [ [ s:base0, s:base242 ], [ s:base248, s:base239 ] ]
let s:p.normal.middle = [ [ s:none, s:none ] ]
let s:p.normal.error = [ [ s:base0, s:red ] ]
let s:p.normal.warning = [ [ s:base0, s:yellow ] ]

" inactive
let s:p.inactive.left =  [ [ s:base237, s:base0 ], [ s:base237, s:base0 ] ]
let s:p.inactive.right = [ [ s:base237, s:base0 ], [ s:base237, s:base0 ] ]
let s:p.inactive.middle = [ [ s:base237, s:base0 ] ]

" insert
let s:p.insert.left = [ [ s:base0, s:green ], [ s:base1, s:base234 ] ]
"let s:p.insert.right = [ [ s:base0, s:yellow ], [ s:base1, s:base234 ] ]

" replace
let s:p.replace.left = [ [ s:base0, s:red ], [ s:base1, s:base234 ] ]
"let s:p.replace.right = [ [ s:base0, s:red ], [ s:base1, s:base234 ] ]

" visual
let s:p.visual.left = [ [ s:base0, s:darkyellow ], [ s:base1, s:base234 ] ]
"let s:p.visual.right = [ [ s:base0, s:magenta ], [ s:base1, s:base234 ] ]

" tabline
let s:p.tabline.left = [ [ s:base1, s:base0 ] ]
let s:p.tabline.right = copy(s:p.normal.right)
let s:p.tabline.middle = copy(s:p.normal.middle)
let s:p.tabline.tabsel = [ [ s:base0, s:base1 ] ]

let g:lightline#colorscheme#mutiny#palette = lightline#colorscheme#flatten(s:p)
