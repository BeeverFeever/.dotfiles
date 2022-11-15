local lsp = require("plugins.lsp.lsp")

local ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not ok then
    print("ERROR: mason-lspconfig not setup")
    return
end

mason_lspconfig.setup({
    ensure_installed = { "clangd", "sumneko_lua" }
})

print("the handlers are about to be setup")
mason_lspconfig.setup_handlers {
    function (server_name)
        require("lspconfig")[server_name].setup {
            capabilities = lsp.capabilities,
            on_attach = lsp.on_attach,
        }
    end,

    ["sumneko_lua"] = function ()
        require("lspconfig")["sumneko_lua"].setup {
            settings = {
                Lua = {
                    diagnostic = {
                        global = { "vim", },
                    },
                    telemetery = {
                        enable = false,
                    },
                },
            },
        }
    end,
}
