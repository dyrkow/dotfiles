--[[ Конфигурация синтаксиса ]]--


-- Настройка цветовой схемы
vim.cmd("set background=dark")
vim.cmd("syntax on")
vim.cmd("colorscheme hemisu")

-- Визуализация пробельных символов
vim.opt.listchars:append {
  tab = "► ",
  precedes = "«",
  extends = "»",
  trail = "•",
  -- eol = "↵", Больше мешает
}
