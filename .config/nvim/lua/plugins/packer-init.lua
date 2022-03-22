local fn = vim.fn

local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    vim.cmd [[packadd packer.nvim]]
end

vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost packer-init.lua source <afile> | PackerSync
    augroup end
]]

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

packer.reset()

packer.init {
    display = {
        open_fn = function()
            return require('packer.util').float { border = "rounded" }
        end,
    },
    auto_clean = true,
    compile_on_sync = true,
}

packer.set_handler('config', function(_, plugin, value)
    if type(value) == 'string' and vim.fn.filereadable(vim.fn.expand(value)) == 1 then
        plugin.config = "vim.cmd('source" .. value .. "')"
    end
end)

return packer
