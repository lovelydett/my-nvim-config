-- Set Leader Key
vim.g.mapleader = " "
vim.g.maplocalleader = ","

local keymap = vim.keymap

-- keymap.set(mode, new key, original key)
-- Visual Mode --
keymap.set("v", "<Space>", "<Nop>", { silent = true }) -- Clear Space default behavior for leader key to work
-- Move line up and down
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")
keymap.set("v", ">", ">gv") -- 支持连续缩进
keymap.set("v", "<", "<gv") -- 支持连续取消缩进

-- Normal Mode --
-- Windows
keymap.set("n", "<leader>sv", "<C-w>v") -- Horizontal add new window
keymap.set("n", "<leader>sh", "<C-w>s") -- Vertical add new window
keymap.set("n", "<leader>wc", "<C-w>c") -- Close current window
keymap.set("n", "<leader>t", ":terminal<CR>") -- Open terminal

