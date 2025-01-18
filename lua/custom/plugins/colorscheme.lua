function InitColorscheme()
  vim.cmd.colorscheme 'gruvbox'
end

return {
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
      InitColorscheme()
    end,
  },
  {
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      -- You can configure highlights by doing something like:
      vim.cmd.hi 'Comment gui=none'
      InitColorscheme()
    end,
  },
}
