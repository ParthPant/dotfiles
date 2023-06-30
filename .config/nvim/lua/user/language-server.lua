local lspconfig = require("lspconfig")
local mason_config = require("mason-lspconfig")
local lsp_defaults = lspconfig.util.default_config

require("cmp").setup({
	sources = {
		{ name = "nvim_lsp" },
	},
})

lsp_defaults.capabilities =
	vim.tbl_deep_extend("force", lsp_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())

-- logging
vim.lsp.set_log_level("debug")

-- Borders
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

-- Servers
-- do I need to put the binaries in the PATH
mason_config.setup({
	ensure_installed = { "lua_ls", "rust_analyzer", "clangd", "dockerls", "eslint", "gopls" },
})

lspconfig["metals"].setup({})
lspconfig["gopls"].setup({})
lspconfig["clangd"].setup({})
lspconfig["hls"].setup({})
lspconfig["eslint"].setup({})
lspconfig["lua_ls"].setup({
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
})
lspconfig["rust_analyzer"].setup({
	settings = {
		["rust-analyzer"] = {
			cargo = {
				allFeatures = true,
			},
		},
	},
})
