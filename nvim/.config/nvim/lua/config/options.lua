local opt = vim.opt
local cmd = vim.cmd

opt.clipboard = "unnamedplus"
opt.fileencoding = "utf-8"
opt.completeopt = { "menuone", "noselect" }
opt.ignorecase = true
opt.mouse = "a"
opt.showtabline = 2
opt.showmode = false
opt.smartcase = true
opt.smartindent = true
opt.splitbelow = true
opt.splitright = true
opt.swapfile = false
opt.termguicolors = true
opt.undofile = true
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.cursorline = true
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.wrap = false
opt.scrolloff = 2
opt.sidescrolloff = 0
opt.incsearch = true
opt.hlsearch = false
opt.bg = "dark"
opt.showmatch = true
opt.shortmess:append "c"
opt.list = true
opt.listchars:append("eol:↴")
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

cmd [[au BufWritePre * :%s/\s\+$//e]]
cmd [[set iskeyword+=-]]
