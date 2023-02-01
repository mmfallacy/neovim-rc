local noremap = { noremap = true }
local silent_noremap = {noremap = true, silent = true}
local map = vim.keymap.set

-- Normal Remaps
map("n", "<leader>pv", vim.cmd.Ex)
map("i", "<C-c>", "<Esc>")

-- Buffer Remaps (ful1e5)
map('n', '<space>]', vim.cmd.bnext)
map('n', '<space>[', vim.cmd.bprev)
map('n', '<space><Esc>', vim.cmd.bdelete)
map('n', '<C-d>', ':%bd!<CR>')

-- Line Transforms using Alt (ful1e5)
map('n', '<A-S-j>', ':m .+1<CR>==')
map('n', '<A-S-k>', ':m .-2<CR>==')
map('v', '<A-S-j>', ":m '>+1<CR>gv=gv")
map('v', '<A-S-k>', ":m '<-2<CR>gv=gv")
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])


-- Telescope Remaps
local t = require'telescope.builtin'
map('n', '<leader>ff', t.find_files, silent_noremap)
map('n', '<C-p>', t.git_files, silent_noremap)

-- Disable Arrow Keys
map({'n','v','i'}, "<Left>", "<nop>")
map({'n','v','i'}, "<Right>", "<nop>")
map({'n','v','i'}, "<Down>", "<nop>")
map({'n','v','i'}, "<Up>", "<nop>")

