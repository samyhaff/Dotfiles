local opt = vim.opt
local cmd = vim.cmd

-- :help options
opt.title = true
opt.clipboard = "unnamedplus"
opt.completeopt = { "menuone", "noselect" }
opt.fileencoding = "utf-8"
opt.ignorecase = true
opt.mouse = "a"
opt.pumheight = 10
opt.showtabline = 2
opt.showmode = false
opt.smartcase = true
opt.smartindent = true
opt.splitbelow = true
opt.splitright = true
opt.swapfile = false
opt.termguicolors = true
opt.timeoutlen = 1000
opt.undofile = true
opt.updatetime = 300
opt.writebackup = false
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.cursorline = true
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.wrap = false
opt.scrolloff = 4
opt.sidescrolloff = 0
opt.incsearch = true
opt.hlsearch = false
opt.bg = "dark"
opt.showmatch = true
opt.shortmess:append "c"
opt.list = true
opt.listchars:append("eol:↴")

cmd [[au BufWritePre * :%s/\s\+$//e]]
-- cmd "set whichwrap+=<,>,[,],h,l"
cmd [[set iskeyword+=-]]

vim.api.nvim_command([[
autocmd BufWritePost *.tex :silent !pdflatex %:r
]])
