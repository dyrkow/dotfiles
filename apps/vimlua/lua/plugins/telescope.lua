--[[ Позволяет искать по названию файлов и содержимому файлов]]--
-- https://github.com/nvim-telescope/telescope.nvim

local builtin = require('telescope.builtin')

-- Папки, которые не нужно индексировать при поиске
local exclude_args = {
  "--glob", "!node_modules/",
  "--glob", "!build/",
  "--glob", "!dist/",
  "--glob", "!out/",
  "--glob", "!target/",
  "--glob", "!coverage/",
  "--glob", "!__pycache__/",
  "--glob", "!.venv/",
  "--glob", "!.next/",
}

require('telescope').setup({
  defaults = {
    -- Аргументы ripgrep для live_grep и grep_string
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      unpack(exclude_args),
    },
  },
})

vim.keymap.set('n', '<leader>ff', function()
  builtin.find_files({
    find_command = { "rg", "--files", "--color", "never", unpack(exclude_args) },
  })
end, {})
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

