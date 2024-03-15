-- Plugin definition and loading
-- local execute = vim.api.nvim_command
local fn = vim.fn
local cmd = vim.cmd

-- Boostrap Packer
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
local packer_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone','https://github.com/wbthomason/packer.nvim', install_path})
end

-- Load Packer
cmd([[packadd packer.nvim]])

-- Rerun PackerCompile everytime plugins.lua is updated
cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- Initialize pluggins
return require('packer').startup(function(use)

  -- Let Packer manage itself
  use({'wbthomason/packer.nvim', opt = true})

  -- LSP and completion
  use ({
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    "ray-x/lsp_signature.nvim",
    run = ":MasonUpdate",
  })

  require("plugins.lspconfig")

  -- neodev for neovim development
  use 'folke/neodev.nvim'

  -- Autocomplete
  use({
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
    },
    config = function() require('plugins.cmp') end,
  })

  -- Colorschemes
  use ({ 'projekt0n/github-nvim-theme' })
  use ({ 'folke/tokyonight.nvim' })

  -- Lualine status bar
  use ({
    'nvim-lualine/lualine.nvim',
    requires = {{ 'nvim-tree/nvim-web-devicons', opt = true }},
    config = function() require('plugins.lualine') end,
  })

  -- Treesitter syntax hightlighting
  use({
    'nvim-treesitter/nvim-treesitter',
    'windwp/nvim-ts-autotag',
    config = function() require('plugins.treesitter') end,
    run = ':TSUpdate'
  })

  -- GIT commands
  use 'tpope/vim-fugitive'
  --
  -- GIT signs
  use ({
    'lewis6991/gitsigns.nvim',
    requires = {'nvim-lua/plenary.nvim'},
    config = function() require('plugins.gitsigns') end
  })

  -- Telescope fuzzy search
  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.6',
  requires = { {'nvim-lua/plenary.nvim'} }
  }


  -- Autopair
  use {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
        require("nvim-autopairs").setup {}
    end
  }

  -- Better comments
  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  }

  -- Nvim tree (filebrowser)
  use ({
    'nvim-tree/nvim-tree.lua',
    requires = 'nvim-tree/nvim-web-devicons',
    config = function() require('plugins.nvimtree') end,
  })

  -- Which key (shows keybinds)
  use {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup {
      }
    end
  }

  -- Startup screen
  use {
    'goolord/alpha-nvim',
    config = function ()
        require'alpha'.setup(require'alpha.themes.dashboard'.config)
    end
  }

  -- Markdown
  use 'godlygeek/tabular'
  use 'ellisonleao/glow.nvim'

  -- Formatting
  use 'tpope/vim-commentary'
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'junegunn/vim-easy-align'

  -- Github copilot
  use "github/copilot.vim"

  -- Trouble (show diagnostics)
  use 'folke/trouble.nvim'

  -- Python formatting
  use "EgZvor/vim-black"
  use 'jeetsukumaran/vim-python-indent-black'

  -- Python types
  use "microsoft/python-type-stubs"

  if packer_bootstrap then
    require('packer').sync()
  end
end)
