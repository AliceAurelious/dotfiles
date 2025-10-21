return {
	"mfussenegger/nvim-dap", -- debug adapter for debugging stuff you know

	config = function()
		local dap = require("dap")

		-- dab godot config
		dap.adapters.godot = {
			type = "server",
			host = "127.0.0.1",
			port = 6006,
		}

		dap.configurations.gdscript = {
			{
				type = "godot",
				request = "launch",
				name = "Launch scene",
				project = "${workspaceFolder}",
				launch_scene = true,
			},
		}
	end,
}
