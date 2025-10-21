return {
	"nvim-mini/mini.nvim",
	version = false,
	config = function()
		require("mini.pairs").setup() -- automaticly complete pairs like quotation marks and brackets
	end,
}
