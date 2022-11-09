local ready, navic = pcall(require, "nvim-navic")
if not ready then
    return
end

navic.setup {
    -- TODO: setup the icons
    highlight = true,
    separator = ">",
    depth_limit = 0,
    depth_limit_indicator = "..",
}
