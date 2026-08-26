--[[ Подсветка синтаксиса на базе treesitter (nvim 0.12+) ]]--
-- https://github.com/nvim-treesitter/nvim-treesitter

require("nvim-treesitter").setup({
  install_dir = vim.fn.stdpath("data") .. "/site",
})

require("nvim-treesitter").install({
  -- редактор
  "lua", "vim", "vimdoc",
  -- JS/TS ядро
  "javascript", "typescript", "tsx", "json", "json5",
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
})

-- Подсветка: включается через автокоманду (встроена в nvim 0.12)
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "lua", "vim", "vimdoc",
    "javascript", "typescript", "tsx", "json", "json5",
    "html", "css", "scss",
    "yaml", "toml", "xml", "bash", "dockerfile", "make", "cmake",
    "graphql", "sql", "http", "prisma",
    "markdown", "markdown_inline",
    "diff", "gitcommit", "gitignore", "git_rebase", "git_config", "gitattributes",
  },
  callback = function() vim.treesitter.start() end,
})
