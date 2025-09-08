return {
	"sourcery",
	name = "sourcery.nvim",
	lazy = false,
	dev = { true },
	priority = 1000,
	config = function()
		vim.cmd("colorscheme sourcery")
	end,
}
