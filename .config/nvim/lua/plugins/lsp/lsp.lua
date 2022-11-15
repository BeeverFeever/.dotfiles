local ok, navic = pcall(require, "nvim-navic")
if not ok then
    return
end
 
local M = {}

M.setup = function () 
    local signs = {
        { name = "DiagnosticSignError", text = "" },
        { name = "DiagnosticSignWarn", text = "" },
        { name = "DiagnosticSignHint", text = "" },
        { name = "DiagnosticSignInfo", text = "" },
    }

    -- set the diagnostic icons
    for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
    end

    local config = {
        underline = true,
        virtual_text = {
            source = true,
            format = function (diagnostic)
                -- if diagnostic.severity == vim.diagnostic.severity.ERROR then
                --     return string.format("\nE: %s", diagnostic.message)
                -- end
                return string.format("\n %s", diagnostic.message)
            end
        },
        signs = {
            acitve = signs,
        },
        update_in_insert = false,
        severity_sort = true,
        float = {
            focusable = false,
            style = "minimal",
            -- border = "square",
            scope = "line", -- can be "buffer" or "cursor"
            pos = 0,            -- show diagnostic at this position if "line" or "cursor" is used for scope.
            header = "",
            source = "always",
            prefix = "",
        }
    }

    vim.diagnostic.config(config)

    -- diagnostic keybinds
    local opts = { noremap=true, silent=true }
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
end

local function lsp_keymaps (bufnr)
    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

M.on_attach = function (client, bufnr)
    lsp_keymaps(bufnr)

    if client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
    end
end

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- M.capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
M.capabilities = require("cmp_nvim_lsp").default_capabilities()

return M
