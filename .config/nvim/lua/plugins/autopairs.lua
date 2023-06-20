local autopairs = utils.get_package("nvim-autopairs")
local cmp_autopairs = utils.get_package("nvim-autopairs.completion.cmp")
local cmp = utils.get_package("cmp")

autopairs.setup({
    check_ts = true,
    fast_wrap = {},
    disable_filetype = { "TelescopePrompt", "vim" },
    enable_close_bracket_line = false,
})

cmp.event:on(
    "confirm_done",
    cmp_autopairs.on_confirm_done()
)

autopairs.add_rules(require('nvim-autopairs.rules.endwise-lua'))
