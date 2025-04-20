return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		transparent_bg = true,
		styles = {
			sidebar = "transparent",
			floats = "transparent"
		}
	},
	config = function()
		vim.cmd [[colorscheme tokyonight-night]]
	end
}
