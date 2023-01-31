local noremap = { noremap = true }
local silent_noremap = {noremap = true, silent = true}
vim.g.mapleader = " " 

-- Normal Remaps
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Telescope Remaps
local t = require'telescope.builtin'
vim.keymap.set('n', '<leader>ff', t.find_files, silent_noremap)
vim.keymap.set('n', '<C-p>', t.git_files, silent_noremap)
