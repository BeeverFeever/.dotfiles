local M = {}

M.nvim_tree = function(api, event)
    api.events.subscribe(event, function()
        require("utils").get_package("custom-hl-groups").float_titles()
    end)
end

return M
