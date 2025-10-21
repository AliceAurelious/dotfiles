return {
	"lewis6991/gitsigns.nvim", -- adds simple git intigration I mainly use it for git blame in editor
	config = function()
		require("gitsigns").setup({
			current_line_blame = true,
		})
	end,
}
