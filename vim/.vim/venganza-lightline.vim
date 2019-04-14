" =============================================================================
" filename: .vim/bundle/lightline.vim/autoload/lightline/colorscheme/venganza.vim
" author: pyratebeard
" =============================================================================

let s:base0 = [ '#212121', 0 ] "bg
let s:base1 = [ '#e6e3c6', 7 ] "white
let s:red = [ '#c73d2f', 1 ] "red
let s:green = [ '#1dc189', 2 ] "green
let s:yellow = [ '#a0ac6b', 3 ] "yellow
let s:blue = [ '#3a7885', 4 ] "blue
let s:magenta = [ '#776e89', 5 ] "magenta
let s:cyan = [ '#35abbb', 6 ] "cyan
let s:grey = [ '#3e3c3a', 8 ] "grey
let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

" [ [ fg, bg ], [ fg, bg ] ]
" normal
let s:p.normal.left = [ [ s:base1, s:grey ], [ s:base1, s:grey ] ]
let s:p.normal.right = [ [ s:base1, s:grey ], [ s:base1, s:grey ] ]
let s:p.normal.middle = [ [ s:base1, s:base0 ] ]
let s:p.normal.error = [ [ s:base0, s:red ] ]
let s:p.normal.warning = [ [ s:base0, s:yellow ] ]

" inactive
let s:p.inactive.left =  [ [ s:grey, s:base0 ], [ s:grey, s:base0 ] ]
let s:p.inactive.right = [ [ s:grey, s:base0 ], [ s:grey, s:base0 ] ]
let s:p.inactive.middle = [ [ s:grey, s:base0 ] ]

" insert
let s:p.insert.left = [ [ s:base0, s:blue ], [ s:base1, s:base0 ] ]

" replace
let s:p.replace.left = [ [ s:base0, s:red ], [ s:base1, s:base0 ] ]

" visual
let s:p.visual.left = [ [ s:base0, s:yellow ], [ s:base1, s:base0 ] ]

" tjbline
let s:p.tabline.left = [ [ s:base1, s:base0 ] ]
let s:p.tabline.right = [ [ s:base1, s:base0 ] ]
let s:p.tabline.middle = [ [ s:base1, s:base0 ] ]
let s:p.tabline.tabsel = [ [ s:base0, s:base1 ] ]

let g:lightline#colorscheme#venganza#palette = lightline#colorscheme#flatten(s:p)
