return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function ()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
                sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
                ignore_install = { "" }, -- List of parsers to ignore installing
                autopairs = {
                    enable = true,
                },
                highlight = {
                  enable = true, -- false will disable the whole extension
                  disable = { }, -- list of language that will be disabled
                  additional_vim_regex_highlighting = true,
                },
                indent = { enable = true, disable = { "python" } },

                rainbow = {
                  enable = true,
                  -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
                  extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
                  max_file_lines = nil, -- Do not enable for files with more than n lines, int
                  -- colors = {}, -- table of hex strings
                  -- termcolors = {} -- table of colour name strings
                }})
        end
    },

    {
        "nvim-treesitter/nvim-treesitter-context",
    }
}
