-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Use the system clipboard
vim.opt.clipboard = "unnamedplus"

-- Delete without overwriting clipboard
vim.keymap.set({"n", "v"}, "x", '"_x')
vim.keymap.set({"n", "v"}, "X", '"_X')
