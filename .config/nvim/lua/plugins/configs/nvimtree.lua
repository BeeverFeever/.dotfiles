local nvimtree = require("utils").get_package("nvim-tree")
local nvimtree_config = require("utils").get_package("nvim-tree.config")
local nvimtree_api = require("utils").get_package("nvim-tree.api")
local tree_cb = nvimtree_config.nvim_tree_callback

local diagnostics_icons = require("utils").get_package("my-globals").diagnostics_icons

local gwidth = vim.api.nvim_list_uis()[1].width
local gheight = vim.api.nvim_list_uis()[1].height
local min_width = 20
local min_height = 20

-- there might be a nicer solution to this but i cant be bothered to think about
-- it right now
local new_width = function()
    if (gwidth / 2) < min_width then
        return min_width
    else
        return math.floor(gwidth / 2)
    end
end
local new_height = function()
    if (gheight / 1.5) < min_height then
        return min_height
    else
        return math.floor(gheight / 1.5)
    end
end
local col = (gwidth / 2) - (new_width() / 2)
local row = (gheight / 2) - (new_height() / 2)

-- make the title look nice, tbh this is kinda a bit hacky rn
-- TODO: maybe fix this. Find a way to alter the `FloatTitle` hl group a bit
-- nicer
require("auto-cmds").nvim_tree(nvimtree_api, nvimtree_api.events.Event.TreeOpen)

nvimtree.setup({
    auto_reload_on_write = true,
    create_in_closed_folder = true,
    disable_netrw = true,
    hijack_cursor = false,
    hijack_netrw = true,
    hijack_unnamed_buffer_when_opening = false,
    ignore_buffer_on_setup = false,
    open_on_setup = false,
    open_on_setup_file = false,
    open_on_tab = false,
    ignore_buf_on_tab_change = {},
    sort_by = "name",
    root_dirs = {},
    prefer_startup_root = true,
    sync_root_with_cwd = true,
    reload_on_bufenter = false,
    respect_buf_cwd = true,
    on_attach = "disable",
    remove_keymaps = false,
    select_prompts = false,
    view = {
        adaptive_size = false,
        centralize_selection = false,
        width = 30,
        hide_root_folder = true,
        side = "left",
        preserve_window_proportions = false,
        number = false,
        relativenumber = false,
        signcolumn = "yes",
        mappings = {
            custom_only = false,
            list = {
                { key = { "l", "<CR>", "o" }, cb = tree_cb("edit") },
                { key = "h", cb = tree_cb("close_node") },
                { key = "v", cb = tree_cb("vsplit") },
                -- { key = "r", cb = tree_cb("full_rename")},
            },
        },
        float = {
            enable = true,
            quit_on_focus_loss = true,
            open_win_config = {
                relative = "editor",
                border = "single",
                width = new_width(),
                height = new_height(),
                row = row,
                col = col,
                title = "It's a tree :)",
                title_pos = "right"
            },
        },
    },
    renderer = {
        add_trailing = false,
        group_empty = true,
        highlight_git = true,
        full_name = false,
        highlight_opened_files = "none",
        root_folder_modifier = ":t",
        indent_width = 2,
        indent_markers = {
            enable = false,
            inline_arrows = true,
            icons = {
                corner = "└",
                edge = "│",
                item = "│",
                bottom = "─",
                none = " ",
            },
        },
        icons = {
            webdev_colors = true,
            git_placement = "signcolumn",
            padding = " ",
            symlink_arrow = " ➛ ",
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = true,
            },
            glyphs = {
                default = "",
                symlink = "",
                bookmark = "",
                folder = {
                    arrow_closed = "",
                    arrow_open = "",
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                    symlink_open = "",
                },
                git = {
                    unstaged = "✗",
                    staged = "✓",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "★",
                    deleted = "",
                    ignored = "◌",
                },
            },
        },
        special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md", "makefile", "Makefile" },
        symlink_destination = true,
    },
    hijack_directories = {
        enable = true,
        auto_open = true,
    },
    update_focused_file = {
        enable = true,
        update_root = false,
        ignore_list = {},
    },
    ignore_ft_on_setup = {
        "startify",
        "dashboard",
        "alpha",
    },
    system_open = {
        cmd = "",
        args = {},
    },
    diagnostics = {
        enable = true,
        show_on_dirs = true,
        debounce_delay = 50,
        icons = {
            hint = diagnostics_icons.hint,
            info = diagnostics_icons.info,
            warning = diagnostics_icons.warn,
            error = diagnostics_icons.error,
        },
    },
    filters = {
        dotfiles = false,
        custom = {},
        exclude = {},
    },
    filesystem_watchers = {
        enable = true,
        debounce_delay = 50,
        ignore_dirs = {},
    },
    git = {
        enable = true,
        ignore = true,
        show_on_dirs = true,
        timeout = 400,
    },
    actions = {
        use_system_clipboard = true,
        change_dir = {
            enable = true,
            global = true,
            restrict_above_cwd = true,
        },
        expand_all = {
            max_folder_discovery = 300,
            exclude = { ".git" },
        },
        file_popup = {
            open_win_config = {
                col = 1,
                row = 1,
                relative = "cursor",
                border = "shadow",
                style = "minimal",
            },
        },
        open_file = {
            quit_on_open = true,
            resize_window = true,
            window_picker = {
                enable = false,
                chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                exclude = {
                    filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
                    buftype = { "nofile", "terminal", "help" },
                },
            },
        },
        remove_file = {
            close_window = false,
        },
    },
    trash = {
        cmd = "gio trash",
        require_confirm = true,
    },
    live_filter = {
        prefix = "(FILTER): ",
        always_show_folders = false,
    },
    log = {
        enable = false,
        truncate = false,
        types = {
            all = false,
            config = false,
            copy_paste = false,
            dev = false,
            diagnostics = false,
            git = false,
            profile = false,
            watcher = false,
        },
    },
    notify = {
        threshold = vim.log.levels.INFO,
    },
})
