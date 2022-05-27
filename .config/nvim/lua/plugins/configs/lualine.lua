require('lualine').setup({
	options = {
		section_separators = { left = '', right = ''},
		component_separators = { left = '', right = ''},
	    disabled_filetypes = {"NvimTree", "Outline", "dashboard"},	
        theme = 'auto',
	},
	sections = {
		lualine_a = { 'mode' },
		lualine_c = { 'filename' },
		lualine_b = { 'branch', 'diagnostics' },
		lualine_x = {},
		lualine_y = { 'filetype' },
		lualine_z = { 'location', 'progress' },
	},
    inactive_sections = {
		lualine_a = { 'filename' },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {}, 
		lualine_y = {},
		lualine_z = { 'location' },
    },
})
