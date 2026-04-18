return {
	-- mason installs and manages lsps
	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	-- mason-lspconfig installs lsps that are configured automatically
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			-- Declare here, but setup is done in mason.lua
			"mason-org/mason.nvim",
			-- The configs are sourced here
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "pyright", "bashls", "puppet", "html", "ccsls", "nil_ls", "jinja_lsp" },
			})
		end,
	},
	-- lspconfig configures the abilities of our lsps
	{
		"neovim/nvim-lspconfig",
		config = function()
			--vim.lsp.log.set_level("trace")
			--vim.lsp.log.set_format_func(vim.inspect)

			-- Add the completion capabilities to the default config for every LSP
			local cmp_nvim_lsp = require("cmp_nvim_lsp")
			vim.lsp.config("*", {
				capabilities = cmp_nvim_lsp.default_capabilities(),
			})

			-- gdscript
			vim.lsp.config("gdscript", {
				capabilities = cmp_nvim_lsp.default_capabilities(),
				name = "godot",
				cmd = vim.lsp.rpc.connect("127.0.0.1", 6005),
			})
			vim.lsp.enable("gdscript")
			--lspconfig["gdscript"] = {
			--	capabilities = capabilities,
			--	name = "godot",
			--	cmd = vim.lsp.rpc.connect("127.0.0.1", 6005),
			--	vim.lsp.enable("gdscript"),
			--}
			-- make hovers have a border
			local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview

			function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
				opts = opts or {}
				opts.border = opts.border or "rounded"

				return orig_util_open_floating_preview(contents, syntax, opts, ...)
			end

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
