local function kanagawa()
    local kana = require("utils").get_package("kanagawa")

    kana.setup({
        undercurl = true, -- enable undercurls
        commentStyle = { italic = true },
        functionStyle = { bold = true },
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        variablebuiltinStyle = { italic = true },
        specialReturn = true, -- special highlight for the return keyword
        specialException = false, -- special highlight for exception handling keywords
        transparent = false, -- do not set background color
        dimInactive = false, -- dim inactive window `:h hl-NormalNC`
        globalStatus = false, -- adjust window separators highlight for laststatus=3
        terminalColors = true, -- define vim.g.terminal_color_{0,17}
        colors = {},
        overrides = {},
        theme = "dragon" -- Load "default" theme or the experimental "light" theme
    })

    vim.cmd("colorscheme kanagawa")
    require("custom-hl-groups").kanagawa_colours()
end

local function catppuccin(flavour)
    local cat = require("utils").get_package("catppuccin")

    cat.setup({
        flavour = flavour, -- latte, frappe, macchiato, mocha
        -- background = { -- :h background
        --     light = "latte",
        --     dark = "mocha",
        -- },
        -- transparent_background = true,
        -- term_colors = false,
        -- dim_inactive = {
        --     enabled = false,
        --     shade = "dark",
        --     percentage = 0.15,
        -- },
        -- no_italic = false, -- Force no italic
        -- no_bold = false, -- Force no bold
        -- styles = {
        --     comments = { "italic" },
        --     conditionals = { "italic" },
        --     loops = {},
        --     functions = { "bold" },
        --     keywords = {},
        --     strings = {},
        --     variables = {},
        --     numbers = {},
        --     booleans = {},
        --     properties = {},
        --     types = {},
        --     operators = {},
        -- },
        -- color_overrides = {},
        -- custom_highlights = {},
        -- integrations = {
        --     cmp = true,
        --     gitsigns = true,
        --     nvimtree = true,
        --     telescope = true,
        --     markdown = true,
        --     mason = true,
        --     navic = true,
        --     treesitter = true,
        --     -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
        -- },
    })

    vim.cmd("colorscheme catppuccin")
end

-- local function gruvbox()
--     local gruv = require("utils").get_package("gruvbox")

--     gruv.setup({
--         undercurl = true,
--         underline = true,
--         bold = true,
--         italic = true,
--         strikethrough = true,
--         invert_selection = false,
--         invert_signs = false,
--         invert_tabline = false,
--         invert_intend_guides = false,
--         inverse = true, -- invert background for search, diffs, statuslines and errors
--         contrast = "", -- can be "hard", "soft" or empty string
--         palette_overrides = {},
--         overrides = {},
--         dim_inactive = false,
--         transparent_mode = false,
--     })

--     vim.cmd("colorscheme gruvbox")
-- end

local M = {}

M.set_theme = function(name, flavour)
    if name == "kanagawa" then
        kanagawa()
    elseif name == "catppuccin" then
        catppuccin(flavour)
    -- elseif name == "gruvbox" then
    --     gruvbox()
    end
end

return M
