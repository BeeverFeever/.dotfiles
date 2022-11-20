local kanagawa = require("utils").get_package("kanagawa")

kanagawa.setup({
    undercurl = true,           -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = { bold = true },
    keywordStyle = { italic = true},
    statementStyle = { bold = true },
    typeStyle = {},
    variablebuiltinStyle = { italic = true},
    specialReturn = true,       -- special highlight for the return keyword
    specialException = false,    -- special highlight for exception handling keywords
    transparent = false,        -- do not set background color
    dimInactive = true,        -- dim inactive window `:h hl-NormalNC`
    globalStatus = false,       -- adjust window separators highlight for laststatus=3
    terminalColors = true,      -- define vim.g.terminal_color_{0,17}
    colors = {},
    overrides = {},
    theme = "dragon"           -- Load "default" theme or the experimental "light" theme
})

vim.cmd("colorscheme kanagawa")
require("custom-hl-groups").kanagawa_colours()
