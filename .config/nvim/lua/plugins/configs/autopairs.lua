local autopairs = require("utils").get_package("nvim-autopairs")
local cmp_autopairs = require("utils").get_package("nvim-autopairs.completion.cmp")
local cmp = require("utils").get_package("cmp")

autopairs.setup({
    check_ts = true,
    fast_wrap = {},
    disable_filetype = { "TelescopePrompt", "vim" },
})

cmp.event:on(
    "confirm_done",
    cmp_autopairs.on_confirm_done()
)
