-- Строка состояния внизу буфера
-- https://github.com/nvim-lualine/lualine.nvim

require('lualine').setup({
    options = (function()
      local palette = require('hemisu.palette').get(vim.o.background)
      local function hex(c)
        return c.gui
      end

      -- Lualine theme is independent from Neovim highlight groups.
      -- We map the main hemisu accents into lualine modes/sections.
      local theme = {
        normal = {
          a = { fg = hex(palette.bg), bg = hex(palette.accent3), gui = 'bold' },
          b = { fg = hex(palette.norm), bg = hex(palette.faint) },
          c = { fg = hex(palette.dimmed), bg = hex(palette.faint) },
        },
        insert = {
          a = { fg = hex(palette.bg), bg = hex(palette.accent2), gui = 'bold' },
          b = { fg = hex(palette.norm), bg = hex(palette.faint) },
          c = { fg = hex(palette.dimmed), bg = hex(palette.faint) },
        },
        visual = {
          a = { fg = hex(palette.bg), bg = hex(palette.accent1), gui = 'bold' },
          b = { fg = hex(palette.norm), bg = hex(palette.faint) },
          c = { fg = hex(palette.dimmed), bg = hex(palette.faint) },
        },
        replace = {
          a = { fg = hex(palette.bg), bg = hex(palette.normRed), gui = 'bold' },
          b = { fg = hex(palette.norm), bg = hex(palette.faint) },
          c = { fg = hex(palette.dimmed), bg = hex(palette.faint) },
        },
        command = {
          a = { fg = hex(palette.bg), bg = hex(palette.accent4), gui = 'bold' },
          b = { fg = hex(palette.norm), bg = hex(palette.faint) },
          c = { fg = hex(palette.dimmed), bg = hex(palette.faint) },
        },
        inactive = {
          a = { fg = hex(palette.dimmed), bg = hex(palette.faint) },
          b = { fg = hex(palette.dimmed), bg = hex(palette.faint) },
          c = { fg = hex(palette.dimmed), bg = hex(palette.faint) },
        },
      }

      return theme
    end)();
    sections = {
      lualine_a = {'mode'},
      lualine_b = {'branch', 'diff', 'diagnostics'},
      lualine_c = {
        {
          'filename',
          path = 4
        }
      },
      lualine_x = { 'filetype', 'filesize'},
      lualine_y = {'encoding', 'progress' },
      lualine_z = {'location'}
    }
  });
