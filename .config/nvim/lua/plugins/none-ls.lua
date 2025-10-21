return {
	"nvimtools/none-ls.nvim", -- formating diagnostics and linting
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				-- lua formatting
				null_ls.builtins.formatting.stylua,

				-- godot linting and formatting
				null_ls.builtins.formatting.gdtoolkit,
				null_ls.builtins.diagnostics.gdtoolkit,

				-- python formatting and linting
				null_ls.builtins.formatting.black,

				-- bash linting and formatting
				null_ls.builtins.formatting.shellcheck,
				null_ls.builtins.diagnostics.beautysh,
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {}) -- formatting/linting
	end,
}
