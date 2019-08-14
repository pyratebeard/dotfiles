" ░█░█░▀█▀░█▄█░░
" ░▀▄▀░░█░░█░█░░
" ░░▀░░▀▀▀░▀░▀░░

" use vim settings, rather than vi settings
" must be first, because it changes other options as a side effect
set nocompatible

" security
set modelines=0

" paste without auto indentation
set paste

" hide buffers, not close them
set hidden

" maintain undo history between sessions
set undofile
set undodir=~/.vim/undo
set noswapfile

" lazy file name tab completion
set wildmode=longest,list,full
set wildmenu
set wildignorecase

" case insensitive search
set ignorecase
set smartcase
set infercase

" make backspace behave in a sane manner
set backspace=indent,eol,start

" searching
set hlsearch
set incsearch

" use indents of 4 spaces
set shiftwidth=4

" tabs are spaces, not tabs
set noexpandtab

" an indentation every four columns
set tabstop=4

" let backspace delete indent
set softtabstop=4

" enable auto indentation
set autoindent

" remove trailing whitespaces and ^M chars
autocmd FileType c,cpp,java,php,js,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
set list
set listchars=
set listchars+=tab:·\ 
set listchars+=trail:·
set listchars+=extends:»
set listchars+=precedes:«

" let mapleader=","
vnoremap <silent> <leader>y :w !xsel -i -b<CR>
nnoremap <silent> <leader>y V:w !xsel -i -b<CR>
nnoremap <silent> <leader>p :silent :r !xsel -o -b<CR>

" switch tabs
nnoremap <C-n> :tabn<CR>
nnoremap <C-p> :tabp<CR>

" netrw
nnoremap <C-j> :Ex<CR>

" noh
nnoremap <C-c> :noh<CR>

" toggle autoindent
nnoremap <F8> :setl noai<CR>
nnoremap <F9> :setl ai<CR>

" columns
" 80 soft 120 hard
let &colorcolumn="80"

" COMMANDS
" json pretty print
command J :%!python -mjson.tool

" remove trailing white space
command Nows :%s/\s\+$//

" remove blank lines
command Nobl :g/^\s*$/d

" toggle spellcheck
command Spell :setlocal spell! spell?

" make current buffer executable
command Chmodx :!chmod a+x %

" INTERFACE
" show matching brackets/parenthesis
set showmatch

" disable startup message
set shortmess+=I

" syntax highlighting and colors
syntax on
colorscheme futuremyth
filetype off

" stop unnecessary rendering
set lazyredraw

" show line numbers
set number

" no line wrapping
set nowrap
set linebreak

" no folding
set foldlevel=99
set foldminlines=99

" highlight line
set cursorline

" netrw config
let g:netrw_liststyle = 3
let g:netrw_banner = 0

" PLUGINS
filetype plugin indent on
" to install from the shell run:
" `git clone https://github.com/gmarik/Vundle.vim.git ~/dotfiles/vim/.vim/bundle/Vundle.vim && vim +BundleInstall +qall && PYTHON=/usr/bin/python2 ~/dotfiles/vim/.vim/bundle/YouCompleteMe/install.sh --clang-completer && pacman -S the_silver_searcher`
" `mkdir ~/dot/vim/.vim/bundle ; git clone https://github.com/gmarik/Vundle.vim.git ~/dot/vim/.vim/bundle/Vundle.vim && vim +BundleInstall +qall`
if 1 " boolean for plugin loading
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()
  Plugin 'gmarik/Vundle.vim'
  Plugin 'airblade/vim-gitgutter'
  Plugin 'tpope/vim-fugitive'
  Plugin 'vimwiki/vimwiki'
  Plugin 'itchyny/lightline.vim'
  Plugin 'rking/ag.vim'
  call vundle#end()

  " git-gutter http://git.io/vimgitgutter
  let g:gitgutter_realtime = 1
  let g:gitgutter_eager = 1
  let g:gitgutter_diff_args = '-w'
  let g:gitgutter_sign_added = '+'
  let g:gitgutter_sign_modified = '~'
  let g:gitgutter_sign_removed = '-'
  let g:gitgutter_sign_removed_first_line = '^'
  let g:gitgutter_sign_modified_removed = ':'
  let g:gitgutter_max_signs = 1500
  highlight clear SignColumn
  highlight GitGutterAdd ctermfg=green ctermbg=237
  highlight GitGutterChange ctermfg=yellow ctermbg=237
  highlight GitGutterDelete ctermfg=red ctermbg=237
  highlight GitGutterChangeDelete ctermfg=red ctermbg=237

  " ag, the silver searcher http://git.io/AEu3dQ + http://git.io/d9N0MA
  let g:ag_prg="ag -i --vimgrep"
  let g:ag_highlight=1
  " map \ to the ag command for quick searching
  nnoremap \ :Ag<SPACE>

  " vimwiki https://vimwiki.github.io
  let pyratewiki = {}
  let pyratewiki.path = '~/lib/doc/pyratewiki'
  let pyratewiki.path_html = '~/lib/doc/pyratewiki/html'
  let pyratewiki.syntax = 'markdown'
  let pyratewiki.ext = '.md'

  let g:vimwiki_list = [pyratewiki]

  " lightline
  set laststatus=2
  let g:lightline = {
  \ 'colorscheme': 'venganza',
  \ 'active': {
  \   'left': [ [ 'filename' ],
  \             [ 'readonly', 'fugitive' ] ],
  \   'right': [ [ 'percent', 'lineinfo' ],
  \              [ 'fileencoding', 'filetype' ],
  \              [ 'fileformat', 'syntastic' ] ]
  \ },
  \ 'component_function': {
  \   'modified': 'WizMod',
  \   'readonly': 'WizRO',
  \   'fugitive': 'WizGit',
  \   'filename': 'WizName',
  \   'filetype': 'WizType',
  \   'fileformat' : 'WizFormat',
  \   'fileencoding': 'WizEncoding',
  \   'mode': 'WizMode',
  \ },
  \ }

  function! WizMod()
    return &ft =~ 'help\|vimfiler' ? '' : &modified ? '»' : &modifiable ? '' : ''
  endfunction

  function! WizRO()
    return &ft !~? 'help\|vimfiler' && &readonly ? 'x' : ''
  endfunction

  function! WizGit()
    if &ft !~? 'help\|vimfiler' && exists("*fugitive#head")
      return fugitive#head()
    endif
    return ''
  endfunction

  function! WizName()
    return ('' != WizMod() ? WizMod() . ' ' : '') .
          \ ('' != expand('%:t') ? expand('%:t') : '[none]') 
  endfunction

  function! WizType()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : '') : ''
  endfunction

  function! WizFormat()
    return ''
  endfunction

  function! WizEncoding()
    return winwidth(0) > 70 ? (strlen(&fenc) ? &enc : &enc) : ''
  endfunction

endif
