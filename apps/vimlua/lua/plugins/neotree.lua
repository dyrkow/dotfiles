--[[ Добавляет дерево файлов проекта ]]
-- https://github.com/nvim-neo-tree/neo-tree.nvim

require('keys/map')

-- Иконки можно подбирать используя вот эту ссылку
-- https://www.nerdfonts.com/cheat-sheet

require("neo-tree").setup({
    close_if_last_window = false, -- Закрывает окно дерева, если оно последнее
    enable_git_status = true, -- Показывать статусы гита
    default_component_configs = {
        indent = {
            with_markers = true,
            indent_marker= "¦",
            last_indent_marker = "└",
        },
        -- Можно использовать вот эти символы для гита ○ ◌ ◍ ◎ ∴ ✖ ✕ ▲ ☉ ☭ ± ✓ ☠ 🍺 ☐ ☑ ☒
        git_status = {
            symbols = {
                -- Change type
                added     = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
                modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
                deleted   = "",-- this can only be used in the git_status source
                renamed   = "",-- this can only be used in the git_status source
                -- Status type
                untracked = "",
                ignored   = "",
                unstaged  = "",
                staged    = "",
                conflict  = "",
            }
        },
        icon = {
            folder_closed = "",
            folder_open = "",
            folder_empty = "",
            -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
            -- then these will never be used.
            default = "",
            highlight = "NeoTreeFileIcon"
        },
        modified = {
            symbol = "",
            highlight = "NeoTreeModified",
        },
        name = {
            trailing_slash = false,
            use_git_status_colors = true,
            highlight = "NeoTreeFileName",
        },
    },
    window = {
        width = 35, -- фиксированная ширина дерева
        mapping_options = {
            noremap = true,
            nowait = true,
        },
        mappings = {
            -- Включаем режим, при котором содержимое файла под курсором будет показываться в виде окна
            ["o"] = "open",
            ["oc"] = "noop",
            ["od"] = "noop",
            ["og"] = "noop",
            ["om"] = "noop",
            ["on"] = "noop",
            ["os"] = "noop",
            ["ot"] = "noop",
            ["/"] = "noop",
            ["w"] = "noop",
            ["l"] = "noop",
        }
    },
    filesystem = {
        filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = false,
        }
    }
})

-- Neotree plugin
nm('<leader>n', '<cmd>:Neotree toggle<CR>')
nm('<leader>gs', '<cmd>:Neotree float git_status<CR>')
nm('<leader>fc', '<cmd>:Neotree reveal<CR>') -- (Follow Current)Отображает в дереве проекта текущий файл
