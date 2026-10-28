local nvim_lsp = require('lspconfig')
local configs = require 'lspconfig/configs'
local util = require 'lspconfig/util'
local Path = require 'plenary.path'
local Job = require 'plenary.job'
local Filetype = require 'plenary.filetype'
local lsp = require 'config.lsp'



nvim_lsp.pylsp.setup {
  cmd = {'pyls'},
  capabilities = lsp.capabilities,
  on_attach = lsp.on_attach,
}
nvim_lsp.pyright.setup {
  cmd = {'pyright'},
  capabilities = lsp.capabilities,
  on_attach = lsp.on_attach,
}

require'lspconfig'.texlab.setup{}

require("clangd_extensions").setup {
	server = {
		  capabilities = lsp.capabilities,
		  on_attach = lsp.on_attach,
		  single_file_support = true,
		  on_init = function()
		    vim.notify("Started Clangd", vim.log.levels.INFO)
		  end,
		  init_options = {
		    compilationDatabasePath = "build",
		  },
		  autostart = false,
		  root_dir = util.root_pattern("CMakeLists.txt"),
	},
}

nvim_lsp.gopls.setup {
  cmd = {'/home/luka/go/bin/gopls'},
  capabilities = lsp.capabilities,
}


extension = Filetype.detect(vim.api.nvim_buf_get_name(0), {})

if extension == "cpp" or extension == "c" then
  local root = Path:new(vim.api.nvim_buf_get_name(0)):parent()
  local build_dir = root .. "/build"
  local cmake_job = Job:new({
    command = "cmake",
    args = {"-DCMAKE_EXPORT_COMPILE_COMMANDS=1", "../"},
    cwd = build_dir,
    on_start = function()
      vim.notify("Starting cmake compile_commands", vim.log.levels.INFO)
    end,
    on_exit = vim.schedule_wrap(function(j, return_code)
      if return_code ~= 0 then
        vim.notify("Unable to run cmake", vim.log.levels.ERROR)
        return
      end
      vim.cmd [[ :LspStart ]]
    end)
  })
  local cmake_lists_exists = Path:new(root .. "/CMakeLists.txt"):exists()
  if not cmake_lists_exists then
    vim.notify("CMakeLists.txt not found, not starting clangd", vim.log.levels.WARN)
  elseif Path:new(build_dir):mkdir({ exists_ok = true, parents=true }) == true then
    cmake_job:start()
  else
    vim.g.custom_status = "Unable to create build dir"
  end

end
