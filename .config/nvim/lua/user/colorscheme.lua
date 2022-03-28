local colorscheme = "kanagawa"

local status_ok, kanagawa = pcall(require, "kanagawa")
if not status_ok then
    return
end

if colorscheme == "kanagawa" then
    kanagawa.setup({
        transparent = true,
        dimInactive = true,
    })
end

if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. " not found")
    return
end

vim.cmd("colorscheme " .. colorscheme)
