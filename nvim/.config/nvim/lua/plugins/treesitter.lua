return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        build = ":TSUpdate",
        config = function ()
            local ts = require("nvim-treesitter")

            -- install every available parser (async, skips already installed ones)
            ts.install(ts.get_available())

            vim.api.nvim_create_autocmd("FileType", {
                callback = function (args)
                    local buf = args.buf
                    local lang = vim.treesitter.language.get_lang(vim.bo[buf].filetype)
                    if not lang or not vim.treesitter.language.add(lang) then
                        return
                    end

                    vim.treesitter.start(buf, lang)
                    vim.bo[buf].syntax = "on" -- additional_vim_regex_highlighting

                    if lang ~= "python" then
                        vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                    end
                end,
            })
        end
    },

    {
        "nvim-treesitter/nvim-treesitter-context",
    }
}
