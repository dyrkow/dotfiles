--[[ Добавляет цветовую схему ]]--
-- https://github.com/catppuccin/nvim
--
-- Старя цветовая схема на основе которой делается переопределение
-- https://noahfrederick.com/vim-color-scheme-hemisu/

require("catppuccin").setup {
    color_overrides = {
        all = {},
        latte = {},
        frappe = {},
        macchiato = {},
        mocha = {
            base = "#000000",
            mantle = "#000000",
            crust = "#000000",
        },
    }
}

vim.cmd.colorscheme "catppuccin"
