--[[ Показывает в гуттере изменения git: знаки рисуются поверх номера строки ]]--
-- https://github.com/lewis6991/gitsigns.nvim
local gitsigns = require('gitsigns')

gitsigns.setup({
  signs = {
    add          = { text = '+' },   -- добавленная строка
    change       = { text = '~' },   -- изменённая строка
    delete       = { text = '-' },   -- удалённая строка
    topdelete    = { text = '‾' },   -- удаление первой строки файла
    changedelete = { text = '~' },   -- изменение + удаление
    untracked    = { text = '┆' },   -- неотслеживаемый файл
  },
})

-- Переход между хунками
vim.keymap.set('n', ']h', function() gitsigns.nav_hunk('next') end)
vim.keymap.set('n', '[h', function() gitsigns.nav_hunk('prev') end)

-- Работа с хунками
vim.keymap.set('n', '<leader>hs', gitsigns.stage_hunk)   -- stage изменения
vim.keymap.set('n', '<leader>hr', gitsigns.reset_hunk)   -- откатить хунк
vim.keymap.set('n', '<leader>hp', gitsigns.preview_hunk) -- превью диффа
vim.keymap.set('n', '<leader>hb', function()
  gitsigns.blame_line({ full = true })                   -- git blame строки
end)
