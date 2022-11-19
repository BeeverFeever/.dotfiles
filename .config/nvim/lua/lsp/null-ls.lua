-- I dont really understand the point of this but like its doing something
local nulls = require("utils").get_package("null-ls")

nulls.setup({
    sources = {
        -- nulls.builtins.diagnostics.luacheck,
        -- nulls.builtins.diagnostics.clang_check,

        -- nulls.builtins.formatting.clang_format,
        nulls.builtins.formatting.stylua,
        nulls.builtins.formatting.trim_newlines,
        nulls.builtins.formatting.trim_whitespace,

        nulls.builtins.code_actions.gitsigns,
    },
})
