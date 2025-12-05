local highlight = {
    "RainbowRed",
    "RainbowYellow",
    "RainbowBlue",
    "RainbowOrange",
    "RainbowGreen",
    "RainbowViolet",
    "RainbowCyan",
}

local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
    vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
    vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
    vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
    vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
    vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
    vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
end)

require("ibl").setup { indent = { highlight = highlight } }

require('telescope').setup{
  defaults = {
    layout_strategy = 'vertical',
    layout_config = { width = 0.5 }, -- other layout configuration here ,
    file_ignore_patterns = {
      -- Add your directory names here to ignore them when searching
      ".git",
      ".gitignore",
      "%.log",
      "ccc/",
      "logs/",
      "cscope*",
      "compile_commands.json",
      ".tgz",
      "build%-metrics",
      "obj%-common",
      "%.diff",
      "%.mk",
      "%.o",
      "%.d",
      "%.ii",
      -- "unit%-test",
      -- "logs",
      -- "developer%-tests",
      -- "gerrit%-tools",
      -- "log",
      -- "gen%-exports",
      -- ".sys",
      -- "build_metric",
      -- "smoketest%-suites",
      -- "objmon",
      -- "__gen",
    },
    scroll_strategy = 'limit',
    vimgrep_arguments = {
          'rg',
    --      '--color=never',
    --      '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
          '--case-sensitive',
    --      '--smart-case',
          '--no-ignore', -- This flag disables respecting .gitignore and .ignore files
    --      '--hidden',    -- This flag includes hidden files (dotfiles)
    },
  },
}
return {
  {
    "lukoshkin/highlight-whitespace",
    lazy = false;
    opts = {
      tws = "\\s\\+$",
      clear_on_bufleave = false,
      palette = {
        markdown = {
          tws = 'RosyBrown',
          ['\\S\\@<=\\s\\(\\.\\|,\\)\\@='] = 'CadetBlue3',
          ['\\S\\@<= \\{2,\\}\\S\\@='] = 'SkyBlue1',
          ['\\t\\+'] = 'plum4',
        },
        other = {
          tws = 'PaleVioletRed',
          -- ['\\S\\@<=\\s,\\@='] = 'coral1',
          -- ['\\S\\@<=\\(#\\|--\\)\\@<! \\{2,3\\}\\S\\@=\\(#\\|--\\)\\@!'] = 'LightGoldenrod3',
          -- ['\\(#\\|--\\)\\@<= \\{2,\\}\\S\\@='] = '#3B3B3B',
          -- ['\\S\\@<= \\{3,\\}\\(#\\|--\\)\\@='] = '#3B3B3B',
          -- ['\\t\\+'] = 'plum4',
        }
      }
    }
  },
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
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      -- Other options for indent-blankline
      indent = {
        char = "│", -- Or any other character you prefer
        highlight = {
          "RainbowRed",
          "RainbowYellow",
          "RainbowBlue",
          "RainbowOrange",
          "RainbowGreen",
          "RainbowViolet",
          "RainbowCyan",
        },
      },
      -- You might also want to adjust context_highlight_blankline or other options
      -- to suit your preferences.
    },
  },
  {
    "dhananjaylatkar/cscope_maps.nvim",
    config = function()
      require('cscope_maps').setup()
    end,
    dependencies = {
      "nvim-telescope/telescope.nvim", -- optional [for picker="telescope"]
      "ibhagwan/fzf-lua", -- optional [for picker="fzf-lua"]
      "echasnovski/mini.pick", -- optional [for picker="mini-pick"]
      "folke/snacks.nvim", -- optional [for picker="snacks"]
    },
    opts = {
      -- USE EMPTY FOR DEFAULT OPTIONS
      -- DEFAULTS ARE LISTED BELOW
      disable_maps = false,
    },
    lazy = false,
  },
  {
    'p00f/clangd_extensions.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim', -- Required dependency
    },
    config = function()
      require('clangd_extensions').setup {
        -- Optional configuration
      }
    end,
  },
  {
    "github/copilot.vim",
    lazy = false,
    config = function()  -- Mapping tab is already used by NvChad
      vim.g.copilot_no_tab_map = true;
      vim.g.copilot_assume_mapped = true;
      vim.g.copilot_tab_fallback = "";
      -- The mapping is set to other key, see custom/lua/mappings
      -- or run <leader>ch to see copilot mapping section
    end
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      view = {
        width = { min = 30, max = -1 },
      },
      sort = {
        sorter = "case_sensitive",
      },
    },
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    lazy = false,
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {
      -- See Configuration section for options
    },
  },
  {
    "ravitemer/mcphub.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    build = "npm install -g mcp-hub@latest",  -- Installs `mcp-hub` node binary globally
    config = function()
      require("mcphub").setup({
        extensions = {
        copilotchat = {
            enabled = true,
            convert_tools_to_functions = true,     -- Convert MCP tools to CopilotChat functions
            convert_resources_to_functions = true, -- Convert MCP resources to CopilotChat functions
            add_mcp_prefix = false,                -- Add "mcp_" prefix to function names
        }
    }
      })
    end
  },
}
