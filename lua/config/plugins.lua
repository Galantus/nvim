local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
-- Packer
	use({ "wbthomason/packer.nvim"})

    use({ "moll/vim-bbye"})

-- alpha (dashboard)
	use({ "goolord/alpha-nvim",
        config = [[require('config/plugins/alpha')]]})

-- autopairs
	use({ "windwp/nvim-autopairs",
        config = [[require('config/plugins/autopairs')]]})

-- bufferline
	use({ "akinsho/bufferline.nvim",
        config = [[require('config/plugins/bufferline')]] })

--comments
	use({ "numToStr/Comment.nvim",
        config = [[require('config/plugins/comment')]] })

-- Colorizer
    use({'norcalli/nvim-colorizer.lua',
        config = [[require('config/plugins/colorizer')]]})

-- Which-key
	use({"folke/which-key.nvim",
        config = [[require('config/plugins/whichkey')]] })

-- Window manager
    use ({ "beauwilliams/focus.nvim",
        config = [[require('config/plugins/windows')]]})

-- toggleterm
	use({ "akinsho/toggleterm.nvim",
        tag = 'v2.*',
        config = [[require('config/plugins/toggleterm')]] })

-- Filemanager
    use({'kyazdani42/nvim-tree.lua',
        requires = { 'kyazdani42/nvim-web-devicons'},   -- optional, for file icons 
        config =  [[require('config/plugins/nvim-tree') ]] })

-- Colorschemes
    use({"Th3Whit3Wolf/space-nvim"})
    use({"ray-x/aurora"})
    use({"shaeinst/roshnivim-cs"})
    use({"marko-cerovac/material.nvim"})
    use({"christianchiarulli/nvcode-color-schemes.vim"})
    use({"folke/tokyonight.nvim"})
    use({"navarasu/onedark.nvim"})
    use({"nxvu699134/vn-night.nvim"})
    use({"EdenEast/nightfox.nvim"})

-- cmp plugins
	use({ "hrsh7th/nvim-cmp",
        config = [[require('config/plugins/cmp')]]})
	use({ "hrsh7th/cmp-buffer"})
	use({ "hrsh7th/cmp-path"})
	use({ "saadparwaiz1/cmp_luasnip"})
	use({ "hrsh7th/cmp-nvim-lsp"})
	use({ "hrsh7th/cmp-nvim-lua"})
    use {'tzachar/cmp-tabnine',
        run='./install.sh',
        requires = 'hrsh7th/nvim-cmp',
        config = [[require('config/plugins/cmp_tN')]] }

-- Notify
    use({"rcarriga/nvim-notify"})

-- snippets
	use({ "L3MON4D3/LuaSnip"})
	use({ "rafamadriz/friendly-snippets"})

--Lualine
	use({ "nvim-lualine/lualine.nvim",
        config = [[require('config/plugins/lualine')]] })

-- LSP
	use({ "neovim/nvim-lspconfig",
        config = [[require('config/lsp')]]})
	use({ "williamboman/nvim-lsp-installer"})
	use({ "jose-elias-alvarez/null-ls.nvim"})
    use({"lukas-reineke/lsp-format.nvim"})
    use({'simrat39/symbols-outline.nvim',
        config =[[require('config/plugins/outline')]]})
    use { "folke/trouble.nvim",
              config = [[require('config/plugins/trouble')]]}

-- Telescope
	use({ "nvim-telescope/telescope.nvim",
        config = [[require('config/plugins/telescope')]] })

-- Treesitter
	use({"nvim-treesitter/nvim-treesitter",
        config = [[require('config/plugins/treesitter')]] })
    use({"p00f/nvim-ts-rainbow"})
    use({'JoosepAlviste/nvim-ts-context-commentstring'})
    use({'RRethy/nvim-treesitter-textsubjects'})
    use({'m-demare/hlargs.nvim',
        config = [[require('config/plugins/hlargs')]]})
    use({"folke/twilight.nvim",
        config = [[require('config/plugins/twilight')]]})
    -- Scope in func
    use({"SmiteshP/nvim-gps",
        config = [[require('config/plugins/gps')]]})

-- Git
	use({ "lewis6991/gitsigns.nvim",
        config = [[require('config/plugins/gitsigns')]] })

-- Spellcheker
    use ({"lewis6991/spellsitter.nvim",
        config = [[require('config/plugins/spellchecker')]] })

-- Debug
    use {"mfussenegger/nvim-dap"}
    use { "rcarriga/nvim-dap-ui",
            config = [[require('config/plugins/debug')]]}
    use {'mfussenegger/nvim-dap-python',
        run = "lua require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')"}

-- neoclip
    use { "AckslD/nvim-neoclip.lua",
        requires = {'kkharji/sqlite.lua',
            module = 'sqlite'},
        config = [[require('config/plugins/neoclip')]]}

-- Runner
    use {'michaelb/sniprun',
        run = 'bash install.sh',
        config = [[require('config/plugins/sniprun')]] }
    use { 'CRAG666/code_runner.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = [[require('config/plugins/code_runner')]]}

-- project
	use({ "ahmedkhalf/project.nvim",
        config = [[require('config/plugins/project')]] })

-- indentline
	use({ "lukas-reineke/indent-blankline.nvim",
        config = [[require('config/plugins/indentline')]] })

-- impatent
	use({ "lewis6991/impatient.nvim" })

-- Diagnostics
    use({ "andrewferrier/textobj-diagnostic.nvim",
        config = [[require('config/plugins/diagnostic')]] })




-- Automatically set up your configuration after cloning packer.nvim
-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
