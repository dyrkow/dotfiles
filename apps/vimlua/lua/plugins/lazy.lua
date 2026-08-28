-- Самый популярный и поддерживаемый пакетный менеджер
-- https://github.com/folke/lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

-- Запускаем пакетный менеджер и передаем в него список плагинов
require("lazy").setup({
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
  },
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
  { "alexghergh/nvim-tmux-navigation" },
  { "brenoprata10/nvim-highlight-colors" },
  { "windwp/nvim-autopairs" },
  { "kylechui/nvim-surround" },
  { "terrortylor/nvim-comment" },
  {
     "nvim-telescope/telescope.nvim", tag = "v0.2.2",
     dependencies = { "nvim-lua/plenary.nvim" }
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },
  { "lewis6991/gitsigns.nvim" },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "sindrets/diffview.nvim",
    },
  },
  { "sindrets/diffview.nvim" },
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod", lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql" }, lazy = true },
    },
    cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "onsails/lspkind-nvim",
    },
  },
  { "williamboman/mason.nvim" },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      { "williamboman/mason.nvim" },
      { "neovim/nvim-lspconfig" },
    },
  }
})

require('plugins/ibl')
require('plugins/neotree')
require('plugins/devicons')
require('plugins/hightlight')
require('plugins/autopairs')
require('plugins/surround')
require('plugins/tmuxnavigation')
require('plugins/comment')
require('plugins/lualine')
require('plugins/gitsigns')
require('plugins/telescope')
require('plugins/treesitter')
require('plugins/neogit')
require('plugins/diffview')
require('plugins/dadbod')
require('plugins/lsp')
require('plugins/diagnostics')
require('plugins/cmp')
