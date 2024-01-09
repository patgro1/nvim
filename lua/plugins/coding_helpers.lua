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
        "folke/todo-comments.nvim",
        event = "BufReadPost",
        cmd = "TodoTelescope",
        config = function()
            require 'todo-comments'.setup()
        end
    },
    {
        "Vonr/align.nvim",
        keys = {
            {
                "aa",
                function()
                    require 'align'.align_to_char({
                        preview = true,
                        length = 1
                    })
                end,
                mode = 'x'
            },
            {
                "as",
                function()
                    require 'align'.align_to_char({
                        preview = true,
                        length = 2
                    })
                end,
                mode = 'x'
            }
        }
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
    }
}
