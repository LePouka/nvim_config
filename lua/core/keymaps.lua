local keymaps = {}

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

function keymaps.utils()
	vim.keymap.set('i', 'jk', '<Esc>', { desc = 'Exit insert mode' })
	vim.keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
	vim.keymap.set("n", "<leader>ex", ":Ex<CR>", { desc = "Open exploration menu" })
end

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
function keymaps.navigation()
	vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
	vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
	vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
	vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
end

-- window management
function keymaps.window()
	vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
	vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
	vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
	vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })
end

function keymaps.setup()
	keymaps.utils()
	keymaps.navigation()
	keymaps.window()
end

return keymaps
