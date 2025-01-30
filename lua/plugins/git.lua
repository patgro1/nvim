return {
    {
        'tanvirtin/vgit.nvim',
        branch = "main",
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons'
        },
        event = 'VimEnter',
        keys = {
            { "<c-k>",       function() require('vgit').hunk_up() end,                desc = "Go to previous hunk" },
            { "<c-j>",       function() require('vgit').hunk_down() end,              desc = "Go to next hunk" },
            { "<leader>g",   group = "git" },
            { "<leader>gs",  function() require('vgit').buffer_hunk_stage() end,      desc = "Stage current hunk" },
            { "<leader>gr",  function() require('vgit').buffer_hunk_reset() end,      desc = "Reset current hunk" },
            { "<leader>gp",  function() require('vgit').buffer_hunk_preview() end,    desc = "Diff current hunk" },
            { "<leader>gb",  function() require('vgit').buffer_blame_preview() end,   desc = "Opens git blame for current line" },
            { "<leader>gf",  function() require('vgit').buffer_diff_preview() end,    desc = "Diff current buffer" },
            { "<leader>gh",  function() require('vgit').buffer_history_preview() end, desc = "Open diffs with log list" },
            { "<leader>gu",  function() require('vgit').buffer_reset() end,           desc = "Reset current buffer" },
            { "<leader>gd",  function() require('vgit').project_diff_preview() end,   desc = "Open diff for whole project" },
            { "<leader>gt",  group = "git toggle" },
            { "<leader>gtb", function() require('vgit').toggle_live_blame() end,      desc = "Toggle git blame one lines" },
            { "<leader>gtg", function() require('vgit').toggle_live_gutter() end,     desc = "Toggle git signs" },

        },
        config = function() require('vgit').setup() end
    }
}
