return {
    'akinsho/flutter-tools.nvim',
    lazy = false,
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    config = {
        lsp = {
            on_attach = function(client, bufnr)
                utils.get_package("keymaps").lsp(bufnr)
            end
        }
    },
}
