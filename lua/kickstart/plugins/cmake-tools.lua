return {
  'Civitasv/cmake-tools.nvim',
  config = function()
    local cmake = require 'cmake-tools'
    cmake.setup {
      cmake_build_directory = require('televic').plixus_apps_build_dir,
      cmake_kits_path = vim.fn.expand '$HOME/.local/share/CMakeTools/cmake-tools-kits.json',
      cmake_regenerate_on_save = false,
    }

    -- Auto-select default kit on first FileType detection for CMake files
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'cmake',
      once = true,
      callback = function()
        local config = require 'cmake-tools.config'
        if not config.kit then
          -- Silently set the kit without showing the selection UI
          config.kit = 'Televic PC SDK'
        end
      end,
    })
  end,
}
