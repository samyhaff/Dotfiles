local keymap = vim.api.nvim_set_keymap

local opts = { noremap = true, silent = true }

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- split
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

keymap("n", "<leader>s", ":setlocal spell spelllang=fr<CR>", opts)
keymap("n", "<leader>a", "<C-^>", opts)
keymap("n", "<leader>e", ":Lex 20<cr>", opts)

keymap("n", "Y", "y$", opts)
keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)

-- telescope
keymap("n", "<leader>o", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>r", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>c", "<cmd>Telescope colorscheme<cr>", opts)
