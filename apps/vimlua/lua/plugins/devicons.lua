--[[ Добавляет поддержку иконок файлов ]]--
-- https://github.com/nvim-tree/nvim-web-devicons

-- Иконки можно подбирать используя вот эту ссылку
-- https://www.nerdfonts.com/cheat-sheet

require("nvim-web-devicons").setup({
    color_icons = true;
    default = true;
    override_by_extension = {
        ["ogg"] = {
            icon = "",
            color = "#ffffff",
            cterm_color = "#ffffff",
            name = "Ogg"
        },
        ["svg"] = {
            icon = "󰈟",
            color = "#99D56F",
            cterm_color = "#99D56F",
            name = "Svg"
        },
        ["png"] = {
            icon = "󰈟",
            color = "#99D56F",
            cterm_color = "#99D56F",
            name = "Png"
        },
        ["gradle"] = {
            icon = "",
            color = "#ffffff",
            cterm_color = "#ffffff",
            name = "Gradle"
        }
    };
    override_by_filename = {
        ["gradlew"] = {
            icon = "",
            color = "#ffffff",
            cterm_color = "#ffffff",
            name = "Gradle"
        },
        [".prettierrc"] = {
            icon = "",
            color = "#6d8086",
            name = "Prettierrc"
        },
    };
})

require("nvim-web-devicons").set_default_icon('', '#6d8086', 65)
