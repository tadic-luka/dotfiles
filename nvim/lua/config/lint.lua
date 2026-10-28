local lint = require('lint')

local ruff = lint.linters.ruff
ruff.cmd = vim.fn.expand('$HOME/.local/bin/ruff')

lint.linters_by_ft = {
  python = {'ruff',}
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    lint.try_lint()
  end,
})

vim.api.nvim_create_autocmd({ "InsertLeave" }, {
  callback = function()
    lint.try_lint('ruff')
  end,
})
