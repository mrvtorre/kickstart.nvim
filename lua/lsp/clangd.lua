local nvim_lsp = require 'lspconfig'
local televic_config = require 'televic'

return {
  root_dir = nvim_lsp.util.root_pattern 'CMakeLists.txt',
  single_file_support = true,
  capabilities = {
    textDocument = {
      completion = {
        editsNearCursor = true,
      },
    },
    offsetEncoding = { 'utf-16' },
  },
  on_new_config = function(new_config)
    local status, cmake = pcall(require, 'cmake-tools')
    if status then
      cmake.clangd_on_new_config(new_config)
    end
  end,
  cmd = {
    'clangd',
    '--clang-tidy',
    '--background-index',
    '--compile-commands-dir=' .. televic_config.plixus_apps_build_dir,
    '--query-driver=' .. televic_config.build_scripts_path .. '**/*g++',
  },
}
