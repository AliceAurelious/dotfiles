return {
	"folke/snacks.nvim",
	priority = 1000,
	---@type snacks.Config
	opts = {
		statuscolumn = {
			enabled = true,
			-- your statuscolumn configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			{
				left = { "mark", "sign" }, -- priority of signs on the left (high to low)
				right = { "fold", "git" }, -- priority of signs on the right (high to low)
				folds = {
					open = false,        -- show open fold icons
					git_hl = false,      -- use Git Signs hl for fold icons
				},
				git = {
					-- patterns to match Git signs
					patterns = { "GitSign", "MiniDiffSign" },
				},
				refresh = 50, -- refresh at most every 50ms
			}
		}
	}
}
