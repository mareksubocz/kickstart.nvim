return {
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
      ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'vim', 'vimdoc' },
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = {
        enable = true,
        disable = function(lang, buf)
          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby', 'python' } },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['in'] = '@function.name',
            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner',
            ['al'] = '@loop.outer',
            ['il'] = '@loop.inner',
            ['ai'] = '@conditional.outer',
            ['ii'] = '@conditional.inner',
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ['<leader>>'] = '@parameter.inner',
          },
          swap_previous = {
            ['<leader><'] = '@parameter.inner',
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            [']f'] = { query = '@function.outer', desc = 'go to next function' },
            [']c'] = { query = '@class.outer', desc = 'go to next class' },
            [']l'] = { query = '@loop.outer', desc = 'go to next loop' },
            [']i'] = { query = '@conditional.outer', desc = 'go to next conditional' },
          },
          goto_next_end = {
            [']F'] = { query = '@function.outer', desc = 'go to next function end' },
            [']C'] = { query = '@class.outer', desc = 'go to next class end' },
            [']L'] = { query = '@loop.outer', desc = 'go to next loop end' },
            [']I'] = { query = '@conditional.outer', desc = 'go to next conditional end' },
          },
          goto_previous_start = {
            ['[f'] = { query = '@function.outer', desc = 'go to prev function' },
            ['[c'] = { query = '@class.outer', desc = 'go to prev class' },
            ['[l'] = { query = '@loop.outer', desc = 'go to prev loop' },
            ['[i'] = { query = '@conditional.outer', desc = 'go to prev conditional' },
          },
          goto_previous_end = {
            ['[F'] = { query = '@function.outer', desc = 'go to prev function end' },
            ['[C'] = { query = '@class.outer', desc = 'go to prev class end' },
            ['[L'] = { query = '@loop.outer', desc = 'go to prev loop end' },
            ['[I'] = { query = '@conditional.outer', desc = 'go to prev conditional end' },
          },
        },
      },
    },
    config = function(_, opts)
      -- [[ Configure Treesitter ]] See `:help nvim-treesitter`

      -- Prefer git instead of curl in order to improve connectivity in some environments
      require('nvim-treesitter.install').prefer_git = true
      ---@diagnostic disable-next-line: missing-fields
      require('nvim-treesitter.configs').setup(opts)

      -- There are additional nvim-treesitter modules that you can use to interact
      -- with nvim-treesitter. You should go explore a few and see what interests you:
      --
      --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
      --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
      --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    end,
  },
  'nvim-treesitter/nvim-treesitter-textobjects',
  {
    'nvim-treesitter/nvim-treesitter-context',
    config = function()
      require('treesitter-context').setup {
        multiline_threshold = 1, -- Maximum number of lines to show for a single context
        mode = 'topline',
      }
    end,
  },
}
