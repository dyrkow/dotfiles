--[[ Отображение диагностики (ошибки линтера и LSP) ]]--

local palette = require('hemisu.palette').get(vim.o.background)

-- Явно задаём подсветку, чтобы подчёркивание было видно даже там,
-- где терминал не поддерживает undercurl
local function set_underline(group, color)
  vim.api.nvim_set_hl(0, group, { fg = color.gui, underline = true, undercurl = true })
end
set_underline("DiagnosticUnderlineError", palette.normRed)
set_underline("DiagnosticUnderlineWarn", palette.accent4)
set_underline("DiagnosticUnderlineInfo", palette.accent1)
set_underline("DiagnosticUnderlineHint", palette.normGreen)

-- Цветные значки в колонке номеров строк (вместо букв E/W/I/H)
for name, color in pairs({
  DiagnosticSignError = palette.normRed,
  DiagnosticSignWarn = palette.accent4,
  DiagnosticSignInfo = palette.accent1,
  DiagnosticSignHint = palette.normGreen,
}) do
  vim.api.nvim_set_hl(0, name, { fg = color.gui })
end

-- Цветной текст сообщения в конце строки
for name, color in pairs({
  DiagnosticVirtualTextError = palette.normRed,
  DiagnosticVirtualTextWarn = palette.accent4,
  DiagnosticVirtualTextInfo = palette.accent1,
  DiagnosticVirtualTextHint = palette.normGreen,
}) do
  vim.api.nvim_set_hl(0, name, { fg = color.gui })
end

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '●',
      [vim.diagnostic.severity.WARN] = '▲',
      [vim.diagnostic.severity.INFO] = 'ℹ',
      [vim.diagnostic.severity.HINT] = '◆',
    },
  },
  virtual_text = {
    spacing = 2,
    prefix = '',
    format = function(diagnostic)
      local labels = {
        [vim.diagnostic.severity.ERROR] = 'Error:',
        [vim.diagnostic.severity.WARN] = 'Warn:',
        [vim.diagnostic.severity.INFO] = 'Info:',
        [vim.diagnostic.severity.HINT] = 'Hint:',
      }
      local label = labels[diagnostic.severity] or 'Diagnostic:'
      return string.format('%s %s', label, diagnostic.message)
    end,
  },
  underline = true,
  severity_sort = true,
  update_in_insert = false,
  float = {
    border = 'rounded',
    source = true,
    focusable = true,
  },
})

-- Навигация по диагностике и просмотр ошибок текущей строки
local function diagnostic_keymaps()
  vim.keymap.set('n', ']d', function()
    vim.diagnostic.goto_next({ severity = { min = vim.diagnostic.severity.WARN } })
  end)
  vim.keymap.set('n', '[d', function()
    vim.diagnostic.goto_prev({ severity = { min = vim.diagnostic.severity.WARN } })
  end)
  vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float)
end

vim.api.nvim_create_autocmd('LspAttach', {
  callback = diagnostic_keymaps,
})