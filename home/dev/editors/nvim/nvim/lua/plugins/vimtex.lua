return {
	{
		"lervag/vimtex",
		lazy = false,
		init = function()
			vim.api.nvim_set_keymap(
				"n",
				"<leader>lt",
				":!zathura <C-R>=expand('%:r')<CR>.pdf &<CR>",
				{ noremap = true, silent = true, desc = "Open PDF with zathura" }
			)

			vim.g.vimtex_view_method = "zathura"
			vim.g.vimtex_compiler_method = "latexmk"
			vim.g.vimtex_compiler_latexmk = {
				build_dir = "",
				callback = 1,
				continuous = 1,
				executable = "latexmk",
				options = {
					"-pdf",
					"-shell-escape",
					"-verbose",
					"-file-line-error",
					"-synctex=1",
					"-interaction=nonstopmode",
				},
			}
		end,
	},
}
