-- Been adjusted from TJ's config
-- local bootstrap_package_manager = function()
--     if vim.fn.input("Download lazy? (y/n)") ~= "y" then
--         return
--     end
-- 
--     local directory = string.format("%s/site/pack/lazy/lazy.nvim", vim.fn.stdpath("data"))
-- 
--     vim.fn.mkdir(directory, "p")
-- 
--     local out = vim.fn.system(string.format("git clone --filter=blob:none https://github.com/folke/lazy.nvim.git --branch=stable %s", directory))
-- 
--     print(out)
--     print("Downloading lazy.nvim...")
-- 
--     vim.opt.rtp:prepend(directory)
-- 
--     print("( You'll need to restart now )")
-- 
-- 
-- 
-- 
-- end

return function()
    local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
    if not vim.loop.fs_stat(lazypath) then
        vim.fn.system({
            "git",
            "clone",
            "--filter=blob:none",
            "--single-branch",
            "https://github.com/folke/lazy.nvim.git",
            lazypath,
        })

        print("You probably most likely need to restart nvim now")
        return true
    end
    vim.opt.runtimepath:prepend(lazypath)
    return false
end
