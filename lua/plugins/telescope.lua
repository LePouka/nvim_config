return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"nvim-telescope/telescope-project.nvim",
		"folke/todo-comments.nvim",
	},

	config = function()
		local telescope = require('telescope')
		local actions = require('telescope.actions')
		local fb_actions = telescope.extensions.file_browser.actions

		telescope.setup{ 
			defaults = {
				prompte_prefix = "🔍 ",
				selection_caret = "➜ ",
				entry_prefix = "  ",
				path_display = { "smart" },

				mappings = {
					i = {
						["<C-h>"] = actions.which_key,
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
					}
				}
			},

			pickers = {
				find_file = {
					find_command = {
						"fd",
						"--type",
						"f",
						"-H",
					}
				}
			},

			extensions = {
				file_browser = {
					hidden = true,
					respect_gitignore = true,
					hijakck_netrw = true,
					["i"] = {
						["<A-t>"] = fb_actions.change_cwd,
						["<C-t>"] = actions.select_tab,
					},
				},
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				}
			}
		}

		telescope.load_extension('file_browser')
		telescope.load_extension('fzf')
		telescope.load_extension('project')

		local keymap = vim.keymap
		local builtin = require('telescope.builtin')

		keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
		keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[F]ind by [G]rep' })
		keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp' })
		keymap.set('n', '<leader>fk', builtin.keymaps, { desc = '[F]ind [K]eymaps' })
		keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[F]ind [D]iagnostics' })
		keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = '[F]ind [R]ecent Files' })
	end
}
