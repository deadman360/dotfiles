-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Navigate buffer tabs
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Previous buffer" })

-- Close buffer
map("n", "<leader>bd", "<cmd>bd<cr>", { desc = "Close buffer" })

-- Window navigation (usando navegação nativa do Neovim)
map("n", "<leader>wh", "<C-w>h", { desc = "Move focus Left" })
map("n", "<leader>wj", "<C-w>j", { desc = "Move focus Down" })
map("n", "<leader>wk", "<C-w>k", { desc = "Move focus Up" })
map("n", "<leader>wl", "<C-w>l", { desc = "Move focus Right" })

-- Window splits
map("n", "<leader>w/", "<cmd>vsplit<cr>", { desc = "Vertical Split" })
map("n", "<leader>w-", "<cmd>split<cr>", { desc = "Horizontal Split" })
map("n", "<leader>wc", "<cmd>close<cr>", { desc = "Close Window" })
map("n", "<leader>wx", "<cmd>close<cr>", { desc = "Close current window" })

-- File save
map("n", "<leader>fw", "<cmd>w<cr>", { desc = "File Save" })

-- Insert mode: exit with 'fd'
map("i", "fd", "<esc>", { desc = "Exit insert mode" })

-- Desabilita 'jk' e 'jj' se você não quiser usar
map("i", "jk", "<nop>", { desc = "Disabled" })
map("i", "jj", "<nop>", { desc = "Disabled" })
