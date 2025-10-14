return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				-- lua formating
				null_ls.builtins.formatting.stylua,

				-- godot linting and formating
				null_ls.builtins.formatting.gdtoolkit,
				null_ls.builtins.diagnostics.gdtoolkit,

				-- python formating and linting
				null_ls.builtins.formatting.black,

			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {}) -- formating/linting
	end,
}
