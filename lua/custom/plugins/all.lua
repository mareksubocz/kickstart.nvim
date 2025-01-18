return {
  -- Here is a more advanced example where we pass configuration
  -- options to `gitsigns.nvim`. This is equivalent to the following Lua:
  --    require('gitsigns').setup({ ... })
  --

  -- See `:help gitsigns` to understand what the configuration keys do
  -- NOTE: Plugins can also be configured to run Lua code when they are loaded.
  --
  -- This is often very useful to both group configuration, as well as handle
  -- lazy loading plugins that don't need to be loaded immediately at startup.
  --
  -- For example, in the following configuration, we use:
  --  event = 'VimEnter'
  --
  -- which loads which-key before all the UI elements are loaded. Events can be
  -- normal autocommands events (`:help autocmd-events`).
  --
  -- Then, because we use the `config` key, the configuration only runs
  -- after the plugin has been loaded:
  --  config = function() ... end
  -- Use `opts = {}` to force a plugin to be loaded.
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  { 'numToStr/Comment.nvim', opts = {} },
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      -- empty lua function to disable status line updates
      status_formatter = function() end,
    },
  },

  require 'kickstart.plugins.debug',
  -- require 'kickstart.plugins.indent_line',
  require 'kickstart.plugins.lint',
  -- require 'kickstart.plugins.autopairs',
  -- require 'kickstart.plugins.neo-tree',
  -- require 'kickstart.plugins.gitsigns', -- adds gitsigns recommend keymaps

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
  --     -- If you want to automatically add `(` after selecting a function or methodplug
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
    enabled = false,
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
  {
    'toppair/peek.nvim',
    event = { 'VeryLazy' },
    build = 'deno task --quiet build:fast',
    config = function()
      require('peek').setup()
      vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
      vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})
    end,
  },
}
