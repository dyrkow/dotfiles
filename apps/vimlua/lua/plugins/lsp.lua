--[[ LSP: mason + mason-lspconfig + нативный API nvim 0.11+ ]]--

-- Mason: автоустановщик LSP-серверов
require("mason").setup()

-- Добавить Mason bin в PATH чтобы LSP-серверы находились
vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin:" .. vim.env.PATH

-- Конфигурация серверов через нативный API (ДО mason-lspconfig)
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local servers = {
  'ts_ls', 'html', 'cssls', 'jsonls',
  'eslint', 'emmet_ls', 'bashls', 'lua_ls',
}

for _, server in ipairs(servers) do
  vim.lsp.config(server, { capabilities = capabilities })
end

-- mason-lspconfig: автоматически установит и включит серверы
-- automatic_enable = true (по умолчанию) вызовет vim.lsp.enable()
require("mason-lspconfig").setup({
  ensure_installed = servers,
})

-- Маппинги (работают когда LSP активен)
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local opts = { buffer = args.buf }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', 'gy', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>qf', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  end,
})
