return {
    "rebelot/heirline.nvim",
    config = function()
        local heirline = utils.get_package("heirline")
        local heirutils = utils.get_package("heirline.utils")
        local conditions = utils.get_package("heirline.conditions")
        local colours = utils.get_package("kanagawa.colors").setup().theme

        local space = { provider = " " }
        local align = { provider = "%=" }

        local ViMode = {
            static = {
                mode_names = {
                    n        = "normal",
                    no       = "op",
                    nov      = "op",
                    noV      = "op",
                    ["no"]  = "op",
                    niI      = "normal",
                    niR      = "normal",
                    niV      = "normal",
                    nt       = "normal",
                    v        = "visual",
                    V        = "visual_lines",
                    [""]    = "visual_block",
                    s        = "select",
                    S        = "select",
                    [""]    = "block",
                    i        = "insert",
                    ic       = "insert",
                    ix       = "insert",
                    R        = "replace",
                    Rc       = "replace",
                    Rv       = "v_replace",
                    Rx       = "replace",
                    c        = "command",
                    cv       = "command",
                    ce       = "command",
                    r        = "enter",
                    rm       = "more",
                    ["r?"]   = "confirm",
                    ["!"]    = "shell",
                    t        = "terminal",
                    ["null"] = "none",
                },
                mode_table = {
                    normal       = "NORMAL",
                    op           = "OP",
                    visual       = "VISUAL",
                    visual_lines = "V LINE",
                    visual_block = "V BLOCK",
                    select       = "SELECT",
                    block        = "BLOCK",
                    insert       = "INSERT",
                    replace      = "REPLACE",
                    v_replace    = "V-REPLACE",
                    command      = "COMMAND",
                    enter        = "ENTER",
                    more         = "MORE",
                    confirm      = "CONFIRM",
                    shell        = "SHELL",
                    terminal     = "TERMINAL",
                    none         = "NONE"
                },
            },
            provider = function(self)
                return " %(" .. self.mode_table[self.mode_names[vim.fn.mode(1)]] .. "%) "
            end,
            hl = function(self)
                local colour = self:mode_colour()
                return { bg = colour, fg = colours.ui.bg_m2 , bold = true, }
            end,
        }

        local Git = {
            condition = conditions.is_git_repo,
            init = function(self)
                self.status_dict = vim.b.gitsigns_status_dict
                self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
            end,
            hl = { fg = "purple" },
            {
                -- git branch name
                provider = function(self)
                    return " " .. self.status_dict.head
                end,
                hl = { bold = true }
            },
            -- You could handle delimiters, icons and counts similar to Diagnostics
            {
                condition = function(self)
                    return self.has_changes
                end,
                provider = "("
            },
            {
                provider = function(self)
                    local count = self.status_dict.added or 0
                    return count > 0 and ("+" .. count)
                end,
                hl = "DiffAdd" ,
            },
            {
                provider = function(self)
                    local count = self.status_dict.removed or 0
                    return count > 0 and ("-" .. count)
                end,
                hl = "DiffDelete" ,
            },
            {
                provider = function(self)
                    local count = self.status_dict.changed or 0
                    return count > 0 and ("~" .. count)
                end,
                hl = "DiffChange" ,
            },
            {
                condition = function(self)
                    return self.has_changes
                end,
                provider = ")",
            },
        }

        local Diagnostics = {
            -- condition = conditions.has_diagnostics,
            static = {
                error_icon = settings.icons.diagnostics.error,
                warn_icon = settings.icons.diagnostics.warn,
                info_icon = settings.icons.diagnostics.info,
                hint_icon = settings.icons.diagnostics.hint,
            },
            init = function(self)
                self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
                self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
                self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
                self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
            end,
            update = { "DiagnosticChanged", "BufEnter" },
            {
                provider = "![",
            },
            {
                provider = function(self)
                    -- 0 is just another output, we can decide to print it or not!
                    return self.errors .. " "
                end,
                hl = { fg = "diag_error" },
            },
            {
                provider = function(self)
                    return self.warnings .. " "
                end,
                hl = { fg = "diag_warn" },
            },
            {
                provider = function(self)
                    return self.info .. " "
                end,
                hl = { fg = "diag_info" },
            },
            {
                provider = function(self)
                    return self.hints
                end,
                hl = { fg = "diag_hint" },
            },
            {
                provider = "]",
            },
        }

        local FileNameBlock = {
            -- let's first set up some attributes needed by this component and it's children
            init = function(self)
                self.filename = vim.api.nvim_buf_get_name(0)
            end,
        }
        local FileIcon = {
            init = function(self)
                local filename = self.filename
                local extension = vim.fn.fnamemodify(filename, ":e")
                self.icon, self.icon_color = require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })
            end,
            provider = function(self)
                return self.icon and (self.icon .. " ")
            end,
            hl = function(self)
                return { fg = self.icon_color }
            end
        }

        local FileName = {
            provider = function(self)
                -- first, trim the pattern relative to the current directory. For other
                -- options, see :h filename-modifers
                local filename = vim.fn.fnamemodify(self.filename, ":.")
                if filename == "" then return "[No Name]" end
                -- now, if the filename would occupy more than 1/4th of the available
                -- space, we trim the file path to its initials
                -- See Flexible Components section below for dynamic truncation
                if not conditions.width_percent_below(#filename, 0.25) then
                    filename = vim.fn.pathshorten(filename)
                end
                return filename
            end,
            -- hl = { fg = "directory" },
        }

        local FileFlags = {
            {
                condition = function()
                    return vim.bo.modified
                end,
                provider = "[+]",
                hl = { fg = "green" },
            },
            {
                condition = function()
                    return not vim.bo.modifiable or vim.bo.readonly
                end,
                provider = "",
                hl = { fg = "red" },
            },
        }

        FileNameBlock = heirutils.insert(FileNameBlock,
        FileIcon,
        FileName,
        space,
        FileFlags,
        { provider = '%<'} -- this means that the statusline is cut here when there's not enough space
        )

        local Ruler = { provider = "%(%l/%L:%c%) %P " }


        local statusline = {
            static = {
                mode_colours = {
                    n = "orange",
                    i = "purple",
                    v = "cyan",
                    V = "cyan",
                    ["\22"] = "cyan",
                    c = "orange",
                    s = "purple",
                    S = "purple",
                    ["\19"] = "purple",
                    R = "orange",
                    r = "orange",
                    ["!"] = "red",
                    t = "red",
                },
                mode_colour = function(self)
                    local mode = conditions.is_active() and vim.fn.mode() or "n"
                    return self.mode_colours[mode]
                end
            },
            hl = { bg = colours.ui.bg_m2, fg = colours.ui.special },
            -- components
            space,
            ViMode,
            space,
            Diagnostics,
            space,
            Git,
            space,
            FileNameBlock,

            align,
            Ruler,
        }

        heirline.setup({
            statusline = statusline,
        })

        local function setup_colors()
            return {
                bright_bg = heirutils.get_highlight("Folded").bg,
                bright_fg = heirutils.get_highlight("Folded").fg,
                red = heirutils.get_highlight("DiagnosticError").fg,
                dark_red = heirutils.get_highlight("DiffDelete").bg,
                green = heirutils.get_highlight("String").fg,
                blue = heirutils.get_highlight("Function").fg,
                gray = heirutils.get_highlight("NonText").fg,
                orange = heirutils.get_highlight("Constant").fg,
                purple = heirutils.get_highlight("Statement").fg,
                cyan = heirutils.get_highlight("Special").fg,
                directory = heirutils.get_highlight("Directory").fg,
                diag_warn = heirutils.get_highlight("DiagnosticWarn").fg,
                diag_error = heirutils.get_highlight("DiagnosticError").fg,
                diag_hint = heirutils.get_highlight("DiagnosticHint").fg,
                diag_info = heirutils.get_highlight("DiagnosticInfo").fg,
                git_add = heirutils.get_highlight("DiagnosticWarn").fg,
                git_del = heirutils.get_highlight("DiffDelete").fg,
                git_change = heirutils.get_highlight("Directory").fg,
            }
        end

        heirutils.on_colorscheme(setup_colors)
    end,
}
