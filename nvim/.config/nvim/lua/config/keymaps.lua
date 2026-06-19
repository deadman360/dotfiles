-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Sair do insert mode com "fd" (alternativa ao <Esc>)
-- Digitar 'f' seguido de 'd' rapidamente sai do insert mode
vim.keymap.set("i", "fd", "<Esc>", {
  noremap = true,
  silent = true,
  desc = "Sair do insert mode com fd",
})

-- Mesma sequência no modo terminal (útil dentro do nvim)
vim.keymap.set("t", "fd", "<C-\\><C-n>", {
  noremap = true,
  silent = true,
  desc = "Sair do modo terminal com fd",
})
