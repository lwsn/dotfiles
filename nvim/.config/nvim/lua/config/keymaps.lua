-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set({ "n", "v" }, "ö", "{")
vim.keymap.set({ "n", "v" }, "ä", "}")

vim.keymap.set({ "n", "v" }, "€", "$")
vim.keymap.set({ "n", "v" }, "D", "dd")
vim.keymap.set({ "n", "v" }, "Y", "yy")
vim.keymap.set("n", "<C-S-e>", ":e %:p:h")

vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Save" })

-- Messy keymaps for alt + hjkl
vim.keymap.set("n", "√", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
vim.keymap.set("n", "ª", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
vim.keymap.set("i", "√", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
vim.keymap.set("i", "ª", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
vim.keymap.set("v", "√", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
vim.keymap.set("v", "ª", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

vim.keymap.set("n", "˛", "<cmd>bp<cr>", { desc = "Previous Buffer" })
vim.keymap.set("n", "ﬁ", "<cmd>bn<cr>", { desc = "Next Buffer" })

-- default keymaps I dislike
vim.keymap.del("n", "<leader><tab>l")
vim.keymap.del("n", "<leader><tab>o")
vim.keymap.del("n", "<leader><tab>f")
vim.keymap.del("n", "<leader><tab><tab>")
vim.keymap.del("n", "<leader><tab>]")
vim.keymap.del("n", "<leader><tab>d")
vim.keymap.del("n", "<leader><tab>[")
