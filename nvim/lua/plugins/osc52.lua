return {
  {
    'tadic-luka/osc52.nvim',
    config = function()
      local osc52 = require("osc52")
      vim.api.nvim_create_autocmd("TextYankPost", {
        pattern = "*",
        callback = function(args)
          local event = vim.v.event
          if event.operator == "y" and event.regname == "" then
            vim.api.nvim_command('OSCYankReg "')
          end
        end,
        desc = "Copy yanked text to terminal clipboard using osc52 escape",
      })
    end,
  }
}
