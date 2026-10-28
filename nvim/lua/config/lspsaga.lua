local saga = require 'lspsaga'
--local map = vim.api.nvim_set_keymap
--
saga.setup({
  border_style = "single",
  code_action_lightbulb = {
    enable = true,
  }
})

local keymap = vim.api.nvim_set_keymap

keymap('n', 'gd', '<cmd>Lspsaga peek_definition<CR>',{})
keymap('n', 'K', '<cmd>Lspsaga hover_doc<CR>',{})
keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>',{})
keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>',{})
keymap('n', '<leader>D', '<cmd>Lspsaga goto_definition<CR>',{})
keymap('n', '<leader>rn', '<cmd>Lspsaga rename<CR>',{})
keymap('n', '<leader>ca', '<cmd>Lspsaga code_action<CR>',{})
keymap('n', '<leader>dl', ':Telescope lsp_document_symbols<CR>',{})
keymap('n', 'gr', '<cmd>Lspsaga lsp_finder<CR>',{})
keymap('n', '<leader>e', '<cmd>Lspsaga show_buf_diagnostics<CR>',{})
keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", {})
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", {})
keymap('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>',{})
keymap('n', '<leader>l', '<cmd>lua vim.lsp.buf.format { async = true }<CR>',{})
