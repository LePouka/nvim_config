local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
	if not (vim.uv or vim.loop).fs_stat(lazypath) then
		vim.fn.system({
			"git",
			"clone",
			"--filter=blob:none",
			"https://github.com/folke/lazy.nvim.git",
			"--branch=stable",
			lazypath
		})
end
vim.opt.rtp:prepend(lazypath)

local lazy = {}
function lazy.setup()
	require("lazy").setup({
		{
			"nvim-telescope/telescope.nvim",
			branch = "0.1.x",
			dependencies = {
				"nvim-lua/plenary.nvim",
				{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
				"nvim-tree/nvim-web-devicons",
				"folke/todo-comments.nvim",
			},
			config = function()
				require('plugins.telescope_config').setup()
			end
		},
		{
			"catppuccin/nvim",
			name = "catppuccin",
			config = function()
				require('plugins.catppuccin_config').setup()
			end
		},
		{
			"nvim-treesitter/nvim-treesitter",
			build = ":TSUpdate",
		},
		{
			"42Paris/42header"
		},
	})
end

return lazy
