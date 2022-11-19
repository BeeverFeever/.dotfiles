local handlers = require("lsp.handlers")
local mason = require("utils").get_package("mason")
local mason_lspconfig = require("utils").get_package("mason-lspconfig")
local lspconfig = require("utils").get_package("lspconfig")
local lspconfig_util = require("utils").get_package("lspconfig/util")

mason.setup()
mason_lspconfig.setup({
    ensure_installed = { "clangd", "sumneko_lua" },
    automatic_installation = true,
})

mason_lspconfig.setup_handlers {
    function (server_name)
        require("lspconfig")[server_name].setup {
            capabilities = handlers.capabilities,
            on_attach = handlers.on_attach,
        }
    end,

    ["sumneko_lua"] = function ()
        require("lspconfig")["sumneko_lua"].setup {
            capabilities = handlers.capabilities,
            on_attach = handlers.on_attach,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                    telemetry = {
                        enable = false,
                    },
                },
            },
        }
    end,
    ["hls"] = function ()
        lspconfig.hls.setup({
            capabilities = handlers.capabilities,
            on_attach = handlers.on_attach,

            cmd = { "haskell-language-server-wrapper", "--lsp" },
            root_dir = function (filepath)
                return (
                    lspconfig_util.root_pattern('hie,yaml', 'stack.yaml', 'cabal.project')(filepath)
                    or lspconfig_util.root_pattern('*.cabal', 'package.yaml')(filepath)
                    or lspconfig_util.root_pattern('*.hs')(filepath)
                )
            end
        })
    end
}
