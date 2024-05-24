-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Use the system clipboard
vim.opt.clipboard = "unnamedplus"

-- Yank to both the buffer and primary clipboard
vim.api.nvim_create_augroup("YankBoth", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  group = "YankBoth",
  callback = function()
    if vim.v.event.operator == "y" then
      local yanked_text = vim.fn.getreg('"')
      vim.fn.system("xclip -selection clipboard", yanked_text)
      vim.fn.system("xclip -selection primary", yanked_text)
    end
  end,
})
