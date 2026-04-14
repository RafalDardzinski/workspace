require "nvchad.autocmds"

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = {
    "*/ansible/*.yml",
    "*/ansible/**/*.yml",
  },
  callback = function()
    vim.bo.filetype = "yaml.ansible"
  end,
})
