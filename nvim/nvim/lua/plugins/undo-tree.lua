return {
	"mbbill/undotree",
	config = function()
		vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
		vim.keymap.set("n", "<leader>uf", vim.cmd.UndotreeFocus)
	end,
}
