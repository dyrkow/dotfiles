-- Строка состояния внизу буфера
-- https://github.com/nvim-lualine/lualine.nvim

require('lualine').setup({
    options = { theme = 'horizon' };
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
