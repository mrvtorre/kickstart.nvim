return {
  'lervag/vimtex',
  lazy = false, -- we don't want to lazy load VimTeX
  init = function()
    -- VimTeX configuration goes here, e.g.
    vim.g.vimtex_view_general_viewer = 'okular'
    vim.g.vimtex_view_general_options = '-reuse-instance @pdf'
  end,
}
