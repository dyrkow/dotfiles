--[[ Конфигурация поиска ]]--

local opt = vim.opt
local g = vim.g

opt.ignorecase = true -- Игнорирует регистр при поиске в файле
opt.smartcase = true -- Игнорирует mixed кейсы при поиске в файле
vim.api.nvim_set_option('hlsearch', false)

