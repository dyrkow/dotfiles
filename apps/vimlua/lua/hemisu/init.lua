-- hemisu/init.lua
-- Neovim colorscheme entry point (called by `colors/hemisu.lua`).

local Palette = require("hemisu.palette")
local Groups = require("hemisu.groups")

local M = {}

function M.setup()
  vim.cmd("hi clear")

  if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
  end

  -- Declare theme name (standard Vim colorscheme mechanism).
  vim.g.colors_name = "hemisu"

  local palette = Palette.get(vim.o.background)
  Groups.apply(palette)
end

return M

