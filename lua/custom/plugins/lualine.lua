return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup {
      options = {
        icons_enabled = vim.g.have_nerd_font,
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right =  '' },
        globalstatus = true,
      },
      sections = {
        lualine_c = {
          {
            'filename',
            path = 1
          }
        },
        lualine_x = {
          {
            'windows',
            cond = function()
              return vim.fn.winnr('$') > 1
            end,
          },
          'encoding',
          'filetype'
        }
      }
    }
  end,
}
