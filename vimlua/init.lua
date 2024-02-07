local keymap = require("keymap");

local set = vim.opt

set.encoding = "UTF-8" -- Кодировка используемая для чтения и записи файлов
set.expandtab = true -- Замена tab на пробелы
set.shiftwidth = 4 -- Количество символов, используемых для выравнивания кода при сдвиге вправо
set.tabstop = 4 -- Количество пробелов, на которое будут заменен tab
set.clipboard:append("unnamedplus") -- Использование системного буфера
set.cursorline = true -- Выделять строку с курсором
set.hidden = true -- Позволяет открывать другие буферы, не сохраняя изменения в текущем
set.history = 500 -- Количество команд в истории
set.ignorecase = true -- Игнорирует регистр при поиске в файле
set.smartcase = true -- Игнорирует mixed кейсы при поиске в файле
set.splitright = true -- Split вертикальные окна вправо
set.splitbelow = true -- Split горизонтальные окна вниз
set.lazyredraw = true -- Оптимизация draw интерфейса
set.linespace = 3 -- Расстояние в pixels между строк
set.list = true -- Визуально отображает пробельные символы при вводе
set.mousehide = true -- При вводе символов, скрывает курсор мыши
set.synmaxcol = 512 -- Максимальное количество колонок подсветки синтаксиса
set.number = true -- Отображает номер строки
set.ruler = true -- Отображение номера строки и столбца
set.scrolloff = 20 -- Минимальное количество строк над и под курсором
set.splitright = true -- Новое окно будет добавляться справа
set.ttyfast = true -- Улучшает плавность отображение интерфейса
set.spell = true -- Включает проверку орфографии
set.spelllang = { "en_us", "ru" } -- Какие языки нужно поддерживать при проверке орфографии

-- Какие символы использовать для отображения пробельных символов
-- TODO: Что-то не работает
-- vim.opt.listchars = { "tab:‣", "trail:•", "precedes:«", "extends:»" }

vim.g.mapleader = " " -- Определяем лидер клавишу как пробел

-- Самый популярный и поддерживаемый пакетный менеджер
-- https://github.com/folke/lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

-- Запускаем пакетный менеджер и передаем в него список плагинов
require("lazy").setup({
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    }
  }
})

-- Space + n открывает файловое дерево
keymap.nmap('<leader>n', '<cmd>:Neotree toggle<CR>')
