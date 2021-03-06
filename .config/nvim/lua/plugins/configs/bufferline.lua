require('bufferline').setup({
	options = {
		indicator_icon = '▎',
		buffer_close_icon = '',
		modified_icon = '●',
		close_icon = '',
		left_trunc_marker = '',
		right_trunc_marker = '',
		numbers = 'none',
		-- mappings = true,
		right_mouse_command = function(bufnum)
            require('bufdelete').bufdelete(bufnum, true)
        end,
		left_mouse_command = 'buffer %d',
		middle_mouse_command = nil,
	    show_buffer_icons = true,
        show_buffer_close_icons = false,
        show_close_icon = false,
		diagnostics = 'nvim_lsp',
        offsets = {{filetype = "NvimTree", text = "Its a tree :)", padding = 1, highlight = "Directory"}},
        always_show_bufferline = true,
	},
})
