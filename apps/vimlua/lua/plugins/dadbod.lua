--[[ UI для подключения к БД (PostgreSQL, MongoDB, MySQL, SQLite и др.) ]]--
-- https://github.com/kristijanhusak/vim-dadbod-ui
vim.g.db_ui_use_nerd_fonts = 1
vim.g.db_ui_show_help = 0
vim.g.db_ui_icons = {
  expanded         = '▾',
  collapsed        = '▸',
  saved_query      = '✔︎',
  new_query        = '+',
  tables           = '∘',
  buffers          = '⁖',
  connection_ok    = '✔︎',
  connection_error = '●',
}

vim.keymap.set('n', '<leader>dd', '<cmd>DBUI<cr>')
vim.keymap.set('n', '<leader>da', '<cmd>DBUIAddConnection<cr>')
vim.keymap.set('n', '<leader>df', '<cmd>DBUIFindBuffer<cr>')
vim.keymap.set('n', '<leader>dt', '<cmd>DBUIToggle<cr>')
