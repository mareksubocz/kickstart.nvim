-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
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
  {
    'github/copilot.vim',
    config = function()
      vim.keymap.set('i', '<Tab>', 'copilot#Accept("\\<CR>")', {
        expr = true,
        replace_keycodes = false,
      })
    end,
  },
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
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local harpoon = require 'harpoon'

      harpoon.setup {}
      vim.keymap.set('n', '<leader>a', function()
        harpoon:list():append()
      end)
      vim.keymap.set('n', '<leader><leader>a', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end)

      vim.keymap.set('n', '<leader>1', function()
        harpoon:list():select(1)
      end)
      vim.keymap.set('n', '<leader>2', function()
        harpoon:list():select(2)
      end)
      vim.keymap.set('n', '<leader>3', function()
        harpoon:list():select(3)
      end)
      vim.keymap.set('n', '<leader>4', function()
        harpoon:list():select(4)
      end)
    end,
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
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    build = function()
      vim.fn['mkdp#util#install']()
    end,
  },
  {
    'windwp/nvim-autopairs',
    -- Optional dependency
    dependencies = { 'hrsh7th/nvim-cmp' },
    config = function()
      require('nvim-autopairs').setup {}
      -- If you want to automatically add `(` after selecting a function or method
      local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
      local cmp = require 'cmp'
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end,
  },
  -- {
  --   "HiPhish/rainbow-delimiters.nvim",
  --   config = function()
  --     local rainbow_delimiters = require'rainbow-delimiters'
  --     vim.g.rainbow_delimiters = {
  --       strategy = {
  --         [''] = rainbow_delimiters.strategy['global'],
  --         vim = rainbow_delimiters.strategy['local'],
  --       },
  --       query = {
  --         [''] = 'rainbow-delimiters',
  --         lua = 'rainbow-blocks',
  --       },
  --       priority = {
  --         [''] = 110,
  --         lua = 210,
  --       },
  --       highlight = {
  --         'RainbowDelimiterViolet',
  --         'RainbowDelimiterBlue',
  --         'RainbowDelimiterCyan',
  --         'RainbowDelimiterGreen',
  --         'RainbowDelimiterYellow',
  --         'RainbowDelimiterRed',
  --         'RainbowDelimiterOrange',
  --       },
  --     }
  --   end
  -- }
  {
    'kdheepak/lazygit.nvim',
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    -- optional for floating window border decoration
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { '<leader>lg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
    },
  },
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
}
