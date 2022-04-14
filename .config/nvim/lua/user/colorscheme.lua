-- COLOURSCHEMES --
-- kanagawa
-- tokyodark
-- onedark

local colorscheme = "onedark"

local status_ok, kanagawa = pcall(require, "kanagawa")
if not status_ok then
    return
end

local status_ok, onedark = pcall(require, "onedark")
if not status_ok then
    return
end

local status_ok, tokyodark = pcall(require, "tokyodark")
if not status_ok then
    return
end

-- kanagawa config
if colorscheme == "kanagawa" then
    kanagawa.setup({
        transparent = true,
        dimInactive = true,
        globalstatus = true,
    })
end

if colorscheme == "onedark" then
    onedark.setup({
        style = 'warmer'
    })
end

if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. " not found")
    return
end

vim.cmd("colorscheme " .. colorscheme)
