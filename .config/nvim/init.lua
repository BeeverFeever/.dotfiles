if require ("first-run")() then
    return
end

require("options")
require("keymaps")
require("plugins.manager")
require("lsp")

require("auto-cmds")

require("custom-hl-groups").float_titles()
require("custom-hl-groups").kanagawa_completion()
