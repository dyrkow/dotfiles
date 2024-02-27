--[[ Добавляет цветовую схему ]]--
-- https://github.com/catppuccin/nvim
--
-- Старя цветовая схема на основе которой делается переопределение
-- https://noahfrederick.com/vim-color-scheme-hemisu/

require("catppuccin").setup {
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
    transparent_background = false,
    term_colors = true,
    no_underline = true, -- Force no underline
    styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" }, -- Change the style of comments
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
        -- miscs = {}, -- Uncomment to turn off hard-coded styles
    },
    color_overrides = {
        all = {},
        latte = {},
        frappe = {},
        macchiato = {},
        mocha = {
            -- TODO: доопределять цвета
            -- но что-то мне кажется что не все можно настироить, либо надо
            -- переопределять highlight-args
            base = "#000000", -- Фон
            crust = "#444444", -- Разделитель между буферами
            mantle = "#000000", -- Строка названия файла
            -- surface0 = "#ff0000",
            -- surface1 = "#ff0000",
            -- surface2 = "#ff0000",
            -- overlay0 = "#777777", -- Цвет комментариев
            -- overlay1 = "#ff0000",
            -- overlay2 = "#ff0000",
            -- text = "#EEEEEE", -- Основной текст
            -- subtext0 = "#ff0000",
            -- subtext1 = "#ff0000",
            -- blue = "#999999", -- Скобочки и пробелы
            -- green = "#B1D631", -- Строки
            -- yellow = "#ff0000",
            -- red = "#ff0000",
            -- rosewater = "#ff0000",

            -- Code editor
            -- mauve = "#B1D631", -- Ключевые слова
            -- peach = "#ff0000",
            -- pink = "#ff0000",
            -- sky = "#ff0000",
        },
    }
}

-- "#000000"
-- "#FFFFFF"
-- "#EEEEEE"
-- "#111111"
-- "#777777"
-- "#999999"
-- "#BBBBBB"
-- "#444444"
--
-- "#63001C"
-- "#FF0055"
-- "#D65E76"
-- "#FFAFAF"
--
-- "#005F87"
-- "#538192"
-- "#9FD3E6"
-- "#CBE4EE"
--
-- "#5F5F00"
-- "#739200"
-- "#B1D631"
-- "#BBFFAA"
--
-- "#503D15"
-- "#ECE1C8"

vim.cmd.colorscheme "catppuccin"
