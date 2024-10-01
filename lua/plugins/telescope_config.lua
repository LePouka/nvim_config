local telescope_config_lua = {}
local telescope = require('telescope')
local actions = require('telescope.actions')

function telescope_config_lua.setup()
	telescope.setup{ 
		defaults = {
			mappings = {
				i = {
					["<C-h>"] = actions.which_key,
					["<C-k>"] = actions.move_selection_previous,
					["<C-j>"] = actions.move_selection_next,
				}
			}
		},

		extensions = {
			fzf = {
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = "smart_case",
			}
		}
	}

	telescope.load_extension('fzf')

	local keymap = vim.keymap
	local builtin = require('telescope.builtin')

	keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp' })
	keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
	keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
	keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
	keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
	keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
	keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
	keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
	keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
	keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
	keymap.set('n', '<leader>sp', builtin.git_files, { desc = '[S]earch in [G]it repo' })
end

return telescope_config_lua
