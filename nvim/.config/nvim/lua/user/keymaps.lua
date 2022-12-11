local keymap = vim.api.nvim_set_keymap

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

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

keymap("n", "<leader>s", ":setlocal spell <CR>", opts)
-- keymap("n", "<leader>a", "<C-^>", opts)
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
keymap("n", "<leader>x", ":bd<CR>", opts)

keymap("n", "Y", "y$", opts)
keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)

-- telescope
keymap("n", "<leader>o", "<cmd>Telescope find_files<CR>", opts)
keymap("n", "<leader>r", "<cmd>Telescope live_grep<CR>", opts)
keymap("n", "<leader>c", "<cmd>Telescope colorscheme<CR>", opts)
keymap("n", "<leader>h", "<cmd>Telescope help_tags<CR>", opts)

-- terminal
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- buffer_line
keymap("n", "<TAB>", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<S-TAB>", ":BufferLineCyclePrev<CR>", opts)
keymap("n", "<leader>j", ":BufferLineMoveNext<CR>", opts)
keymap("n", "<leader>k", ":BufferLineMovePrev<CR>", opts)


keymap("n", "<leader>b", ":TexlabBuild<CR>", opts)
keymap("n", "<leader>p", ":silent !zathura %:r.pdf &<CR>", opts)
keymap("n", "<leader>f", ":Format<CR>", opts)
keymap("i", "<C-l>", "<c-g>u<Esc>[s1z=`]a<c-g>u", opts)
keymap("n", "<leader>m", ":!g++ %<CR>", opts)
keymap("n", "<leader>r", ":!cat input | ./a.out<CR>", opts)
