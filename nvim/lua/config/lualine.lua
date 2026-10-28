local setup = {
  options = {
    icons_enabled = true,
    theme = 'gruvbox-material',
    component_separators = {left = '', right = ''},
    section_separators = {left = '', right = ''},
    disabled_filetypes = {},
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {'diagnostics', 'g:custom_status'},
    lualine_x = {'progress'},
    lualine_y = {'location'},
    lualine_z = {'filetype'},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {
  lualine_a = { {
    'buffers',
    show_filename_only = false,
    symbols = {
      modified = ' ●',      -- Text to show when the buffer is modified
      directory =  '',     -- Text to show when the buffer is a directory
    }
  }},
  lualine_b = {},
  lualine_c = {},
  lualine_x = {},
  lualine_y = {},
  lualine_z = {}
  },

  extensions = {},
}
