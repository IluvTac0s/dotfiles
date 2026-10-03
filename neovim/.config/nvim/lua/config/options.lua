local opt = vim.opt

-- Numbers
opt.number = true
opt.relativenumber = false

-- Indentation
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
opt.smartindent = true

-- UI
opt.termguicolors = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.showmode = false
opt.laststatus = 3
opt.cmdheight = 1

-- Editing
opt.wrap = false
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.undofile = true
opt.swapfile = false
opt.backup = false

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true

-- Splits
opt.splitright = true
opt.splitbelow = true

-- Completion
opt.completeopt = { "menu", "menuone", "noselect" }

-- Folding
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldlevel = 99
opt.foldlevelstart = 99

-- Leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "
