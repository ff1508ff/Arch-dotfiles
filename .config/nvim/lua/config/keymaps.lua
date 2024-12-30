-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local del = vim.keymap.del

-- Center the screen on the cursor when hoping
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Move Lines remap
del({ "n", "i", "v" }, "<A-j>")
del({ "n", "i", "v" }, "<A-k>")

map("n", "<S-Down>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
map("i", "<S-Down>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("v", "<S-Down>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })

map("n", "<S-Up>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
map("i", "<S-Up>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<S-Up>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })
