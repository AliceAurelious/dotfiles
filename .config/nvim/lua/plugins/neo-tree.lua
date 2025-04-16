return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"3rd/image.nvim",
		opts = {}
	}, -- Optional image support in preview window: See `# Preview Mode` for more information
	config = function()
		require("neo-tree").setup({
			window = {
				mappings = {
					["P"] = {
						"toggle_preview",
						config = {
							use_float = true,
							use_image_nvim = true,
							-- title = 'Neo-tree Preview',
						},
					},
				}
			},
			filesystem = {
				filtered_items = {
					visible = true,
					hide_dotfiles = false,
					hide_gitignored = true,
				},
			}
		})
		source_selector = {
			winbar = false,
			statusline = false
		}
	end,
}
