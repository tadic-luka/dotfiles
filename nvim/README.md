# Neovim config

This only works for neovim versions 0.6.0+

## setup
[packer](https://github.com/wbthomason/packer.nvim) is used to install plugins.
Packer installation on UNIX, needs to be done before starting neovim for the fist time:
```
$ git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

All used plugins can be seen in [plugins.lua](lua/plugins.lua) file.
### LSP config
Neovim versions 0.5.0+ have built in lsp client. For common configurations and starting of LSP servers
[lspconfig](https://github.com/neovim/nvim-lspconfig) is used.

For python both [pylsp](https://github.com/python-lsp/python-lsp-server) and
[pyright](https://github.com/microsoft/pyright) are used.

For cpp [clangd](https://clangd.llvm.org/) is used.

For rust [rust-analyzer](https://github.com/rust-analyzer/rust-analyzer) is used.
Setup for rust is enhanced using [rust-tools](https://github.com/simrat39/rust-tools.nvim). 

For LaTeX [texlab](https://github.com/latex-lsp/texlab) is used.


