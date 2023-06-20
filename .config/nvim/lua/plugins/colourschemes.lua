local M = {}

function M.kanagawa()
    local kana = utils.get_package("kanagawa")

    kana.setup({
        compile = false,
        undercurl = true, -- enable undercurls
        commentStyle = { italic = true },
        functionStyle = { bold = true },
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = { bold = true },
        transparent = false,   -- do not set background color
        dimInactive = false,   -- dim inactive window `:h hl-NormalNC`
        terminalColors = true, -- define vim.g.terminal_color_{0,17}
        theme = "wave",
        background = {
            dark = "dragon",
            light = "lotus",
        },
        colors = { theme = { wave = {
                    ui = {
                        bg = "#181616",
                    },
                },
                all = {
                    ui = {
                        bg_gutter = "none",
                        -- fg = "#54546D"
                    },
                },
            },
        },
        overrides = function(colors)
            return {
                Pmenu = { fg = colors.theme.ui.shade0, bg = colors.theme.ui.bg_p1 },
                PmenuSel = { fg = "NONE", bg = colors.theme.ui.bg_p2 },
                PmenuSbar = { bg = colors.theme.ui.bg_m1 },
                PmenuThumb = { bg = colors.theme.ui.bg_p2 },
                -- I think I can make this more general for any colourscheme
                -- however I can't be bothered to do that right now and I don't
                -- plan on changing from this amazing colourscheme
                CmpItemAbbrDeprecated = { fg = colors.palette.katanaGray, bg = "NONE", strikethrough = true },
                CmpItemAbbrMatch = { fg = colors.palette.boatYellow2, bg = "NONE", bold = true },
                CmpItemAbbrMatchFuzzy = { fg = colors.palette.boatYellow2, bg = "NONE", bold = true },
                CmpItemMenu = { fg = colors.palette.oniViolet, bg = "NONE", italic = true },
                CmpItemKindField = { fg = colors.palette.fujiWhite, bg = colors.palette.peachRed },
                CmpItemKindProperty = { fg = colors.palette.fujiWhite, bg = colors.palette.peachRed },
                CmpItemKindEvent = { fg = colors.palette.fujiWhite, bg = colors.palette.peachRed },
                CmpItemKindText = { bg = colors.palette.springGreen, fg = colors.palette.fujiWhite },
                CmpItemKindEnum = { bg = colors.palette.oniViolet, fg = colors.palette.fujiWhite },
                CmpItemKindKeyword = { bg = colors.palette.oniViolet, fg = colors.palette.fujiWhite },
                CmpItemKindConstant = { bg = colors.palette.surimiOrange, fg = colors.palette.fujiWhite },
                CmpItemKindConstructor = { bg = colors.palette.surimiOrange, fg = colors.palette.fujiWhite },
                CmpItemKindReference = { bg = colors.palette.surimiOrange, fg = colors.palette.fujiWhite },
                CmpItemKindFunction = { bg = colors.palette.crystalBlue, fg = colors.palette.fujiWhite },
                CmpItemKindStruct = { bg = colors.palette.boatYellow2, fg = colors.palette.fujiWhite },
                CmpItemKindClass = { bg = colors.palette.boatYellow2, fg = colors.palette.fujiWhite },
                CmpItemKindModule = { bg = colors.palette.boatYellow2, fg = colors.palette.fujiWhite },
                CmpItemKindOperator = { bg = colors.palette.boatYellow2, fg = colors.palette.fujiWhite },
                CmpItemKindVariable = { bg = colors.palette.waveAqua2, fg = colors.palette.fujiWhite },
                CmpItemKindFile = { bg = colors.palette.waveAqua2, fg = colors.palette.fujiWhite },
                CmpItemKindUnit = { bg = colors.palette.springBlue, fg = colors.palette.fujiWhite },
                CmpItemKindSnippet = { bg = colors.palette.springBlue, fg = colors.palette.fujiWhite },
                CmpItemKindFolder = { bg = colors.palette.springBlue, fg = colors.palette.fujiWhite },
                CmpItemKindMethod = { bg = colors.palette.sakuraPink, fg = colors.palette.fujiWhite },
                CmpItemKindValue = { bg = colors.palette.sakuraPink, fg = colors.palette.fujiWhite },
                CmpItemKindEnumMember = { bg = colors.palette.sakuraPink, fg = colors.palette.fujiWhite },
                CmpItemKindInterface = { bg = colors.palette.springViolet2, fg = colors.palette.fujiWhite },
                CmpItemKindColor = { bg = colors.palette.springViolet2, fg = colors.palette.fujiWhite },
                CmpItemKindTypeParameter = { bg = colors.palette.springViolet2, fg = colors.palette.fujiWhite },
                FloatTitle = { --[[ cterm = "bold" ,]] italic = true, fg = "#ff9e3b", bg = "#16161D" },
                WinSeparator = { fg = colors.theme.ui.nontext },
            }
        end,
    })

    -- vim.o.colorscheme = "kanagawa"
    vim.cmd("colorscheme kanagawa")
    -- require("custom-hl-groups").kanagawa_colors()
end

return M
