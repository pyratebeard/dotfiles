--                                     ██
--                                    ░░
--  ███████   █████   ██████  ██    ██ ██ ██████████
-- ░░██░░░██ ██░░░██ ██░░░░██░██   ░██░██░░██░░██░░██
--  ░██  ░██░███████░██   ░██░░██ ░██ ░██ ░██ ░██ ░██
--  ░██  ░██░██░░░░ ░██   ░██ ░░████  ░██ ░██ ░██ ░██
--  ███  ░██░░██████░░██████   ░░██   ░██ ███ ░██ ░██
-- ░░░   ░░  ░░░░░░  ░░░░░░     ░░    ░░ ░░░  ░░  ░░
--
--  author ▓▒ pyratebeard <root@pyratebeard.net>
--    code ▓▒ https://git.pyratebeard.net/dotfiles

-- ▓▓▒░ general
-- security
vim.opt.modelines = 0

-- https://neovim.discourse.group/t/how-do-i-prevent-neovim-commenting-out-next-line-after-a-comment-line/3711/4
vim.opt.paste = true

-- set leader
vim.g.mapleader = ","

-- hide buffers
vim.opt.hidden = true

-- maintain undo history between sessions
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo"
vim.opt.swapfile = false

-- fuzzy find
vim.opt.path:append("**")

-- lazy file name tab completion
vim.opt.wildmode = "list:longest,list:full"
vim.opt.wildmenu = true
vim.opt.wildignorecase = true

-- ignore files vim doesnt use
vim.opt.wildignore:append(".git,.hg,.svn")
vim.opt.wildignore:append(".aux,*.out,*.toc")
vim.opt.wildignore:append(".o,*.obj,*.exe,*.dll,*.manifest,*.rbc,*.class")
vim.opt.wildignore:append(".ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp")
vim.opt.wildignore:append(".avi,*.divx,*.mp4,*.webm,*.mov,*.m2ts,*.mkv,*.vob,*.mpg,*.mpeg")
vim.opt.wildignore:append(".mp3,*.oga,*.ogg,*.wav,*.flac")
vim.opt.wildignore:append(".eot,*.otf,*.ttf,*.woff")
vim.opt.wildignore:append(".doc,*.pdf,*.cbr,*.cbz")
vim.opt.wildignore:append(".zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,*.kgb")
vim.opt.wildignore:append(".swp,.lock,.DS_Store,._*")
vim.opt.wildignore:append(".,..")

-- case insensitive search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.infercase = true

-- make backspace behave in a sane manner
vim.opt.backspace = "indent,eol,start"

-- searching
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.inccommand = "split"

-- use indents of 2
vim.opt.shiftwidth = 2

-- tabs are tabs
vim.opt.expandtab = false

-- an indentation every 2 columns
vim.opt.tabstop = 2

-- let backspace delete indent
vim.opt.softtabstop = 2

-- enable auto indentation
vim.opt.autoindent = true

-- disable pesky mouse
vim.opt.mouse = ""

-- ▓▓▒░ ui
-- show matching brackets/parenthesis
vim.opt.showmatch = true

-- disable startup message
vim.opt.shortmess:append("sI")

-- syntax highlighting
vim.opt.termguicolors = true
vim.opt.synmaxcol = 512

-- show line numbers
vim.opt.number = true

-- no line wrapping
vim.opt.wrap = false
vim.opt.linebreak = true

-- set indents when wrapped
vim.opt.breakindent = true

-- highlight line
vim.opt.cursorline = true

-- cursor always block
vim.opt.guicursor = "n-v-i-c:block-Cursor"

-- show invisibles
vim.opt.listchars = { tab = "  ", trail = "·", extends = "»", precedes = "«", nbsp = "░" }
vim.opt.list = true

-- split directions
vim.opt.fillchars = { vert = "▒" }
vim.opt.splitright = true
vim.opt.splitbelow = true

--
--" stop unnecessary rendering
--set lazyredraw
--
--" no folding
--set foldlevel=99
--set foldminlines=99
--

--" MACROS
--" target blank links
--" used in blog md files
--let @t='{target="_blank" rel="noreferrer"}'

-- ▓▓▒░ commands
local f = require("utils.functions")
local r = require("utils.remaps")

-- remove highlighting
r.noremap("n", "<esc><esc>", ":nohlsearch<cr>", "remove highlighting", { silent = true })

-- vertical term
-- TODO auto append when term opens
r.noremap("n", "<leader>z", ":cd %:h | :vs | :set nu! | :term<cr>", "vertical terminal", { silent = true })
r.noremap("n", "<leader>Z", ":cd %:h | :split | :set nu! | :term<cr>", "terminal", { silent = true })

-- remove trailing white space
f.cmd("Nows", "%s/\\s\\+$//e", { desc = "remove trailing whitespace" })

-- remove blank lines
f.cmd("Nobl", "g/^\\s*$/d", { desc = "remove blank lines" })

-- the worst place in the world
r.noremap("n", "Q", "<nop>", "")

-- wrap and spellcheck when writing
-- nnoremap <C-w>w :set wrap<CR>:Spell<CR>
f.cmd("Sp", "setlocal spell! spell?", { desc = "toggle spell check" })
r.noremap("n", "<leader>s", ":Sp<cr>", "toggle spell check")
r.noremap("n", "<leader>ww", ":set wrap<cr>:Sp<cr>", { desc  = "wrap and toggle spell check" })

-- make current buffer executable
f.cmd("Chmodx", "!chmod a+x %", { desc = "make current buffer executable" })
r.noremap("n", "<leader>x", ":Chmodx<cr>", "chmod +x buffer")

-- 
-- vnoremap <silent> <leader>y :w !xsel -i -b<CR>
-- nnoremap <silent> <leader>y V:w !xsel -i -b<CR>
-- nnoremap <silent> <leader>p :silent :r !xsel -o -b<CR>
-- 
-- " switch tabs
-- nnoremap <C-n> :tabn<CR>
-- nnoremap <C-p> :tabp<CR>
-- 
-- " nerdtree
-- nnoremap <C-j> :NERDTreeToggle<CR>
-- 
-- " toggle autoindent
-- nnoremap <F8> :setl noai<CR>
-- nnoremap <F9> :setl ai<CR>
-- 
-- " goyo
-- nnoremap <C-w>g :Goyo<CR>
-- 
-- " start webserver
-- "nnoremap <leader>h :!busybox httpd -f -h . -p 8080
-- 
-- " list buffers and wait for number
-- nnoremap <leader>b :ls<CR>:b
-- 
-- " fzf
-- "nnoremap <leader>f :cd $HOME/src <bar>FZF<CR>
-- nnoremap <leader>f :cd %:p:h <bar>FZF<CR>
-- 
-- " list registers
-- nnoremap <leader>r :registers<CR>
-- 
-- " swap ' and ` for marks
-- nnoremap ' `
-- nnoremap ` '
-- " columns
-- " 80 soft 120 hard
-- let &colorcolumn="80"
-- 
-- " COMMANDS
-- " json pretty print
-- command J :%!python -mjson.tool
-- 
-- " git commit shortcut
-- command Ga Git add %
-- command Gc Git commit -S
-- command Gac Git commit -a -S -m "updates"
-- command Gf Git fetch
-- command Gp Git push
-- command -nargs=* Gco Git checkout
-- command Gm Git merge

-- ▓▓▒░ plugins
-- TODO lightline
local pluginspath = vim.fn.stdpath("data") .. "/lazy"
local lazypath = pluginspath .. "/lazy.nvim"

-- install lazy
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--single-branch",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end
vim.opt.runtimepath:prepend(lazypath)

-- use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
	print("lazy just installed, please restart neovim")
	return
end

---- install plugins
lazy.setup({
	spec = {
		--require("plugins.alpha"),
		require("plugins.fzf"),
		require("plugins.git"),
		require("plugins.gitsigns"),
		require("plugins.indent"),
		require("plugins.lush"),
		require("plugins.oldriceputin"),
		require("plugins.telescope"),
		require("plugins.vimwiki"),
	},
	dev = {
		path = "~/.local/src/warez",
	},
	lockfile = vim.fn.stdpath("config") .. "/lua/plugins/lazy-lock.json",
	ui = {
		size = { width = 0.8, height = 0.8 },
		wrap = true,
		border = "shadow",
		icons = require("utils.icons").lazy,
	},
	performance = {
		cache = {
			enabled = true,
		},
		reset_packpath = true,
		rtp = {
			disabled_plugins = {
				"netrwPlugin",
			},
		},
	},
})
