-- options for some colorschemes
vim.g.tokyonight_style = "night"
vim.g.material_style = "deep ocean"

-- local pywal = require('pywal')
-- pywal.setup()

-- require('onedark').setup {
--     style = 'warmer'
-- }
-- require('onedark').load()

local colorscheme = "pywal"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
