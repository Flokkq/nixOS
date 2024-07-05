return {
	"theHamsta/nvim-dap-virtual-text",
	requires = { "mfussenegger/nvim-dap" },
	config = function()
		require("nvim-dap-virtual-text").setup()
	end,
}
