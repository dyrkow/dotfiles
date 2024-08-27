--[[ Расширенный анализ кода для лучшей подсветки ]]
-- https://github.com/nvim-treesitter/nvim-treesitter

require'nvim-treesitter.configs'.setup {
  ensure_installed = { "lua", "vim", "markdown", "dockerfile", "html", "javascript", "json", "typescript", "yaml" },
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

vim.api.nvim_set_hl(0, "@keyword.import", { link = "Constant" })
