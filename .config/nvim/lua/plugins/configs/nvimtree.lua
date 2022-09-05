local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
    return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

require'nvim-tree'.setup {
    disable_netrw       = true,
    hijack_netrw        = true,
    open_on_setup       = false,
    ignore_ft_on_setup  = {
        "startify",
        "dashboard",
        "alpha",
    },
    hijack_unnamed_buffer_when_opening = true,
    hijack_cursor       = false,
    update_cwd          = true,
    system_open = {
        cmd  = nil,
        args = {}
    },
    diagnostics = {
        enable = true,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        }
    },
    git = {
        enable = true,
        ignore = false,
        timeout = 500,
    },
    view = {
        hide_root_folder = true,
        width = 30,
        height = 30,
        side = 'left',
        number = false,
        relativenumber = false,
        signcolumn = "yes",
        mappings = {
            custom_only = false,
            list = {
                { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
                { key = "h", cb = tree_cb "close_node" },
                { key = "v", cb = tree_cb "vsplit" },
            }
        },
    },
    filters = {
        dotfiles = false,
        custom = { "^.git$" }
    },
    trash = {
        cmd = "trash",
        require_confirm = true
    },
    actions = {
        change_dir = { 
            enable = true,
            global = true,
        },
        open_file = {
            window_picker = {
                enable = false,
            },
            resize_window = true,
        },
    },
    renderer = {
	icons = {
	    glyphs = {
		    default = "",
		    symlink = "",
		    git = {
			unstaged = "✗",
			staged = "✓",
			unmerged = "",
			renamed = "➜",
			untracked = "★",
			deleted = "",
			ignored = "◌"
		    },
		    folder = {
			arrow_open = "",
			arrow_closed = "",
			default = "",
			open = "",
			empty = "",
			empty_open = "",
			symlink = "",
			symlink_open = "",
		    },
		}
	    }
	}
}
