--[[ Конфигурация синтаксиса ]]--


-- Настройка цветовой схемы
vim.cmd("set background=dark")
vim.cmd("syntax on")
vim.cmd.colorsche('hemisu')
-- моя кастомная схема похожая на hemisu
-- vim.cmd.colorsche('partizan')

-- Визуализация пробельных символов
vim.opt.listchars:append {
  tab = "► ",
  precedes = "«",
  extends = "»",
  trail = "•",
  -- eol = "↵", Больше мешает
}
