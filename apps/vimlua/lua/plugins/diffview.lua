--[[ Дифф-панели и история файлов/веток ]]--
-- https://github.com/sindrets/diffview.nvim
require('diffview').setup({})

local function system_ok_or_empty(cmd)
  local result = vim.fn.system(cmd)
  if vim.v.shell_error == 0 then
    return result:gsub('%s+$', '')
  end
  return ''
end

local function default_branch()
  for _, candidate in ipairs({ 'dev', 'main', 'master' }) do
    if system_ok_or_empty('git rev-parse --verify --quiet refs/heads/' .. candidate) ~= '' then
      return candidate
    end
  end
  return 'dev'
end

vim.keymap.set('n', '<leader>gd', '<cmd>DiffviewOpen<cr>')
vim.keymap.set('n', '<leader>gm', function()
  vim.cmd('DiffviewOpen ' .. default_branch() .. '...HEAD')
end)
vim.keymap.set('n', '<leader>gD', '<cmd>DiffviewClose<cr>')
vim.keymap.set('n', '<leader>gf', '<cmd>DiffviewFileHistory %<cr>')
vim.keymap.set('n', '<leader>gl', '<cmd>DiffviewFileHistory<cr>')
