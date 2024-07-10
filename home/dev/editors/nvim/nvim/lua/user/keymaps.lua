local nnoremap = require("user.keymap_utils").nnoremap
local vnoremap = require("user.keymap_utils").vnoremap
local inoremap = require("user.keymap_utils").inoremap
local tnoremap = require("user.keymap_utils").tnoremap
local xnoremap = require("user.keymap_utils").xnoremap
local harpoon_ui = require("harpoon.ui")
local harpoon_mark = require("harpoon.mark")
local conform = require("conform")
local utils = require("user.utils")

local M = {}

local TERM = os.getenv("TERM")

-- Normal --
-- Disable Space bar since it'll be used as the leader key
nnoremap("<space>", "<nop>", { desc = "Disable space bar" })

-- Window + better kitty navigation
nnoremap("<C-j>", function()
	if vim.fn.exists(":KittyNavigateDown") ~= 0 and TERM == "xterm-kitty" then
		vim.cmd.KittyNavigateDown()
	elseif vim.fn.exists(":NvimTmuxNavigateDown") ~= 0 then
		vim.cmd.NvimTmuxNavigateDown()
	else
		vim.cmd.wincmd("j")
	end
end, { desc = "Navigate down" })

nnoremap("<C-k>", function()
	if vim.fn.exists(":KittyNavigateUp") ~= 0 and TERM == "xterm-kitty" then
		vim.cmd.KittyNavigateUp()
	elseif vim.fn.exists(":NvimTmuxNavigateUp") ~= 0 then
		vim.cmd.NvimTmuxNavigateUp()
	else
		vim.cmd.wincmd("k")
	end
end, { desc = "Navigate up" })

nnoremap("<C-l>", function()
	if vim.fn.exists(":KittyNavigateRight") ~= 0 and TERM == "xterm-kitty" then
		vim.cmd.KittyNavigateRight()
	elseif vim.fn.exists(":NvimTmuxNavigateRight") ~= 0 then
		vim.cmd.NvimTmuxNavigateRight()
	else
		vim.cmd.wincmd("l")
	end
end, { desc = "Navigate right" })

nnoremap("<C-h>", function()
	if vim.fn.exists(":KittyNavigateLeft") ~= 0 and TERM == "xterm-kitty" then
		vim.cmd.KittyNavigateLeft()
	elseif vim.fn.exists(":NvimTmuxNavigateLeft") ~= 0 then
		vim.cmd.NvimTmuxNavigateLeft()
	else
		vim.cmd.wincmd("h")
	end
end, { desc = "Navigate left" })

-- Swap between last two buffers
nnoremap("<leader>'", "<C-^>", { desc = "Switch to last buffer" })

-- Save with leader key
nnoremap("<leader>w", "<cmd>w<cr>", { silent = false, desc = "Save buffer" })

-- Quit with leader key
nnoremap("<leader>q", "<cmd>q<cr>", { silent = false, desc = "Quit buffer" })

-- Save and Quit with leader key
nnoremap("<leader>z", "<cmd>wq<cr>", { silent = false, desc = "Save and quit buffer" })

-- Map Oil to <leader>e
nnoremap("<leader>e", function()
	require("oil").toggle_float()
end, { desc = "Toggle Oil" })

-- Center buffer while navigating
nnoremap("<C-u>", "<C-u>zz", { desc = "Page up and center" })
nnoremap("<C-d>", "<C-d>zz", { desc = "Page down and center" })
nnoremap("{", "{zz", { desc = "Move paragraph up and center" })
nnoremap("}", "}zz", { desc = "Move paragraph down and center" })
nnoremap("N", "Nzz", { desc = "Find previous and center" })
nnoremap("n", "nzz", { desc = "Find next and center" })
nnoremap("G", "Gzz", { desc = "Go to end and center" })
nnoremap("gg", "ggzz", { desc = "Go to start and center" })
nnoremap("<C-i>", "<C-i>zz", { desc = "Go forward and center" })
nnoremap("<C-o>", "<C-o>zz", { desc = "Go backward and center" })
nnoremap("%", "%zz", { desc = "Go to matching brace and center" })
nnoremap("*", "*zz", { desc = "Search word under cursor forward and center" })
nnoremap("#", "#zz", { desc = "Search word under cursor backward and center" })

-- Press 'S' for quick find/replace for the word under the cursor
nnoremap("S", function()
	local cmd = ":%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>"
	local keys = vim.api.nvim_replace_termcodes(cmd, true, false, true)
	vim.api.nvim_feedkeys(keys, "n", false)
end, { desc = "Quick find/replace" })

-- Open Spectre for global find/replace
nnoremap("<leader>S", function()
	require("spectre").toggle()
end, { desc = "Toggle Spectre" })

-- Open Spectre for global find/replace for the word under the cursor in normal mode
nnoremap("<leader>sw", function()
	require("spectre").open_visual({ select_word = true })
end, { desc = "Search current word with Spectre" })

-- Press 'H', 'L' to jump to start/end of a line (first/last char)
nnoremap("L", "$", { desc = "Jump to end of line" })
nnoremap("H", "^", { desc = "Jump to start of line" })

-- Press 'U' for redo
nnoremap("U", "<C-r>", { desc = "Redo" })

-- Turn off highlighted results
nnoremap("<leader>no", "<cmd>noh<cr>", { desc = "Turn off highlights" })

-- Diagnostics

-- Goto next diagnostic of any severity
nnoremap("]d", function()
	vim.diagnostic.goto_next({})
	vim.api.nvim_feedkeys("zz", "n", false)
end, { desc = "Next diagnostic" })

-- Goto previous diagnostic of any severity
nnoremap("[d", function()
	vim.diagnostic.goto_prev({})
	vim.api.nvim_feedkeys("zz", "n", false)
end, { desc = "Previous diagnostic" })

-- Goto next error diagnostic
nnoremap("]e", function()
	vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
	vim.api.nvim_feedkeys("zz", "n", false)
end, { desc = "Next error diagnostic" })

-- Goto previous error diagnostic
nnoremap("[e", function()
	vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
	vim.api.nvim_feedkeys("zz", "n", false)
end, { desc = "Previous error diagnostic" })

-- Goto next warning diagnostic
nnoremap("]w", function()
	vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARN })
	vim.api.nvim_feedkeys("zz", "n", false)
end, { desc = "Next warning diagnostic" })

-- Goto previous warning diagnostic
nnoremap("[w", function()
	vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.WARN })
	vim.api.nvim_feedkeys("zz", "n", false)
end, { desc = "Previous warning diagnostic" })

-- Open the diagnostic under the cursor in a float window
nnoremap("<leader>d", function()
	vim.diagnostic.open_float({
		border = "rounded",
	})
end, { desc = "Open diagnostic float" })

-- Place all diagnostics into a qflist
nnoremap("<leader>ld", vim.diagnostic.setqflist, { desc = "Quickfix List Diagnostics" })

-- Navigate to next qflist item
nnoremap("<leader>cn", ":cnext<cr>zz", { desc = "Next quickfix item" })

-- Navigate to previous qflist item
nnoremap("<leader>cp", ":cprevious<cr>zz", { desc = "Previous quickfix item" })

-- Open the qflist
nnoremap("<leader>co", ":copen<cr>zz", { desc = "Open quickfix list" })

-- Close the qflist
nnoremap("<leader>cc", ":cclose<cr>zz", { desc = "Close quickfix list" })

-- Map MaximizerToggle (szw/vim-maximizer) to leader-m
nnoremap("<leader>m", ":MaximizerToggle<cr>", { desc = "Toggle window maximizer" })

-- Resize split windows to be equal size
nnoremap("<leader>=", "<C-w>=", { desc = "Equalize window sizes" })

-- Press leader f to format
nnoremap("<leader>f", function()
	conform.format({ async = true, lsp_fallback = true })
end, { desc = "Format current buffer" })

-- Press leader rw to rotate open windows
nnoremap("<leader>rw", ":RotateWindows<cr>", { desc = "Rotate windows" })

-- Press gx to open the link under the cursor
nnoremap("gx", ":sil !open <cWORD><cr>", { silent = true, desc = "Open link under cursor" })

-- TSC autocommand keybind to run TypeScript's tsc
nnoremap("<leader>tc", ":TSC<cr>", { desc = "TypeScript Compile" })

-- Harpoon keybinds --
-- Open harpoon ui
nnoremap("<leader>ho", function()
	harpoon_ui.toggle_quick_menu()
end, { desc = "Open Harpoon UI" })

-- Add current file to harpoon
nnoremap("<leader>ha", function()
	harpoon_mark.add_file()
end, { desc = "Add file to Harpoon" })

-- Remove current file from harpoon
nnoremap("<leader>hr", function()
	harpoon_mark.rm_file()
end, { desc = "Remove file from Harpoon" })

-- Remove all files from harpoon
nnoremap("<leader>hc", function()
	harpoon_mark.clear_all()
end, { desc = "Clear all Harpoon files" })

-- Quickly jump to harpooned files
nnoremap("<leader>1", function()
	harpoon_ui.nav_file(1)
end, { desc = "Jump to Harpoon file 1" })

nnoremap("<leader>2", function()
	harpoon_ui.nav_file(2)
end, { desc = "Jump to Harpoon file 2" })

nnoremap("<leader>3", function()
	harpoon_ui.nav_file(3)
end, { desc = "Jump to Harpoon file 3" })

nnoremap("<leader>4", function()
	harpoon_ui.nav_file(4)
end, { desc = "Jump to Harpoon file 4" })

nnoremap("<leader>5", function()
	harpoon_ui.nav_file(5)
end, { desc = "Jump to Harpoon file 5" })

-- Git keymaps --
nnoremap("<leader>gb", ":Gitsigns toggle_current_line_blame<cr>", { desc = "Toggle git line blame" })
nnoremap("<leader>gf", function()
	local cmd = {
		"sort",
		"-u",
		"<(git diff --name-only --cached)",
		"<(git diff --name-only)",
		"<(git diff --name-only --diff-filter=U)",
	}

	if not utils.is_git_directory() then
		vim.notify(
			"Current project is not a git directory",
			vim.log.levels.WARN,
			{ title = "Telescope Git Files", git_command = cmd }
		)
	else
		require("telescope.builtin").git_files()
	end
end, { desc = "Search Git files" })

-- Telescope keybinds --
nnoremap("<leader>?", require("telescope.builtin").oldfiles, { desc = "Find recently opened files" })
nnoremap("<leader>sb", require("telescope.builtin").buffers, { desc = "Search open buffers" })
nnoremap("<leader>sf", function()
	require("telescope.builtin").find_files({ hidden = true })
end, { desc = "Search files" })
nnoremap("<leader>sh", require("telescope.builtin").help_tags, { desc = "Search help" })
nnoremap("<leader>sg", require("telescope.builtin").live_grep, { desc = "Search by grep" })

nnoremap("<leader>sc", function()
	require("telescope.builtin").commands(require("telescope.themes").get_dropdown({
		previewer = false,
	}))
end, { desc = "Search commands" })

nnoremap("<leader>/", function()
	require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		previewer = false,
	}))
end, { desc = "Fuzzily search in current buffer" })

nnoremap("<leader>ss", function()
	require("telescope.builtin").spell_suggest(require("telescope.themes").get_dropdown({
		previewer = false,
	}))
end, { desc = "Search spelling suggestions" })

-- LSP Keybinds (exports a function to be used in ../../after/plugin/lsp.lua b/c we need a reference to the current buffer) --
M.map_lsp_keybinds = function(buffer_number)
	nnoremap("<leader>rn", vim.lsp.buf.rename, { desc = "LSP: Rename", buffer = buffer_number })
	nnoremap("<leader>ca", vim.lsp.buf.code_action, { desc = "LSP: Code Action", buffer = buffer_number })

	nnoremap("gd", vim.lsp.buf.definition, { desc = "LSP: Goto Definition", buffer = buffer_number })

	-- Telescope LSP keybinds --
	nnoremap(
		"gr",
		require("telescope.builtin").lsp_references,
		{ desc = "LSP: Goto References", buffer = buffer_number }
	)

	nnoremap(
		"gi",
		require("telescope.builtin").lsp_implementations,
		{ desc = "LSP: Goto Implementation", buffer = buffer_number }
	)

	nnoremap(
		"<leader>bs",
		require("telescope.builtin").lsp_document_symbols,
		{ desc = "LSP: Buffer Symbols", buffer = buffer_number }
	)

	nnoremap(
		"<leader>ps",
		require("telescope.builtin").lsp_workspace_symbols,
		{ desc = "LSP: Project Symbols", buffer = buffer_number }
	)

	-- See `:help K` for why this keymap
	nnoremap("K", vim.lsp.buf.hover, { desc = "LSP: Hover Documentation", buffer = buffer_number })
	nnoremap("<leader>k", vim.lsp.buf.signature_help, { desc = "LSP: Signature Documentation", buffer = buffer_number })
	inoremap("<C-k>", vim.lsp.buf.signature_help, { desc = "LSP: Signature Documentation", buffer = buffer_number })

	-- Lesser used LSP functionality
	nnoremap("gD", vim.lsp.buf.declaration, { desc = "LSP: Goto Declaration", buffer = buffer_number })
	nnoremap("td", vim.lsp.buf.type_definition, { desc = "LSP: Type Definition", buffer = buffer_number })
end

-- Symbol Outline keybind
nnoremap("<leader>so", ":SymbolsOutline<cr>", { desc = "Toggle Symbols Outline" })

-- Open Copilot panel
nnoremap("<leader>oc", function()
	require("copilot.panel").open({})
end, { desc = "Open Copilot panel" })

-- nvim-ufo keybinds
nnoremap("zR", require("ufo").openAllFolds, { desc = "Open all folds" })
nnoremap("zM", require("ufo").closeAllFolds, { desc = "Close all folds" })

-- Insert --
-- Map jj to <esc>
inoremap("jj", "<esc>", { desc = "Map jj to escape" })

-- Visual --
-- Disable Space bar since it'll be used as the leader key
vnoremap("<space>", "<nop>", { desc = "Disable space bar" })

-- Press 'H', 'L' to jump to start/end of a line (first/last char)
vnoremap("L", "$<left>", { desc = "Jump to end of line" })
vnoremap("H", "^", { desc = "Jump to start of line" })

-- Paste without losing the contents of the register
vnoremap("<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selected text down" })
vnoremap("<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selected text up" })

xnoremap("<leader>p", '"_dP', { desc = "Paste without losing register contents" })

-- Reselect the last visual selection
xnoremap("<<", function()
	-- Move selected text up/down in visual mode
	vim.cmd("normal! <<")
	vim.cmd("normal! gv")
end, { desc = "Reselect last visual selection and shift left" })

xnoremap(">>", function()
	vim.cmd("normal! >>")
	vim.cmd("normal! gv")
end, { desc = "Reselect last visual selection and shift right" })

-- Terminal --
-- Enter normal mode while in a terminal
tnoremap("<esc>", [[<C-\><C-n>]], { desc = "Enter normal mode in terminal" })
tnoremap("jj", [[<C-\><C-n>]], { desc = "Map jj to escape in terminal" })

-- Window navigation from terminal
tnoremap("<C-h>", [[<Cmd>wincmd h<CR>]], { desc = "Navigate left from terminal" })
tnoremap("<C-j>", [[<Cmd>wincmd j<CR>]], { desc = "Navigate down from terminal" })
tnoremap("<C-k>", [[<Cmd>wincmd k<CR>]], { desc = "Navigate up from terminal" })
tnoremap("<C-l>", [[<Cmd>wincmd l<CR>]], { desc = "Navigate right from terminal" })

-- Reenable default <space> functionality to prevent input delay
tnoremap("<space>", "<space>", { desc = "Reenable space functionality in terminal" })

return M
