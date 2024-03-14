-- Keymapping

local Utils = require('utils')

-- local exprnnoremap = Utils.exprnnoremap
local nnoremap = Utils.nnoremap
local vnoremap = Utils.vnoremap
local xnoremap = Utils.xnoremap
local inoremap = Utils.inoremap
-- local tnoremap = Utils.tnoremap
-- local nmap = Utils.nmap
-- local xmap = Utils.xmap

-- Set the mapleader

vim.g.mapleader = ','

-- kj to normal mode
inoremap("kj", "<Esc>")

-- page up/down with recentering
nnoremap("<C-u>", "<C-u>zz")
nnoremap("<C-d>", "<C-d>zz")

-- Fugitive
nnoremap("<leader>G", ":G<CR>")
nnoremap("<leader>gl", ":Gclog<CR>")

-- Telescope
nnoremap("<leader>o", "<Cmd>Telescope find_files<CR>")
nnoremap("<leader>H", "<Cmd>Telescope find_files hidden=true<CR>")
nnoremap("<leader>b", "<Cmd>Telescope buffers<CR>")
nnoremap("<leader>lg", "<Cmd>Telescope live_grep<CR>")

-- File explorer
nnoremap("<leader>e", "<Cmd>NvimTreeToggle<CR>")  -- NvimTree
-- nnoremap("<leader>e", "<Cmd>RnvimrToggle<CR>")

-- Run Copilot
nnoremap("<leader>C", "<Cmd>Copilot panel<CR>")
