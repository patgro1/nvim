return {
    {
        "akinsho/bufferline.nvim",
        event = "VeryLazy",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        config = function()
            require 'bufferline'.setup({
                options = {
                    diagnostics = "nvim_lsp",
                    diagnostics_indicator = function(count, level, _, _)
                        local icon = level:match("error") and " " or " "
                        return " " .. icon .. count
                    end,
                    offsets = {
                        {
                            filetype = "neo-tree",
                            text = "Neotree",
                            text_align = "left",
                        }
                    }
                }
            })
        end
    },
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        config = function()
            require 'pat.lualine'.config_lualine()
        end
    },
    {
        "karb94/neoscroll.nvim",
        event = "BufReadPre",
        version = "0.2.0",
        config = function()
            require('neoscroll').setup({
                -- Force no mapping to be done to prevent mapping from being overwritten
                mappings = {}
            })
            local t    = {}
            t['<C-u>'] = { 'scroll', { '-vim.wo.scroll', 'true', '251' } }
            t['<C-d>'] = { 'scroll', { 'vim.wo.scroll', 'true', '250' } }
            t['<C-b>'] = { 'scroll', { '-vim.api.nvim_win_get_height(0)', 'true', '450' } }
            t['<C-f>'] = { 'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '450' } }
            t['zt']    = { 'zt', { '250' } }
            t['zz']    = { 'zz', { '250' } }
            t['zb']    = { 'zb', { '250' } }

            require('neoscroll.config').set_mappings(t)
        end
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "BufReadPost",
    },
}
