return {
	"nvim-treesitter/nvim-treesitter", -- improved syntax highlighting thru tree-sitter based highlighting
	branch = "master",
	lazy = false,
	build = ":TSUpdate",

	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
