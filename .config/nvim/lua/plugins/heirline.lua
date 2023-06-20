local conditions = utils.get_package("heirline.conditions")
local heirutils = utils.get_package("heirline.utils")
local heirline = utils.get_package("heirline")

local space = { provider = " " }

local ViMode = {
    static = {
        mode_names = {
            n        = 'normal',
            no       = 'op',
            nov      = 'op',
            noV      = 'op',
            ["no"]  = 'op',
            niI      = 'normal',
            niR      = 'normal',
            niV      = 'normal',
            nt       = 'normal',
            v        = "visual",
            V        = 'visual_lines',
            [""]    = 'visual_block',
            s        = "select",
            S        = 'select',
            [""]    = "block",
            i        = 'insert',
            ic       = 'insert',
            ix       = 'insert',
            R        = 'replace',
            Rc       = 'replace',
            Rv       = 'v_replace',
            Rx       = 'replace',
            c        = 'command',
            cv       = 'command',
            ce       = 'command',
            r        = 'enter',
            rm       = 'more',
            ["r?"]   = 'confirm',
            ["!"]    = 'shell',
            t        = 'terminal',
            ["null"] = 'none',
        },
        mode_table = {
            normal       = 'NORMAL',
            op           = 'OP',
            visual       = 'VISUAL',
            visual_lines = 'V LINE',
            visual_block = 'V BLOCK',
            select       = 'SELECT',
            block        = 'BLOCK',
            insert       = 'INSERT',
            replace      = 'REPLACE',
            v_replace    = 'V-REPLACE',
            command      = 'COMMAND',
            enter        = 'ENTER',
            more         = 'MORE',
            confirm      = 'CONFIRM',
            shell        = 'SHELL',
            terminal     = 'TERMINAL',
            none         = 'NONE'
        },
    },
    provider = function(self)
        return "%2(" .. self.mode_table[self.mode_names[vim.fn.mode(1)]] .. "%)"
    end,
    hl = function(self)
        local colour = self:mode_colour()
        return { fg = colour, bold = true, }
    end,
}

local Git = {
    condition = conditions.is_git_repo,
    init = function(self)
        self.status_dict = vim.b.gitsigns_status_dict
        self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
    end,
    hl = { fg = "orange" },
    {
      -- git branch name
        provider = function(self)
            return " " .. self.status_dict.head
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
        hl = { fg = "git_add" },
    },
    {
        provider = function(self)
            local count = self.status_dict.removed or 0
            return count > 0 and ("-" .. count)
        end,
        hl = { fg = "git_del" },
    },
    {
        provider = function(self)
            local count = self.status_dict.changed or 0
            return count > 0 and ("~" .. count)
        end,
        hl = { fg = "git_change" },
    },
    {
        condition = function(self)
            return self.has_changes
        end,
        provider = ")",
    },
}

local Diagnostics = {
    condition = conditions.has_diagnostics,
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
            return self.errors > 0 and (self.error_icon .. self.errors .. " ")
        end,
        hl = { fg = "diag_error" },
    },
    {
        provider = function(self)
            return self.warnings > 0 and (self.warn_icon .. self.warnings .. " ")
        end,
        hl = { fg = "diag_warn" },
    },
    {
        provider = function(self)
            return self.info > 0 and (self.info_icon .. self.info .. " ")
        end,
        hl = { fg = "diag_info" },
    },
    {
        provider = function(self)
            return self.hints > 0 and (self.hint_icon .. self.hints)
        end,
        hl = { fg = "diag_hint" },
    },
    {
        provider = "]",
    },
}

-- We're getting minimalists here!
local Ruler = {
    -- %l = current line number
    -- %L = number of lines in the buffer
    -- %c = column number
    -- %P = percentage through file of displayed window
    provider = "%(%l/%3L%:%2c%) %P",
}

local align_right = {
    provider = "%="
}

local statusline = {
    static = {
        mode_colours = {
            n = "orange",
            i = "green",
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
    -- components
    space,
    ViMode,
    space,
    Git,
    space,
    Diagnostics,

    align_right,
    Ruler,
}

heirline.setup({
    statusline = statusline,
    -- winbar = {},
    -- tabline = {},
    -- statuscolumn = {},
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
        diag_warn = heirutils.get_highlight("DiagnosticWarn").fg,
        diag_error = heirutils.get_highlight("DiagnosticError").fg,
        diag_hint = heirutils.get_highlight("DiagnosticHint").fg,
        diag_info = heirutils.get_highlight("DiagnosticInfo").fg,
        git_del = heirutils.get_highlight("DiffDelete").fg,
        git_add = heirutils.get_highlight("DiffAdd").fg,
        git_change = heirutils.get_highlight("DiffChange").fg,
    }
end

heirline.load_colors(setup_colors)
-- or pass it to config.opts.colors

vim.api.nvim_create_augroup("Heirline", { clear = true })
vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
        heirutils.on_colorscheme(setup_colors)
    end,
    group = "Heirline",
})
