-- Commands

-- Remove trailing whitespaces
vim.cmd [[autocmd BufWritePre * %s/\s\+$//e ]]
