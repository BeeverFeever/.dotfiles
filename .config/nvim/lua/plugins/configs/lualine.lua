-- lualine setup config
require('lualine').setup({
	options = {
        
		-- section_separators = { left = scheme.lualine_style_left, right = scheme.lualine_style_right },
		-- component_separators = { left = scheme.lualine_seperator_left, right = scheme.lualine_seperator_right },
		theme = 'auto',
	},
	sections = {
		lualine_a = { 'mode' },
		lualine_b = { 'branch' },
		lualine_c = { 'filename' },
		lualine_x = { 'encoding', 'fileformat', 'filetype' },
		lualine_y = { 'progress' },
		lualine_z = { 'location' },
	},
})
