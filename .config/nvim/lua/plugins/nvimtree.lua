local nvimtree = require("utils").get_package("nvim-tree")
local nvimtree_config = require("utils").get_package("nvim-tree.config")
local tree_cb = nvimtree_config.nvim_tree_callback

-- local diagnostics_icons = require("utils").get_package("my-globals").diagnostics_icons
local icons = require("utils").get_package("my-globals").icons

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

-- TODO: re-vamp this
function on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- vim.keymap.set('n', '<C-]>', api.tree.change_root_to_node,          opts('CD'))
  -- vim.keymap.set('n', '<C-e>', api.node.open.replace_tree_buffer,     opts('Open: In Place'))
  -- vim.keymap.set('n', '<C-k>', api.node.show_info_popup,              opts('Info'))
  -- vim.keymap.set('n', '<C-r>', api.fs.rename_sub,                     opts('Rename: Omit Filename'))
  -- vim.keymap.set('n', '<C-t>', api.node.open.tab,                     opts('Open: New Tab'))
  -- vim.keymap.set('n', '<C-v>', api.node.open.vertical,                opts('Open: Vertical Split'))
  -- vim.keymap.set('n', '<C-x>', api.node.open.horizontal,              opts('Open: Horizontal Split'))
  -- vim.keymap.set('n', '<BS>',  api.node.navigate.parent_close,        opts('Close Directory'))
  vim.keymap.set('n', '<CR>',  api.node.open.edit,                    opts('Open'))
  vim.keymap.set('n', '<Tab>', api.node.open.preview,                 opts('Open Preview'))
  -- vim.keymap.set('n', '>',     api.node.navigate.sibling.next,        opts('Next Sibling'))
  -- vim.keymap.set('n', '<',     api.node.navigate.sibling.prev,        opts('Previous Sibling'))
  -- vim.keymap.set('n', '.',     api.node.run.cmd,                      opts('Run Command'))
  -- vim.keymap.set('n', '-',     api.tree.change_root_to_parent,        opts('Up'))
  vim.keymap.set('n', 'a',     api.fs.create,                         opts('Create'))
  -- vim.keymap.set('n', 'bmv',   api.marks.bulk.move,                   opts('Move Bookmarked'))
  -- vim.keymap.set('n', 'B',     api.tree.toggle_no_buffer_filter,      opts('Toggle No Buffer'))
  vim.keymap.set('n', 'c',     api.fs.copy.node,                      opts('Copy'))
  vim.keymap.set('n', 'C',     api.tree.toggle_git_clean_filter,      opts('Toggle Git Clean'))
  -- vim.keymap.set('n', '[c',    api.node.navigate.git.prev,            opts('Prev Git'))
  -- vim.keymap.set('n', ']c',    api.node.navigate.git.next,            opts('Next Git'))
  -- vim.keymap.set('n', 'd',     api.fs.remove,                         opts('Delete'))
  -- vim.keymap.set('n', 'D',     api.fs.trash,                          opts('Trash'))
  -- vim.keymap.set('n', 'E',     api.tree.expand_all,                   opts('Expand All'))
  -- vim.keymap.set('n', 'e',     api.fs.rename_basename,                opts('Rename: Basename'))
  -- vim.keymap.set('n', ']e',    api.node.navigate.diagnostics.next,    opts('Next Diagnostic'))
  -- vim.keymap.set('n', '[e',    api.node.navigate.diagnostics.prev,    opts('Prev Diagnostic'))
  vim.keymap.set('n', 'F',     api.live_filter.clear,                 opts('Clean Filter'))
  vim.keymap.set('n', 'f',     api.live_filter.start,                 opts('Filter'))
  -- vim.keymap.set('n', 'g?',    api.tree.toggle_help,                  opts('Help'))
  -- vim.keymap.set('n', 'gy',    api.fs.copy.absolute_path,             opts('Copy Absolute Path'))
  -- vim.keymap.set('n', 'H',     api.tree.toggle_hidden_filter,         opts('Toggle Dotfiles'))
  -- vim.keymap.set('n', 'I',     api.tree.toggle_gitignore_filter,      opts('Toggle Git Ignore'))
  -- vim.keymap.set('n', 'J',     api.node.navigate.sibling.last,        opts('Last Sibling'))
  -- vim.keymap.set('n', 'K',     api.node.navigate.sibling.first,       opts('First Sibling'))
  -- vim.keymap.set('n', 'm',     api.marks.toggle,                      opts('Toggle Bookmark'))
  -- vim.keymap.set('n', 'o',     api.node.open.edit,                    opts('Open'))
  -- vim.keymap.set('n', 'O',     api.node.open.no_window_picker,        opts('Open: No Window Picker'))
  vim.keymap.set('n', 'p',     api.fs.paste,                          opts('Paste'))
  -- vim.keymap.set('n', 'P',     api.node.navigate.parent,              opts('Parent Directory'))
  vim.keymap.set('n', 'q',     api.tree.close,                        opts('Close'))
  vim.keymap.set('n', 'r',     api.fs.rename,                         opts('Rename'))
  -- vim.keymap.set('n', 'R',     api.tree.reload,                       opts('Refresh'))
  -- vim.keymap.set('n', 's',     api.node.run.system,                   opts('Run System'))
  -- vim.keymap.set('n', 'S',     api.tree.search_node,                  opts('Search'))
  -- vim.keymap.set('n', 'U',     api.tree.toggle_custom_filter,         opts('Toggle Hidden'))
  vim.keymap.set('n', 'W',     api.tree.collapse_all,                 opts('Collapse'))
  vim.keymap.set('n', 'x',     api.fs.cut,                            opts('Cut'))
  vim.keymap.set('n', 'y',     api.fs.copy.filename,                  opts('Copy Name'))
  vim.keymap.set('n', 'Y',     api.fs.copy.relative_path,             opts('Copy Relative Path'))
  -- vim.keymap.set('n', '<2-LeftMouse>',  api.node.open.edit,           opts('Open'))
  -- vim.keymap.set('n', '<2-RightMouse>', api.tree.change_root_to_node, opts('CD'))


  vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Directory'))
  vim.keymap.set('n', 'v', api.node.open.vertical, opts('Open: Vertical Split'))
end

local config = {
    auto_reload_on_write = true,
    disable_netrw = true,
    hijack_cursor = false,
    hijack_netrw = true,
    hijack_unnamed_buffer_when_opening = false,
    ignore_buf_on_tab_change = {},
    sort_by = "name",
    root_dirs = {},
    prefer_startup_root = true,
    sync_root_with_cwd = true,
    reload_on_bufenter = false,
    respect_buf_cwd = true,
    on_attach = on_attach,
    remove_keymaps = false,
    select_prompts = false,
    view = {
        adaptive_size = false,
        centralize_selection = false,
        width = 30,
        side = "left",
        preserve_window_proportions = false,
        number = false,
        relativenumber = false,
        signcolumn = "yes",
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
        root_folder_label = false,
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
                git = icons.git,
            },
        },
        special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md", "makefile", "Makefile" },
        symlink_destination = true,
    },
    hijack_directories = {
        enable = true, -- handle this case in the open_nvim_tree callback
        auto_open = true,
    },
    update_focused_file = {
        enable = true,
        update_root = false,
        ignore_list = {},
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
            hint = icons.diagnostics.hint,
            info = icons.diagnostics.info,
            warning = icons.diagnostics.warn,
            error = icons.diagnostics.error,
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
        ignore = false,
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
        always_show_folders = true,
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
}

local function open_nvim_tree(data)
    -- local directory = vim.fn.isdirectory(data.file)
    local real_file = vim.fn.filereadable(data.file)
    local no_name = data.file == "[No Name]" -- or vim.bo[data.buf].buftype == ""

    if not real_file or no_name then
        config.view.float.enable = false
        nvimtree.setup(config)
        require("nvim-tree.api").tree.open()
        config.view.float.enable = true
        nvimtree.setup(config)
    end
end
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

nvimtree.setup(config)
