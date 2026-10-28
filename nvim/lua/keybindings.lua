local map = vim.api.nvim_set_keymap

map('n', '<BS>', '<C-^>', {})
map('n', 'Q', '<Nop>', {})
map('n', '<leader>f', ':Telescope find_files<CR>', {})
map('n', ';', ':Telescope buffers<CR>', {})
map('n', '<leader>w', ":bdel<CR>", {})

