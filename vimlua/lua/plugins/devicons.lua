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
        }
    };
})
