local opt = vim.opt
local g = vim.g

-- TODO: самый популярный и поддерживаемый пакетный менеджер
-- https://github.com/folke/lazy.nvim

-- Кодировка файла
opt.encoding = "UTF-8"

-- Использование пробелов вместо табуляции
opt.expandtab = true

-- Количество пробелов в табе
opt.shiftwidth = 4
opt.tabstop=4

-- Использование системного буфера
opt.clipboard:append("unnamedplus")

-- Выделять строку с курсором
opt.cursorline = true

-- Позволяет открывать другие буферы, не сохраняя изменения в текущем
opt.hidden = true

-- Количество команд в истории
opt.history = 500

-- Игнорирует регистр при поиске в файле
opt.ignorecase = true

-- Игнорирует mixed кейсы при поиске в файле
opt.smartcase = true

-- Split вертикальные окна вправо
opt.splitright = true

-- Split горизонтальные окна вниз
opt.splitbelow = true

-- Оптимизация draw интерфейса
opt.lazyredraw = true

-- Расстояние в pixels между строк
opt.linespace = 3

-- Визуально отображает пробельные символы при вводе
opt.list = true

-- При вводе символов, скрывает курсор мыши
opt.mousehide = true

-- Максимальное количество колонок подсветки синтаксиса
opt.synmaxcol = 512

-- Какие символы использовать для отображения пробельных символов
-- TODO: Что-то не работает
-- vim.opt.listchars = { "tab:‣", "trail:•", "precedes:«", "extends:»" }

-- TODO: Что-то не работает
-- vim.opt.guifont = "Anonymice Nerd Font Complete Mono:h14"

-- Отображает номер строки
opt.number = true

-- Отображение номера строки и столбца
opt.ruler = true

-- Минимальное количество строк над и под курсором
opt.scrolloff = 20

-- Новое окно будет добавляться справа
opt.splitright = true

-- Улучшает плавность отображение интерфейса
opt.ttyfast = true

-- Включаем проверку орфографии
opt.spelllang = { "en_us", "ru" }
opt.spell = true

-- Лидеркей
g.mapleader = " "
