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
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} }
  }
})

require('plugins/ibl');

-- Можно использовать вот эти символы для гита ○ ◌ ◍ ◎ ∴ ✖ ✕ ▲ ☉ ☭ ± ✓ ☠ 🍺 ☐ ☑ ☒
