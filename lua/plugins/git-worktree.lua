local wk = require('which-key')
require("git-worktree").setup({
    change_directory_command = 'cd', -- default: "cd",
    update_on_change = true, -- default: true,
    update_on_change_command = 'NvimTreeOpen', -- default: "e .",
    clearjumps_on_change = true, -- default: true,
    autopush = false -- default: false,
})
require("telescope").load_extension("git_worktree")
wk.register({
    w = {
        name = "Worktree",
        w = { '<Cmd>lua require("telescope").extensions.git_worktree.git_worktrees()<CR>', "Switch worktree"},
        c = { '<Cmd>lua require("telescope").extensions.git_worktree.create_git_worktree()<CR>', "Create worktree"},
    }
}, {prefix = "<leader>"})
