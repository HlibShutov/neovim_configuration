--vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
  -- use 'mfussenegger/nvim-dap'
  -- use "rust-lang/rust.vim"
  -- use "mrcjkb/rustaceanvim"

  --fronted
  use "pangloss/vim-javascript"
  use "othree/html5.vim"
  use "mattn/emmet-vim"

  use {
      'nvim-telescope/telescope.nvim', tag = '0.1.8',
-- or                            , branch = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'm4xshen/autoclose.nvim'
  -- use 'cohama/lexima.vim'
  use 'mfussenegger/nvim-jdtls'
  use 'simrat39/rust-tools.nvim'
  use 'williamboman/mason.nvim'    
  use 'williamboman/mason-lspconfig.nvim'
  -- use "~/Desktop/Uwuifier"
  use {
  "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    requires = { 
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    }
  }
  use "marko-cerovac/material.nvim"
  use "folke/tokyonight.nvim"
  use "ap/vim-css-color"
  use "NvChad/nvim-colorizer.lua"
  use 'mg979/vim-visual-multi'
  use 'nvim-treesitter/nvim-treesitter'
  use 'tpope/vim-fugitive'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', }
  }
  use "andweeb/presence.nvim"
  --{
  --"olrtg/nvim-emmet",
  --config = function()
  --  vim.keymap.set({ "n", "v" }, '<leader>xe', require('nvim-emmet').wrap_with_abbreviation)
  --end,
  --},
  --"olrtg/emmet-language-server",
  use {
  'neovim/nvim-lspconfig',
  requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip',
    }
  }

  use "hrsh7th/nvim-cmp"

  use {
      'tzachar/local-highlight.nvim',
      config = function()
        require('local-highlight').setup()
      end
  }
  use "tpope/vim-commentary"
end)
