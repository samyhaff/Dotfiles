-- options for some colorschemes
vim.g.tokyonight_style = "night"
vim.g.material_style = "deep ocean"
vim.g.catppuccin_flavour = "mocha"

-- local pywal = require('pywal')
-- pywal.setup()

-- require('onedark').setup {
--     style = 'warmer'
-- }
-- require('onedark').load()

local colorscheme = "dark-decay"

vim.cmd("colorscheme " .. colorscheme)
