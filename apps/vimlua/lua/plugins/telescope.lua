--[[ Позволяет искать по названию файлов и содержимому файлов]]--
-- https://github.com/nvim-telescope/telescope.nvim

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>b', function()
  builtin.buffers({
    sort_mru = true,
    ignore_current_buffer = true,
    initial_mode = "normal",
  })
end, {})
vim.keymap.set('n', '<leader>fr', function()
  builtin.resume({ initial_mode = "normal" })
end, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>gc', builtin.git_commits, {})
vim.keymap.set('n', '<leader>gs', builtin.git_status, {})
