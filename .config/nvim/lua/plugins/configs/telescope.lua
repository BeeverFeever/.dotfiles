local telescope = require("utils").get_package("telescope")
local globals = require("utils").get_package("my-globals")

telescope.setup({
    defaults = {
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
        },
        prompt_prefix = "   ",
        selection_caret = "  ",
        entry_prefix = "   ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = {
                prompt_position = "top",
                preview_width = 0.55,
                results_width = 0.8,
            },
            vertical = {
                mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
        },
        -- preview = true,
        file_sorter = require("telescope.sorters").get_fuzzy_file,
        file_ignore_patterns = { "node_modules" },
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        path_display = { "truncate" },
        results_title = "Hmm show me what you got :)",
        prompt_title = "Search me :)",
        winblend = globals.winblend,
        border = true,
        borderchars = globals.border_chars,
        color_devicons = true,
        set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
        file_previewer = require("telescope.previewers").cat.new,
        grep_previewer = require("telescope.previewers").vimgrep.new,
        qflist_previewer = require("telescope.previewers").qflist.new,
        -- Developer configurations: Not meant for general override
        buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
        mappings = {
            require("utils").get_package("keymaps").telescope,
        },
    },
})

-- telescope.extensions = {
--     fzf = {
--         fuzzy = true,
--         override_generic_sorter = true,
--         override_file_sort = true,
--         case_mode = "smart_case",
--     },
-- }

-- load extensions
-- telescope.load_extension("fzf")
