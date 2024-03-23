--[[ Добавляет поддержку иконок файлов ]]--
-- https://github.com/nvim-tree/nvim-web-devicons

require("nvim-web-devicons").setup({
    color_icons = true;
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
        }
    };
})
