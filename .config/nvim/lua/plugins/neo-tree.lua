return {
	"nvim-neo-tree/neo-tree.nvim", -- adds a filesystem browser
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons", -- optional, but recommended
	},

	config = function()
		vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", {}) -- open filesystem on the right side like most IDEs by pressing Ctrl + n
		require("neo-tree").setup({
			filesystem = {
				filtered_items = {
					visible = true,
					hide_dotfiles = false,
					hide_gitignoerd = true,
				},
			},
		})
	end,
}
