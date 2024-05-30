return {
	{
		"vimwiki/vimwiki",
		init = function()
			vim.g.vimwiki_list = {
				{ path = "~src/grimoire", syntax = "markdown", ext = ".md", links_space_char = "_" }
			}
			vim.g.vimwiki_ext2syntax = { ['.md'] = 'markdown', ['.markdown'] = 'markdown', ['.mdown'] = 'markdown' }
		end,
	},
}
