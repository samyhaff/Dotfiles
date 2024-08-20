local colorscheme = "onedark"

-- require("tokyonight").setup({
--     style = "night"
-- })

require('onedark').setup {
    style = 'light'
}
require('onedark').load()

vim.cmd.colorscheme(colorscheme)
