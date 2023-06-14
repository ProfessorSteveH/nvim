-- auto install packer if not installed
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
	return
end

-- and now the good stuff
return packer.startup(function(use)
	use("wbthomason/packer.nvim")

	use("nvim-lua/plenary.nvim") --functions for others

	--use("bluz71/vim-nightfly-guicolors") --a nice dark colorscheme (also enable in colorscheme)

	use("christoomey/vim-tmux-navigator") --for vi/tmux integration ctrl hjkl to move between splits
	use("szw/vim-maximizer") --assist above

	use("tpope/vim-surround") -- y s <w $ or whatever> <the char to surround selection with>
	use("vim-scripts/ReplaceWithRegister") -- y w <move to next> g r w   to replace

	use("numToStr/Comment.nvim") -- g c <motion> 9j

	use("nvim-tree/nvim-tree.lua") --file tree viewer

	use("kyazdani42/nvim-web-devicons") --icons

	use("nvim-lualine/lualine.nvim") --status line (bottom)

	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) --1of2
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) --file finder

	use("hrsh7th/nvim-cmp") --completion plugin
	use("hrsh7th/cmp-buffer") --source for text in buffer
	use("hrsh7th/cmp-path") --source for file system paths
	use("L3MON4D3/LuaSnip") --snippet engine
	use("saadparwaiz1/cmp_luasnip") --for autocompletion
	use("rafamadriz/friendly-snippets") --useful snippets

	use("williamboman/mason.nvim") --in charge of managing lsp servers, linters & formatters
	use("williamboman/mason-lspconfig.nvim") --bridges gap b/w mason & lspconfig
	use("neovim/nvim-lspconfig") --easily configure language servers
	use("hrsh7th/cmp-nvim-lsp") --for autocompletion
	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
		requires = {
			{ "nvim-tree/nvim-web-devicons" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	}) --enhanced lsp uis
	use("onsails/lspkind.nvim") --vs-code like icons for autocompletion

	use("jose-elias-alvarez/null-ls.nvim") --configure formatters & linters
	use("jayp0521/mason-null-ls.nvim") --bridges gap b/w mason & null-ls

	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	use("windwp/nvim-autopairs") --autoclose parens, brackets, quotes, etc...
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) --autoclose tags

	use("lewis6991/gitsigns.nvim") --for git

	if packer_bootstrap then
		require("packer").sync()
	end
end)
