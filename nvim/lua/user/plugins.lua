-- Plugins
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local install_plugins = false

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	print("Installing packer...")
	local packer_url = "https://github.com/wbthomason/packer.nvim"
	vim.fn.system({ "git", "clone", "--depth", "1", packer_url, install_path })
	print("Done.")
	vim.cmd("packadd packer.nvim")
	install_plugins = true
end

require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use("EdenEast/nightfox.nvim")
	use("nmac427/guess-indent.nvim")
	use("numToStr/Comment.nvim")
	use("akinsho/toggleterm.nvim")
	use("lewis6991/gitsigns.nvim")
	use("windwp/nvim-autopairs")
	use("nvim-treesitter/nvim-treesitter")
	use("mhartington/formatter.nvim")

	use({
		"kylechui/nvim-surround",
		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
	})
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons",
		},
	})
	use({
		"nvim-lualine/lualine.nvim",
		requires = {
			"nvim-tree/nvim-web-devicons",
		},
	})
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})
	use({
		"alvarosevilla95/luatab.nvim",
		requires = {
			"kyazdani42/nvim-web-devicons",
		},
	})
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	})

	use("L3MON4D3/LuaSnip")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-nvim-lsp")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")

	use({
		"utilyre/barbecue.nvim",
		tag = "*",
		requires = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
		after = "nvim-web-devicons", -- keep this if you're using NvChad
		config = function()
			require("barbecue").setup()
		end,
	})

	use({
		"goolord/alpha-nvim",
		requires = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("alpha").setup(require("alpha.themes.startify").config)
		end,
	})

	use("mfussenegger/nvim-jdtls")
	if install_plugins then
		require("packer").sync()
	end
end)

require("nvim-tree").setup({
	sync_root_with_cwd = true,
})
require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true,
	},
	ensure_installed = {
		"javascript",
		"typescript",
		"tsx",
		"css",
		"json",
		"lua",
		"rust",
		"cpp",
		"c",
		"scala",
		"vim",
	},
})
require("guess-indent").setup()
require("Comment").setup()
require("telescope").setup()
require("toggleterm").setup({
	open_mapping = "<C-g>",
	direction = "horizontal",
	shade_terminals = true,
})
require("gitsigns").setup({
	signs = {
		add = { text = "▎" },
		change = { text = "▎" },
		delete = { text = "➤" },
		topdelete = { text = "➤" },
		changedelete = { text = "▎" },
	},
})
require("nvim-autopairs").setup()
require("mason").setup()
require("mason-lspconfig").setup()
require("luatab").setup()
require("nvim-surround").setup()
