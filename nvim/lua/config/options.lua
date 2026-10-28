local o = vim.o
local wo = vim.wo
local bo = vim.bo
local set = vim.opt

vim.g.python3_host_prog = "/bin/python3"
vim.g.tex_flavor = "latex"

o.autoread = true
o.termguicolors = true
o.showmode = true
o.laststatus = 2
o.ruler = true
o.showmatch = true
o.splitright = true
o.scrolloff = 3
o.sidescrolloff = 15
o.hidden = true
o.enc = "utf-8"
o.encoding = "utf-8"
o.inccommand = "nosplit"
o.hlsearch = true
o.ignorecase = true
o.smartcase = true
o.updatetime = 258

wo.number = true
wo.relativenumber = true
wo.colorcolumn = "120"

bo.swapfile = false
bo.expandtab = true
bo.fenc = "utf-8"
bo.textwidth = 120
bo.smartindent = true

set.undofile = true
set.formatoptions:remove("o")

vim.opt.termguicolors = true
vim.g.do_filetype_lua = 1
vim.o.background = "dark"
vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
