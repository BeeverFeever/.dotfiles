local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
    return
end

print("lsp is initialising")

-- im calling mason just for extra reassuracne that it was setup
require("plugins.configs.mason")
require("plugins.lsp.lsp").setup()
require("plugins.lsp.handlers")
