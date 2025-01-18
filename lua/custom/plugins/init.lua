-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  -- {
  --   'ellisonleao/gruvbox.nvim',
  --   priority = 1000,
  --   init = function()
  --     require('gruvbox').setup {
  --       overrides = {
  --         SignColumn = { bg = 'none' },
  --         Comment = { bg = 'none' },
  --         -- ['@punctuation.bracket'] = { fg = '#fe8019' },
  --         -- ['@punctuation.delimiter'] = { fg = '#fe8019' },
  --         -- ['@punctuation.special'] = { fg = '#fe8019' },
  --       },
  --       transparent_mode = false,
  --     }
  --     -- vim.o.background="dark" -- system default
  --     -- vim.cmd 'colorscheme gruvbox'
  --   end,
  -- },
  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    config = true,
    opts = ...,
    init = function()
      require('gruvbox').setup {
        overrides = {
          SignColumn = { bg = 'none' },
          Comment = { bg = 'none' },
          -- ['@punctuation.bracket'] = { fg = '#fe8019' },
          -- ['@punctuation.delimiter'] = { fg = '#fe8019' },
          -- ['@punctuation.special'] = { fg = '#fe8019' },
        },
        transparent_mode = false,
      }
      -- vim.o.background="dark" -- system default
      vim.cmd 'colorscheme gruvbox'
    end,
  },
  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is.
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      -- vim.cmd.colorscheme 'tokyonight-night'

      -- You can configure highlights by doing something like:
      vim.cmd.hi 'Comment gui=none'
      -- vim.cmd 'colorscheme tokyonight-night'
    end,
  },
  {
    'ggandor/leap.nvim',
    dependencies = {
      'tpope/vim-repeat', -- Required for repeating lightspeed motions
    },
    config = function()
      require('leap').create_default_mappings()
    end,
  },
  -- {
  --   'github/copilot.vim',
  --   config = function()
  --     vim.keymap.set('i', '<Tab>', 'copilot#Accept("\\<CR>")', {
  --       expr = true,
  --       replace_keycodes = false,
  --     })
  --   end,
  -- },
  {
    'gbprod/cutlass.nvim',
    opts = {
      cut_key = 'm',
      exclude = {
        'ns',
        'nS',
        'xs',
        'xS',
        'vs',
        'vS',
        'ss',
        'sS',
      },
    },
  },
  {
    'kylechui/nvim-surround',
    version = '*', -- Use for stability; omit to use `main` branch for the latest features
    event = 'VeryLazy',
    config = function()
      require('nvim-surround').setup {
        keymaps = {
          visual = 'as',
        },
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
  'wellle/targets.vim',
  -- {
  --   'windwp/nvim-autopairs',
  --   -- Optional dependency
  --   -- dependencies = { 'hrsh7th/nvim-cmp' },
  --   config = function()
  --     require('nvim-autopairs').setup {}
  --     -- If you want to automatically add `(` after selecting a function or method
  --     local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
  --     local cmp = require 'cmp'
  --     cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
  --   end,
  -- },
  {
    'RRethy/vim-illuminate',
    config = function()
      require('illuminate').configure {
        filetypes_denylist = {
          'TelescopePrompt',
        },
        modes_allowlist = { 'n', 'i' },
      }
      -- vim.cmd [[highlight IlluminatedWordText Search]]
      -- vim.cmd [[highlight IlluminatedWordRead Search]]
      -- vim.cmd [[highlight IlluminatedWordWrite Search]]
      vim.cmd [[highlight IlluminatedWordText guibg=#504945]]
      vim.cmd [[highlight IlluminatedWordRead guibg=#504945]]
      vim.cmd [[highlight IlluminatedWordWrite guibg=#504945]]
    end,
  },
  {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('oil').setup {
        columns = { 'icon' },
        keymaps = {
          ['g?'] = 'actions.show_help',
          ['<CR>'] = 'actions.select',
          ['<C-s>'] = 'actions.select_vsplit',
          ['<C-h>'] = 'actions.select_split',
          ['<C-t>'] = 'actions.select_tab',
          ['<S-CR>'] = 'actions.preview',
          ['<C-c>'] = 'actions.close',
          ['<C-l>'] = 'actions.refresh',
          ['-'] = 'actions.parent',
          ['_'] = 'actions.open_cwd',
          ['`'] = 'actions.cd',
          ['~'] = 'actions.tcd',
          ['gs'] = 'actions.change_sort',
          ['gx'] = 'actions.open_external',
          ['g.'] = 'actions.toggle_hidden',
          ['g\\'] = 'actions.toggle_trash',
        },
        use_default_keymaps = false,
        view_options = {
          show_hidden = true,
        },
      }

      vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'open parent directory' })
    end,
  },
  'm-demare/hlargs.nvim',
  {
    'leath-dub/snipe.nvim',
    keys = {
      {
        '<C-f>',
        function()
          require('snipe').open_buffer_menu()
        end,
        desc = 'Open Snipe buffer menu',
      },
    },
    opts = {},
  },
  -- {
  --   'yetone/avante.nvim',
  --   event = 'VeryLazy',
  --   lazy = false,
  --   version = false, -- set this if you want to always pull the latest change
  --   opts = {
  --     -- add any opts here
  --   },
  --   -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  --   build = 'make',
  --   -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  --   dependencies = {
  --     'nvim-treesitter/nvim-treesitter',
  --     'stevearc/dressing.nvim',
  --     'nvim-lua/plenary.nvim',
  --     'MunifTanjim/nui.nvim',
  --     --- The below dependencies are optional,
  --     'nvim-tree/nvim-web-devicons', -- or echasnovski/mini.icons
  --     'zbirenbaum/copilot.lua', -- for providers='copilot'
  --     {
  --       -- support for image pasting
  --       'HakonHarnes/img-clip.nvim',
  --       event = 'VeryLazy',
  --       opts = {
  --         -- recommended settings
  --         default = {
  --           embed_image_as_base64 = false,
  --           prompt_for_file_name = false,
  --           drag_and_drop = {
  --             insert_mode = true,
  --           },
  --           -- required for Windows users
  --           use_absolute_path = true,
  --         },
  --       },
  --     },
  --     {
  --       -- Make sure to set this up properly if you have lazy=true
  --       'MeanderingProgrammer/render-markdown.nvim',
  --       opts = {
  --         file_types = { 'markdown', 'Avante' },
  --       },
  --       ft = { 'markdown', 'Avante' },
  --     },
  --   },
  -- },
  {
    'supermaven-inc/supermaven-nvim',
    config = function()
      require('supermaven-nvim').setup {}
    end,
  },
  {
    'saghen/blink.cmp',
    dependencies = 'rafamadriz/friendly-snippets',

    version = '*',
    opts = {
      keymap = {
        preset = 'enter',
        cmdline = {
          preset = 'default',
        },
      },

      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono',
      },
      signature = { enabled = true },
    },
    opts_extend = { 'sources.default' },
  },
}
