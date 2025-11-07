return {
	-- mason installs and manages lsps
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	-- mason-lspconfig installs lsps that are configured automatically
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "pyright", "bashls", "puppet" },
			})
		end,
	},
	-- lspconfig configures the abilities of our lsps
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- tells the lsp that it can do recomendations for completions
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = vim.lsp.config
			-- lua
			lspconfig["lua_ls"] = {
				capabilities = capabilities,
			}
			-- bash
			lspconfig["bashls"] = {
				capabilities = capabilities,
			}
			-- python
			lspconfig["pyright"] = {
				capabilities = capabilities,
			}
			-- gdscript
			lspconfig["gdscript"] = {
				capabilities = capabilities,
				name = "godot",
				cmd = vim.lsp.rpc.connect("127.0.0.1", 6005),
			}
			-- puppet
			lspconfig["puppet"] = {
				capabilities = capabilities,
			}

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
