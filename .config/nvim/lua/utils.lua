local M = {}

M.get_package = function (pkg_name)
    local ok, package = pcall(require, pkg_name)
    if not ok then
        print(string.format("ERROR: could not require %s", pkg_name))
    else
        return package
    end
end

M.set_keymaps = function (map_table)
    -- see if we just remove this part of this file from our brains then the
    -- rest of the way i am doing keymapping looks fucking sexy as so from this comment downwards we are going
    -- to completely forget about. :)
    for _, v in pairs(map_table) do
        vim.keymap.set(v[1], v[2], v[3], v[4])
    end
end

return M
