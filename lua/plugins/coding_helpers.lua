return {
    {
        "numToStr/Comment.nvim",
        event = "BufReadPost",
        config = function()
            require 'Comment'.setup()
            local ft = require 'Comment.ft'
            ft.set('vhdl', '--%s')
        end
    },
    {
        'NvChad/nvim-colorizer.lua',
        config = true
    },
    {
        "folke/todo-comments.nvim",
        event = "BufReadPost",
        cmd = "TodoTelescope",
        config = function()
            require 'todo-comments'.setup()
        end
    },
    {
        'echasnovski/mini.align',
        version = '*',
        config = true
    },
    {
        -- aliases for surround char:
        --
        "kylechui/nvim-surround",
        version = "v1.x.x",
        event = "BufReadPost",
        config = function()
            require 'nvim-surround'.setup({
                keymaps = {
                    insert = "<C-g>s",
                    insert_line = "<C-g>S",
                    normal = "sa",
                    normal_cur = "yss",
                    normal_line = "yS",
                    normal_cur_line = "ySS",
                    visual = "S",
                    visual_line = "gS",
                    delete = "sd",
                    change = "sr",
                },
                -- NOTE: these are the default aliases... its just to keep track of them
                aliases = {
                    ["a"] = ">",
                    ["b"] = ")",
                    ["B"] = "}",
                    ["r"] = "]",
                    ["q"] = { '"', "'", "`" },
                    ["s"] = { "}", "]", ")", ">", '"', "'", "`" },
                },
            })
        end
    },
    -- {
    --     "linrongbin16/gentags.nvim",
    --     config = function()
    --         require('gentags').setup()
    --     end,
    --     event = "BufReadPre"
    -- },
}
