local map = vim.keymap.set

local opts = { noremap = true, silent = true }

-- Save and quit
map("n", "<leader>w", "<cmd>write<cr>", { desc = "Save file" })
map("n", "<leader>q", "<cmd>quit<cr>", { desc = "Quit window" })
map("n", "<leader>x", "<cmd>bdelete<cr>", { desc = "Close buffer" })

-- Clear search highlighting
map("n", "<Esc>", "<cmd>nohlsearch<cr>", opts)

-- Keep cursor centered
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)

-- Move between windows
map("n", "<C-h>", "<C-w>h", { desc = "Move left" })
map("n", "<C-j>", "<C-w>j", { desc = "Move down" })
map("n", "<C-k>", "<C-w>k", { desc = "Move up" })
map("n", "<C-l>", "<C-w>l", { desc = "Move right" })

-- Resize windows
map("n", "<C-Up>", "<cmd>resize +2<cr>", opts)
map("n", "<C-Down>", "<cmd>resize -2<cr>", opts)
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", opts)
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", opts)

-- Move selected lines
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Better indentation
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Terminal
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
