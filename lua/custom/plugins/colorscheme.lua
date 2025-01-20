function InitColorscheme(color)
  color = color or 'gruvbox'
  vim.cmd.colorscheme(color)
end

return {
  {
    'ellisonleao/gruvbox.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.api.nvim_create_autocmd('ColorScheme', {
        pattern = 'gruvbox',
        callback = function()
          vim.cmd [[
            hi StatusLine guibg=#282828 guifg=#ebdbb2 gui=NONE cterm=NONE
            hi StatusLineNC guibg=#282828 guifg=#a89984 gui=NONE cterm=NONE
          ]]
        end,
      })

      require('gruvbox').setup {
        overrides = {
          SignColumn = { bg = 'none' },
          -- Comment = { bg = 'none' },
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
    init = function()
      InitColorscheme()
    end,
    priority = 1000,
  },
}
