local M = {}

-- get access to kanagawa colours, this setup only works for kanagawa and I will
-- have to set this up for other colourschemes
M.kanagawa_colours = function()
    if vim.g.colors_name == "kanagawa" then
        local colours = require("kanagawa.colors").setup()
        local custom_hl = {

            -- CMP COMPLETION WINDOW --
            PmenuSel = { bg = colours.waveBlue2, fg = "NONE" },
            Pmenu = { fg = colours.fujiWhite, bg = colours.waveBlue1 },

            CmpItemAbbrDeprecated = { fg = colours.katanaGray, bg = "NONE", strikethrough = true },
            CmpItemAbbrMatch = { fg = colours.katanaGray, bg = "NONE", bold = true },
            CmpItemAbbrMatchFuzzy = { fg = colours.katanaGray, bg = "NONE", bold = true },
            CmpItemMenu = { fg = colours.autumnYellow, bg = "NONE", italic = true },

            CmpItemKindField = { fg = colours.fujiWhite, bg = colours.peachRed },
            CmpItemKindProperty = { fg = colours.fujiWhite, bg = colours.peachRed },
            CmpItemKindEvent = { fg = colours.fujiWhite, bg = colours.peachRed },

            CmpItemKindText = { bg = colours.springGreen, fg = colours.fujiWhite },
            CmpItemKindEnum = { bg = colours.oniViolet, fg = colours.fujiWhite },
            CmpItemKindKeyword = { bg = colours.oniViolet, fg = colours.fujiWhite },

            CmpItemKindConstant = { bg = colours.surimiOrange, fg = colours.fujiWhite },
            CmpItemKindConstructor = { bg = colours.surimiOrange, fg = colours.fujiWhite },
            CmpItemKindReference = { bg = colours.surimiOrange, fg = colours.fujiWhite },

            CmpItemKindFunction = { bg = colours.crystalBlue, fg = colours.fujiWhite },
            CmpItemKindStruct = { bg = colours.boatYellow2, fg = colours.fujiWhite },
            CmpItemKindClass = { bg = colours.boatYellow2, fg = colours.fujiWhite },
            CmpItemKindModule = { bg = colours.boatYellow2, fg = colours.fujiWhite },
            CmpItemKindOperator = { bg = colours.boatYellow2, fg = colours.fujiWhite },

            CmpItemKindVariable = { bg = colours.waveAqua2, fg = colours.fujiWhite },
            CmpItemKindFile = { bg = colours.waveAqua2, fg = colours.fujiWhite },

            CmpItemKindUnit = { bg = colours.springBlue, fg = colours.fujiWhite },
            CmpItemKindSnippet = { bg = colours.springBlue, fg = colours.fujiWhite },
            CmpItemKindFolder = { bg = colours.springBlue, fg = colours.fujiWhite },

            CmpItemKindMethod = { bg = colours.sakuraPink, fg = colours.fujiWhite },
            CmpItemKindValue = { bg = colours.sakuraPink, fg = colours.fujiWhite },
            CmpItemKindEnumMember = { bg = colours.sakuraPink, fg = colours.fujiWhite },

            CmpItemKindInterface = { bg = colours.springViolet2, fg = colours.fujiWhite },
            CmpItemKindColor = { bg = colours.springViolet2, fg = colours.fujiWhite },
            CmpItemKindTypeParameter = { bg = colours.springViolet2, fg = colours.fujiWhite },

            -- NAVIC -- 
            -- the only reason these are here is because it was in the navic
            -- repo somewhere and i thought why not, if i want to change the
            -- colour of something i can have it here

            -- NavicIconsFile = { default = true, bg = "#000000", fg = "#ffffff" },
            -- NavicIconsModule = { default = true, bg = "#000000", fg = "#ffffff" },
            -- NavicIconsNamespace = { default = true, bg = "#000000", fg = "#ffffff" },
            -- NavicIconsPackage = { default = true, bg = "#000000", fg = "#ffffff" },
            -- NavicIconsClass = { default = true, bg = "#000000", fg = "#ffffff" },
            -- NavicIconsMethod = { default = true, bg = "#000000", fg = "#ffffff" },
            -- NavicIconsProperty = { default = true, bg = "#000000", fg = "#ffffff" },
            -- NavicIconsField = { default = true, bg = "#000000", fg = "#ffffff" },
            -- NavicIconsConstructor = { default = true, bg = "#000000", fg = "#ffffff" },
            -- NavicIconsEnum = { default = true, bg = "#000000", fg = "#ffffff" },
            -- NavicIconsInterface = { default = true, bg = "#000000", fg = "#ffffff" },
            -- NavicIconsFunction = { default = true, bg = "#000000", fg = "#ffffff" },
            -- NavicIconsVariable = { default = true, bg = "#000000", fg = "#ffffff" },
            -- NavicIconsConstant = { default = true, bg = "#000000", fg = "#ffffff" },
            -- NavicIconsString = { default = true, bg = "#000000", fg = "#ffffff" },
            -- NavicIconsNumber = { default = true, bg = "#000000", fg = "#ffffff" },
            -- NavicIconsBoolean = { default = true, bg = "#000000", fg = "#ffffff" },
            -- NavicIconsArray = { default = true, bg = "#000000", fg = "#ffffff" },
            -- NavicIconsObject = { default = true, bg = "#000000", fg = "#ffffff" },
            -- NavicIconsKey = { default = true, bg = "#000000", fg = "#ffffff" },
            -- NavicIconsNull = { default = true, bg = "#000000", fg = "#ffffff" },
            -- NavicIconsEnumMember = { default = true, bg = "#000000", fg = "#ffffff" },
            -- NavicIconsStruct = { default = true, bg = "#000000", fg = "#ffffff" },
            -- NavicIconsEvent = { default = true, bg = "#000000", fg = "#ffffff" },
            -- NavicIconsOperator = { default = true, bg = "#000000", fg = "#ffffff" },
            -- NavicIconsTypeParameter = { default = true, bg = "#000000", fg = "#ffffff" },
            -- NavicText = { default = true, bg = "#000000", fg = "#ffffff" },
            -- NavicSeparator = { default = true, bg = "#000000", fg = "#ffffff" },
        }
        for group, config in pairs(custom_hl) do
            vim.api.nvim_set_hl(0, group, config)
        end
    end
end

M.float_titles = function()
    -- to my knowledge there isn't any lua based function to update a hl group
    -- only to completely override them
    -- TODO: fix this when a lua function comes to update hl groups
    vim.cmd("hi FloatTitle guifg=#FF9E3B gui=italic")
end

return M
