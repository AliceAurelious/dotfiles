return {
	{
		"nvim-treesitter/nvim-treesitter", -- improved syntax highlighting thru tree-sitter based highlighting
		branch = "main",
		lazy = false,
		build = ":TSUpdate",

		config = function()
			local config = require("nvim-treesitter")
			config.setup({
				auto_install = true,
				--highlight = { enable = true },		-- afaik EOL
				--indent = { enable = true }, 			-- afaik EOL
			})
			vim.api.nvim_create_autocmd("FileType", {
				callback = function()
					-- Enable treesitter highlighting and disable regex syntax
					pcall(vim.treesitter.start)
					-- Enable treesitter-based indentation
					vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end,
			})
		end,
	},
	{
		-- for njk shit (webfoo with 11ty)
		"Glench/Vim-Jinja2-Syntax",
	},
}
