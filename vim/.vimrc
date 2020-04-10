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

" nerdtree
nnoremap <C-j> :NERDTreeToggle<CR>

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

" PLUGINS
filetype plugin indent on
" to install from the shell run:
" `git clone https://github.com/gmarik/Vundle.vim.git ~/dotfiles/vim/.vim/bundle/Vundle.vim && vim +BundleInstall +qall && PYTHON=/usr/bin/python2 ~/dotfiles/vim/.vim/bundle/YouCompleteMe/install.sh --clang-completer && pacman -S the_silver_searcher`
" `mkdir ~/dot/vim/.vim/bundle ; git clone https://github.com/gmarik/Vundle.vim.git ~/dot/vim/.vim/bundle/Vundle.vim && vim +BundleInstall +qall`
if 1 " boolean for plugin loading
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()
  Plugin 'gmarik/Vundle.vim'
  Plugin 'tpope/vim-fugitive'
  Plugin 'scrooloose/nerdtree'
  Plugin 'vimwiki/vimwiki'
  Plugin 'itchyny/lightline.vim'
  Plugin 'rking/ag.vim'
  Plugin 'ajh17/VimCompletesMe'
  Plugin 'mhinz/vim-signify'
  Plugin 'junegunn/goyo.vim'
  call vundle#end()

  " nerdtree - workaround for https://github.com/scrooloose/nerdtree/issues/643
  let g:NERDTreeDirArrows = 1
  let g:NERDTreeShowHidden = 1

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

  " vimcompletesme
" omnifuncs
augroup omnifuncs
  au!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  " use python3: https://stackoverflow.com/questions/28043652/vim-unknown-function-pythoncompletecomplete
  autocmd FileType python setlocal omnifunc=python3complete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
augroup end

" completions
let b:vcm_tab_complete = 'omni'
set omnifunc=syntaxcomplete#Complete
" select the completion with enter
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" close preview on completion complete
augroup completionhide
  au!
  autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
augroup end

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
