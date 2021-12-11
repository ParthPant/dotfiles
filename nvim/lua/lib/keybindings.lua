vim.g.mapleader = ","

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = false }

keymap('n', '<c-j>', '<c-w>j', opts)
keymap('n', '<c-k>', '<c-w>k', opts)
keymap('n', '<c-l>', '<c-w>l', opts)
keymap('n', '<c-h>', '<c-w>h', opts)

keymap('n', '<c-n>', "<cmd>:NvimTreeToggle<cr>", opts)
keymap('n', '<leader>i', "<cmd>:IndentLinesToggle<cr>", opts)

keymap('n', '<c-p>', "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
keymap('n', '<c-i>', "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
keymap('n', '<c-b>', "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
keymap('n', '<c-t>', "<cmd>lua require('telescope.builtin').help_tags()<cr>", opts)

keymap('n', '<leader>t', "<cmd>SymbolsOutline<cr>", opts)
