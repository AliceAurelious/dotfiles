return {
	{
		-- make fancy logo when opening nvim without a file
		"goolord/alpha-nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},

		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.startify")

			dashboard.section.header.val = {
				[[                                                                       ]],
				[[                                                                       ]],
				[[                                                                       ]],
				[[                                                                       ]],
				[[                                                                     ]],
				[[       ████ ██████           █████      ██                     ]],
				[[      ███████████             █████                             ]],
				[[      █████████ ███████████████████ ███   ███████████   ]],
				[[     █████████  ███    █████████████ █████ ██████████████   ]],
				[[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
				[[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
				[[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
				[[                                                                       ]],
				[[                                                                       ]],
				[[                                                                        ]],
			}

			alpha.setup(dashboard.opts)
		end,
	},

	{
		-- add material.nvim theme
		{
			"marko-cerovac/material.nvim",
			lazy = false,
			priority = 1000,

			config = function()
				vim.cmd([[colorscheme material-deep-ocean]]) -- set colorscheme to material.nvim
			end,
		},
	},

	{
		-- make status bar of nvim fancy
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},

		config = function()
			require("lualine").setup({
				options = {
					theme = "material-nvim", -- set lualine colorscheme to material.nvim
				},
			})
		end,
	},
	{
		{
			"Bekaboo/dropbar.nvim",
			-- optional, but required for fuzzy finder support
			dependencies = {
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
			config = function()
				local dropbar_api = require("dropbar.api")
				vim.keymap.set("n", "<Leader>;", dropbar_api.pick, { desc = "Pick symbols in winbar" })
				vim.keymap.set("n", "[;", dropbar_api.goto_context_start, { desc = "Go to start of current context" })
				vim.keymap.set("n", "];", dropbar_api.select_next_context, { desc = "Select next context" })
			end,
		},
	},
	{
		"tribela/transparent.nvim",
		event = "VimEnter",
		config = true,
		config = function()
			vim.cmd("TransparentDisable")
			vim.keymap.set("n", "<leader>t", ":TransparentToggle<CR>", {})
		end,
	},
}
