-- Кодировка файла
vim.opt.encoding = "UTF-8"

-- Использование пробелов вместо табуляции
vim.opt.expandtab = true

-- Количество пробелов в табе
vim.opt.shiftwidth = 4
vim.opt.tabstop=4

-- Использование системного буфера
vim.opt.clipboard = "unnamed"

-- Выделять строку с курсором
vim.opt.cursorline = true

-- Позволяет открывать другие буферы, не сохраняя изменения в текущем
vim.opt.hidden = true

-- Количество команд в истории
vim.opt.history = 500

-- Игнорирует регистр при поиске в файле
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Оптимизация draw интерфейса
vim.opt.lazyredraw = true

-- Расстояние в pixels между строк
vim.opt.linespace = 3

-- Визуально отображает пробельные символы при вводе
vim.opt.list = true

-- При вводе символов, скрывает курсор мыши
vim.opt.mousehide = true

-- Максимальное количество колонок подсветки синтаксиса
vim.opt.synmaxcol = 512

-- Какие символы использовать для отображения пробельных символов
-- TODO: Что-то не работает
-- vim.opt.listchars = { "tab:‣", "trail:•", "precedes:«", "extends:»" }

-- TODO: Что-то не работает
-- vim.opt.guifont = "Anonymice Nerd Font Complete Mono:h14"

-- Отображает номер строки
vim.opt.number = true

-- Отображение номера строки и столбца
vim.opt.ruler = true

-- Минимальное количество строк над и под курсором
vim.opt.scrolloff = 20

-- Новое окно будет добавляться справа
vim.opt.splitright = true

-- Улучшает плавность отображение интерфейса
vim.opt.ttyfast = true
