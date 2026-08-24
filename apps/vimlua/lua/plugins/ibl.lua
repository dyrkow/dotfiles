--[[ Добавляет подсветку отступов внутри ]]--
-- https://github.com/lukas-reineke/indent-blankline.nvim

require("ibl").setup({
    indent = { char = "¦" },
    scope = {
        -- Подчёркивание начала и конца текущего блока
        show_start = false,
        show_end = false,
    },
})
