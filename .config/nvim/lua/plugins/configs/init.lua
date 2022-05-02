--[[
This init file loads all of the plugin configuration files
--]]

return {
	require('plugins.configs.cmp'),
	require('plugins.configs.lualine'),
	require('plugins.configs.tabline'),
	require('plugins.configs.nvimtree'),
	require('plugins.configs.gitsigns'),
	require('plugins.configs.dashboard'),
	require('plugins.configs.autopairs'),
	require('plugins.configs.telescope'),
	require('plugins.configs.nvimcomment'),
	require('plugins.configs.nvimcolorizer'),
	require('plugins.configs.treesitter'),
}

-- # vim foldmethod=marker
