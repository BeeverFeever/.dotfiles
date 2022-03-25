return {
	settings = {
		Lua = {
            telemetry = {
                enable = false
            },
			diagnostics = {
				globals = { "vim", "awesome" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
}
