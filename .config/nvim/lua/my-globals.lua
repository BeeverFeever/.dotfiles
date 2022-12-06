local M = {
    winblend = 0,
    border_style = "single",
    border_chars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
    icons = {
        Text = "",
        Method = "",
        Function = "",
        Constructor = "",
        Field = "ﰠ",
        Variable = "",
        Class = "ﴯ",
        Interface = "",
        Module = "",
        Property = "ﰠ",
        Unit = "",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "פּ",
        Event = "",
        Operator = "",
        TypeParameter = "",
    },
    diagnostics_icons = {
        info = "I", --""
        hint = "H", --""
        warn = "W", --""
        error = "E", --""
    },
}

return M
