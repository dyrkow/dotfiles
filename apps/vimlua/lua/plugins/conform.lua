--[[ Форматирование через conform.nvim: prettier + .editorconfig ]]--
require("conform").setup({
  formatters_by_ft = {
    javascript = { "prettier" },
    javascriptreact = { "prettier" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    json = { "prettier" },
    jsonc = { "prettier" },
    html = { "prettier" },
    css = { "prettier" },
    scss = { "prettier" },
    less = { "prettier" },
    markdown = { "prettier" },
    yaml = { "prettier" },
    graphql = { "prettier" },
  },
})

vim.keymap.set("n", "<leader>f", function()
  require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format buffer (prettier)" })
