return {
	'akinsho/bufferline.nvim',
	version = "*",
	config = function()
		vim.opt.termguicolors = true
		require("bufferline").setup {}
		options = {
			hover = {
				enabled = true,
				delay = 200,
				reveal = { 'close' }
			},
			seperator_style = "padded_slant",
		}
	end,
	opts = function()
		local Offset = require("bufferline.offset")
		if not Offset.edgy then
			local get = Offset.get
			Offset.get = function()
				if package.loaded.edgy then
					local layout = require("edgy.config").layout
					local ret = { left = "", left_size = 0, right = "", right_size = 0 }
					for _, pos in ipairs({ "left", "right" }) do
						local sb = layout[pos]
						if sb and #sb.wins > 0 then
							local title = " Sidebar" .. string.rep(" ", sb.bounds.width - 8)
							ret[pos] = "%#EdgyTitle#" ..
							    title .. "%*" .. "%#WinSeparator#│%*"
							ret[pos .. "_size"] = sb.bounds.width
						end
					end
					ret.total_size = ret.left_size + ret.right_size
					if ret.total_size > 0 then
						return ret
					end
				end
				return get()
			end
			Offset.edgy = true
		end
	end,
}
