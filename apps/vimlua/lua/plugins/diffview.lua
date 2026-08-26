--[[ Дифф-панели и история файлов/веток ]]--
-- https://github.com/sindrets/diffview.nvim
require('diffview').setup({})

vim.keymap.set('n', '<leader>gd', '<cmd>DiffviewOpen<cr>')
vim.keymap.set('n', '<leader>gD', '<cmd>DiffviewClose<cr>')
vim.keymap.set('n', '<leader>gf', '<cmd>DiffviewFileHistory %<cr>')
vim.keymap.set('n', '<leader>gl', '<cmd>DiffviewFileHistory<cr>')
