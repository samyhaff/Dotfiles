-- options for some colorschemes
vim.g.material_style = "deep ocean"
vim.g.catppuccin_flavour = "mocha"

require('tokyonight').setup {
    style = 'night'
}
require('tokyonight').load()
require('onedark').setup {
    style = 'warmer'
}
require('onedark').load()

local colorscheme = "dark-decay"

vim.cmd("colorscheme " .. colorscheme)
