local navic = require("utils").get_package("nvim-navic")
local cmp_nvim_lsp = require("utils").get_package("cmp_nvim_lsp")

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

vim.pretty_print()

vim.lsp.handlers["textDocument/formatting"] = vim.lsp.with

M.setup = function()
    -- local signs = {
    --     { name = "DiagnosticSignError", text = "" },
    --     { name = "DiagnosticSignWarn", text = "" },
    --     { name = "DiagnosticSignHint", text = "" },
    --     { name = "DiagnosticSignInfo", text = "" },
    -- }

    -- -- set the diagnostic icons
    -- for _, sign in ipairs(signs) do
    --     vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
    -- end

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

    local opts = { noremap = true, silent = true }
    vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
    -- TODO: change this to be a plugin like trouble.nvim
    vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)
end

local function lsp_keymaps(bufnr)
    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
    -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    -- vim.keymap.set('n', '<space>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, bufopts)
    vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
    vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
    vim.keymap.set("n", "<space>f", function() vim.lsp.buf.format({ formatting_options = { tabSize = 4, insertSpaces = true, trimTrailingWhitespace = true }}) end, bufopts)
end

M.on_attach = function(client, bufnr)
    lsp_keymaps(bufnr)

    if client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
    end
end

return M
