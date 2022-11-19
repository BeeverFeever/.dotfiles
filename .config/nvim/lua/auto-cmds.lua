local M = {}

M.nvim_tree = function(api, event)
    api.events.subscribe(event, function()
        require("custom-hl-groups").float_titles()
    end)
end

return M
