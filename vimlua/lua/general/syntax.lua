--[[ Конфигурация синтаксиса ]]--

-- Визуализация пробельных символов
vim.opt.listchars:append {
  tab = "> ",
  precedes = "«",
  extends = "»",
  trail = "•",
  -- eol = "↵", Больше мешает
}
