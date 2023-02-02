local noremap = { noremap = true }
local silent_noremap = {noremap = true, silent = true}
local map = vim.keymap.set

-- Normal Remaps
map("n", "<leader>pv", vim.cmd.Ex)
map({"n","v","c","i"}, "<C-c>", "<Esc>")
map("n", "<C-a>", "ggVG")

-- Buffer Remaps (ful1e5)
map('n', '<space>]', vim.cmd.bnext)
map('n', '<space>[', vim.cmd.bprev)
map('n', '<space>bd', vim.cmd.bdelete)
map('n', '<space>bdf', ':bd!<CR>')
map('n', '<space>bda', ':%bd!<CR>')
-- Line Transforms using Alt (ful1e5)

map('n', '<A-Down>', ':m .+1<CR>==')
map('n', '<A-Up>', ':m .-2<CR>==')
map('v', '<A-Down>', ":m '>+1<CR>gv=gv")
map('v', '<A-Up>', ":m '<-2<CR>gv=gv")
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])


-- Telescope Remaps
local t = require'telescope.builtin'
map('n', '<leader>ff', t.find_files, silent_noremap)
map('n', '<C-p>', t.git_files, silent_noremap)
map('n', '<C-,>', function() t.git_files({ cwd = vim.fn.stdpath('config') }) end, silent_noremap)
map('n', '<leader>ft', t.treesitter, silent_noremap)
map('n', '<leader>fb', t.buffers, silent_noremap)

-- Sync Arrow Keys to HJKL
map({'n','v'}, "<Left>", "<nop>")
map({'n','v'}, "<Right>", "<nop>")

