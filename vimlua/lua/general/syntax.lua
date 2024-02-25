--[[ Конфигурация синтаксиса ]]--


-- Настройка цветовой схемы
vim.cmd("set background=dark")
vim.cmd("syntax on")

-- Визуализация пробельных символов
vim.opt.listchars:append {
  tab = "► ",
  precedes = "«",
  extends = "»",
  trail = "•",
  -- eol = "↵", Больше мешает
}
