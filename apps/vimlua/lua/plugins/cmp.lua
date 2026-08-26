--[[ Движок автодополнения с иконками ]]--
-- https://github.com/hrsh7th/nvim-cmp
local cmp = require('cmp')
local lspkind = require('lspkind')

cmp.setup({
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol_text',
      maxwidth = 50,
      ellipsis_char = '...',
    }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
  },
  mapping = {
    ['<Tab>'] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
      else
        cmp.complete()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
      else
        cmp.complete()
      end
    end, { 'i', 's' }),
    ['<C-e>'] = cmp.mapping.abort(),
  },
})

cmp.setup.filetype('sql', {
  sources = cmp.config.sources({
    { name = 'vim-dadbod-completion' },
    { name = 'buffer' },
  }),
})
