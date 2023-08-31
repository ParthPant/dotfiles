-- Utilities for creating configurations
local util = require("formatter.util")

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup({
	logging = true,
	log_level = vim.log.levels.WARN,
	filetype = {
		cs = {
			-- require("formatter.filetypes.cs").dotnetformat(),
			function()
				return {
					exe = "dotnet",
					args = {
						"format",
						"whitespace",
						"--include",
						vim.fn.expand("%:."),
					},
					stdin = false,
				}
			end,
		},
		go = {
			require("formatter.filetypes.go").goimports,
		},
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
		rust = {
			require("formatter.filetypes.rust").rustfmt,
		},
		python = {
			require("formatter.filetypes.python").yapf,
		},
		yaml = {
			require("formatter.filetypes.yaml").yamlfmt,
		},
		java = {
			require("formatter.filetypes.java").clangformat,
		},
		js = {
			require("formatter.filetypes.javascript").prettier,
		},
		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})
