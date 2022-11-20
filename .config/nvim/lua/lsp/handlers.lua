local navic = require("utils").get_package("nvim-navic")
local cmp_nvim_lsp = require("utils").get_package("cmp_nvim_lsp")

local diagnostics_icons = require("utils").get_package("my-globals")

local M = {}

local client_capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = cmp_nvim_lsp.default_capabilities(client_capabilities)
M.capabilities.textDocument.completion.completionItem.snippetSupport = true

M.capabilities.textDocument.completion.completionItem = {
    documentationFormat = { "markdown", "plaintext" },
    snippetSupport = true,
    preselectSupport = true,
    insertReplaceSupport = true,
    labelDetailsSupport = true,
    deprecatedSupport = true,
    commitCharactersSupport = true,
    tagSupport = { valueSet = { 1 } },
    resolveSupport = {
        properties = {
            "documentation",
            "detail",
            "additionalTextEdits",
        },
    },
}

M.setup = function()
    local signs = {
        { name = "DiagnosticSignInfo", text = diagnostics_icons.info },
        { name = "DiagnosticSignHint", text = diagnostics_icons.hint },
        { name = "DiagnosticSignWarn", text = diagnostics_icons.warn },
        { name = "DiagnosticSignError", text = diagnostics_icons.error },
    }

    -- set the diagnostic icons
    for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
    end

    local config = {
        virtual_text = {
            prefix = "",
            --     source = true,
            --     format = function (diagnostic)
            --         -- if diagnostic.severity == vim.diagnostic.severity.ERROR then
            --         --     return string.format("\nE: %s", diagnostic.message)
            --         -- end
            --         return string.format("%s %s", diagnostic.severity, diagnostic.message)
            --     end
        },
        signs = true,
        update_in_insert = false,
        severity_sort = true,
        underline = true,
        -- float = {
        --     focusable = true,
        --     style = "minimal",
        --     border = "none",
        --     source = "always",
        --     header = "",
        --     prefix = "",
        -- }
    }

    vim.diagnostic.config(config)

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "single",
    })
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "single",
        relative = "cursor",
    })

    require("utils").get_package("keymaps").diagnostics()
end

M.on_attach = function(client, bufnr)
    -- keymaps
    require("utils").get_package("keymaps").lsp(bufnr)

    -- client.offset_encoding = "utf-32"

    if client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
    end
end

return M
