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
     "nvim-telescope/telescope.nvim", tag = "0.1.6",
     dependencies = { "nvim-lua/plenary.nvim" }
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },
  {
    "dyrkow/partizan.nvim"
  }
})

require('partizan').setup();

require('plugins/ibl')
require('plugins/neotree')
require('plugins/devicons')
require('plugins/hightlight')
require('plugins/autopairs')
require('plugins/surround')
require('plugins/tmuxnavigation')
require('plugins/comment')
require('plugins/lualine')
require('plugins/telescope')
