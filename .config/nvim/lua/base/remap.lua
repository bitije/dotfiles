vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Yank to clipboard (requires xclip)
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Disable arrow keys for normal, insert, and visual modes
--vim.api.nvim_set_keymap('n', '<Up>', '<Nop>', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<Down>', '<Nop>', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<Left>', '<Nop>', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<Right>', '<Nop>', { noremap = true, silent = true })
--
--vim.api.nvim_set_keymap('i', '<Up>', '<Nop>', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('i', '<Down>', '<Nop>', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('i', '<Left>', '<Nop>', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('i', '<Right>', '<Nop>', { noremap = true, silent = true })
--
--vim.api.nvim_set_keymap('x', '<Up>', '<Nop>', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('x', '<Down>', '<Nop>', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('x', '<Left>', '<Nop>', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('x', '<Right>', '<Nop>', { noremap = true, silent = true })
