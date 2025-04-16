return {
	"nvim-treesitter/nvim-treesitter",
	build = ':TSUpdate',
	opts = {
		ensure_installed = {
			'gdscript',
			'godot_resource',
			'gdshader'
		},
		auto_install = true,
	}
}
