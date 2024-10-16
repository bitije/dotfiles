require("packer")

-- REMAPS --
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", ":Ex<CR>")

-- Yank to clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Move selected lines in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Cursor in the home of line while J
vim.keymap.set("n", "J", "mzJ`z")

-- Cursor in the middle of the screen while search
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Paste instead selected without losing buffer
vim.keymap.set("x", "<leader>pp", [["_dP]])

-- Scroling remaps
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Buffer navigation
vim.keymap.set("n", "<Tab>", ":bnext <CR>")
vim.keymap.set("n", "<S-Tab>", ":bprevious <CR>")
vim.keymap.set("n", "<leader>d", ":bd! <CR>")

-- Tab navigation
vim.keymap.set("n", "<leader>t", ":tabnew <CR>")
vim.keymap.set("n", "<leader>x", ":tabclose <CR>")
vim.keymap.set("n", "<leader>h", ":tabprevious <CR>")
vim.keymap.set("n", "<leader>l", ":tabnext <CR>")

-- Split navigation
vim.keymap.set("n", "<M-l>", ":vertical resize +1 <CR>")
vim.keymap.set("n", "<M-h>", ":vertical resize -1 <CR>")
vim.keymap.set("n", "<M-j>", ":resize +1 <CR>")
vim.keymap.set("n", "<M-k>", ":resize -1 <CR>")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")

-- Maximize split
vim.keymap.set("n", "<leader>ww", "<C-w>_") -- horizontal
vim.keymap.set("n", "<leader>we", "<C-w>|") -- vertical
vim.keymap.set("n", "<leader>wq", "<C-w>=") -- reset

-- Automatically close brackets, parethesis, and quotes
vim.keymap.set("i", "'", "''<left>")
vim.keymap.set("i", "\"", "\"\"<left>")
vim.keymap.set("i", "(", "()<left>")
vim.keymap.set("i", "[", "[]<left>")
vim.keymap.set("i", "{", "{}<left>")
vim.keymap.set("i", "<", "<><left>")

-- BASIC SETS --
vim.opt.guicursor = ""
vim.opt.cursorline = false
--vim.opt.cursorcolumn = true
--vim.opt.textwidth = 75
--vim.opt.colorcolumn = "+1"
vim.opt.syntax = "ON"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.conceallevel = 2

vim.opt.termguicolors =true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.showtabline = 1
vim.opt.laststatus = 2
