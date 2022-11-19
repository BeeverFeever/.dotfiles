local M = {}

M.get_package = function (pkg_name)
    local ok, package = pcall(require, pkg_name)
    if not ok then
        print(string.format("ERROR: could not require %s", pkg_name))
    else
        return package
    end
end

return M
