--[[ Остальные настройки ]]--

local opt = vim.opt

opt.fixeol = false -- Отключаем дополнение файлов в конце
opt.encoding = "UTF-8" -- Кодировка используемая для чтения и записи файлов
opt.clipboard:append("unnamedplus") -- Использование системного буфера
opt.termguicolors = true -- Позволяет плагину подсветки цветов отображать цвета. Но из-за этого поялвяется фоновая подсветка элементов в теме

-- Ручная регистрация filetypes, которых нет во встроенном детекте
vim.filetype.add({
  extension = {
    http = "http", -- REST-файлы для плагина http
    rest = "http",
  },
})
