--[[ Подсветка синтаксиса на базе treesitter ]]--
-- https://github.com/nvim-treesitter/nvim-treesitter

require("nvim-treesitter.configs").setup({
  ensure_installed = {
    -- редактор
    "lua", "vim", "vimdoc",
    -- JS/TS ядро
    "javascript", "typescript", "tsx", "json", "jsonc", "json5",
    -- разметка и стили
    "html", "css", "scss",
    -- конфиги и инфраструктура
    "yaml", "toml", "xml", "bash", "dockerfile", "make", "cmake",
    -- бэкенд/API
    "graphql", "sql", "http", "prisma",
    -- документация
    "markdown", "markdown_inline",
    -- VCS и патчи
    "diff", "gitcommit", "gitignore", "git_rebase", "git_config", "gitattributes",
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
})
