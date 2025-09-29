return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  			"vim", "lua", "vimdoc",
       "c", "cpp", "yang"
  		},
  	},
  },
  -- Override the default gitsigns settings
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
      -- You can add other configurations here as well
      -- For example, to adjust the virtual text position:
      -- current_line_blame_opts = {
      --   virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
      -- },
    },
  },
  {
    "folke/which-key.nvim",
    lazy = false,
  },
}
