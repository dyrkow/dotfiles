--[[ Конфигурация отображения ]]--

local opt = vim.opt

opt.ttyfast = true -- Улучшает плавность scroll
opt.scrolloff = 20 -- Минимальное количество строк над и под курсором
opt.number = true -- Отображает номер строки
opt.ruler = true -- Отображение номера строки и столбца
opt.splitright = true -- Новое окно будет добавляться справа
opt.list = true -- Визуально отображает пробельные символы при вводе
opt.linespace = 3 -- Расстояние в pixels между строк
opt.splitright = true -- Split вертикальные окна вправо
opt.splitbelow = true -- Split горизонтальные окна вниз
opt.hidden = true -- Позволяет открывать другие буферы, не сохраняя изменения в текущем
opt.cursorline = true -- Выделять строку с курсором
opt.mousehide = true -- При вводе символов, скрывает курсор мыши
