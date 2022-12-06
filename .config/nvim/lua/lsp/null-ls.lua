-- I dont really understand the point of null-ls but like its doing something
local nulls = require("utils").get_package("null-ls")

nulls.setup({
    sources = {
        -- nulls.builtins.diagnostics.luacheck,
        -- nulls.builtins.diagnostics.clang_check,

        -- nulls.builtins.formatting.clang_format.with({
        --     extra_args = {
        --         "--style={BasedOnStyle: LLVM, IndentWidth: 4}",
        --         "--cross-file-rename",
        --         "--suggest-missing-includes",
        --     }
        -- }),
        -- nulls.builtins.formatting.stylua,
        nulls.builtins.formatting.trim_newlines,
        nulls.builtins.formatting.trim_whitespace,

        nulls.builtins.code_actions.gitsigns,
    },
})
