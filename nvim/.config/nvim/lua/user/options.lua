local opt = vim.opt
local cmd = vim.cmd
local g = vim.g

-- :help options
opt.title = true
opt.clipboard = "unnamedplus"
opt.completeopt = { "menuone", "noselect" }
opt.fileencoding = "utf-8"
opt.ignorecase = true
opt.mouse = "a"
opt.pumheight = 10
opt.showmode = false
opt.showtabline = 2
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
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.undodir = "~/.config/nvim/undodir"
opt.incsearch = true
opt.hlsearch = false
opt.bg = "dark"
opt.showmatch = true
opt.shortmess:append "c"

cmd [[au BufWritePre * :%s/\s\+$//e]]
cmd "set whichwrap+=<,>,[,],h,l"
cmd [[set iskeyword+=-]]

-- disable some builtin vim plugins
local disabled_built_ins = {
   "2html_plugin",
   "getscript",
   "getscriptPlugin",
   "gzip",
   "logipat",
   "netrw",
   "netrwPlugin",
   "netrwSettings",
   "netrwFileHandlers",
   "matchit",
   "tar",
   "tarPlugin",
   "rrhelper",
   "spellfile_plugin",
   "vimball",
   "vimballPlugin",
   "zip",
   "zipPlugin",
}

for _, plugin in pairs(disabled_built_ins) do
   g["loaded_" .. plugin] = 1
end
