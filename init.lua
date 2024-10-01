vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

require('core.options').setup()
require('core.keymaps').setup()
require('core.autocommands').setup()
require('core.lazy').setup()
