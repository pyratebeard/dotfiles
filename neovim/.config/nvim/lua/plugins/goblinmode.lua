return {
	"pyratebeard/goblinmode.nvim",
	name = "goblinmode.nvim",
	lazy = false,
	dev = { true },
	priority = 1000,
	config = function()
		vim.cmd("colorscheme goblinmode")
	end,
}
