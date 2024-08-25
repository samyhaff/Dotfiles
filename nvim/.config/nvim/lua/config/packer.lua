vim.cmd([[
  augroup packer_auto_sync
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]])

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'chentoast/marks.nvim'
  use 'github/copilot.vim'
  use 'ggandor/leap.nvim'
  use 'tpope/vim-sleuth'
  use 'goolord/alpha-nvim'
  use 'lewis6991/gitsigns.nvim'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'tpope/vim-fugitive'
  use 'nvim-tree/nvim-web-devicons'
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'tomasiser/vim-code-dark'
  use 'folke/tokyonight.nvim'
  use 'navarasu/onedark.nvim'
  use 'shaunsingh/nord.nvim'
  use ({ 'projekt0n/github-nvim-theme', tag = 'v0.0.7' })
  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  }
  use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use {'akinsho/bufferline.nvim', requires = 'nvim-tree/nvim-web-devicons'}
  use 'nvim-treesitter/nvim-treesitter-context'
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use 'adelarsq/neofsharp.vim'
  use 'kyazdani42/nvim-tree.lua'
  use "windwp/nvim-autopairs"
  use "saecki/crates.nvim"
  use "lervag/vimtex"
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {'williamboman/mason.nvim'},           -- Optional
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},         -- Required
      {'hrsh7th/cmp-nvim-lsp'},     -- Required
      {'hrsh7th/cmp-buffer'},       -- Optional
      {'hrsh7th/cmp-path'},         -- Optional
      {'saadparwaiz1/cmp_luasnip'}, -- Optional
      {'hrsh7th/cmp-nvim-lua'},     -- Optional

      -- Snippets
      {'L3MON4D3/LuaSnip'},             -- Required
      {'rafamadriz/friendly-snippets'}, -- Optional
    }
  }
end)
