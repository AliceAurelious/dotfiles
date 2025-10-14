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
				[[                                                                       ]],
			}

			alpha.setup(dashboard.opts)
		end,
	},

	{
			 -- add dracula
		{ "Mofiqul/dracula.nvim" },

		-- Configure LazyVim to load dracula
		{
			"LazyVim/LazyVim",
			opts = {
				colorscheme = "dracula",
			},
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
					theme = "dracula-nvim",
				},
			})
		end,
	},
}
