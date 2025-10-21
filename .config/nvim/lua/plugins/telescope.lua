return {
	{
		"nvim-telescope/telescope.nvim", -- search for files in your working directory
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},

		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<C-p>", builtin.find_files, {}) -- open file search with Ctrl + p
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {}) -- open grep search with leader + f + g
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim", -- allow other plugins to use the telescope ui for their features

		config = function()
			-- This is your opts table
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({
							-- even more opts
						}),
						-- pseudo code / specification for writing custom displays, like the one
						-- for "codeactions"
						-- specific_opts = {
						--   [kind] = {
						--     make_indexed = function(items) -> indexed_items, width,
						--     make_displayer = function(widths) -> displayer
						--     make_display = function(displayer) -> function(e)
						--     make_ordinal = function(e) -> string
						--   },
						--   -- for example to disable the custom builtin "codeactions" display
						--      do the following
						--   codeactions = false,
						-- }
					},
				},
			})
			-- To get ui-select loaded and working with telescope, you need to call
			-- load_extension, somewhere after setup function:
			require("telescope").load_extension("ui-select")
		end,
	},
}
