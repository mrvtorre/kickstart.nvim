return {
    'Civitasv/cmake-tools.nvim',
    config = function()
        require('cmake-tools').setup {
            cmake_build_directory = require('televic').plixus_apps_build_dir,
            cmake_kits_path = vim.fn.expand '$HOME/.local/share/CMakeTools/cmake-tools-kits.json',
        }
    end,
}
