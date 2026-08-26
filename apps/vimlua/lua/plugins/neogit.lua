--[[ Git-интерфейс в стиле magit (status, commit, push, pull, branch) ]]--
-- https://github.com/NeogitOrg/neogit
local neogit = require('neogit')

neogit.setup({
  kind = "tab",
  graph_style = "unicode",
  integrations = { diffview = true, telescope = true },
  mappings = {
    status = {
      ["o"] = "Toggle",
    },
  },
})

vim.keymap.set('n', '<leader>gg', function() neogit.open() end)
