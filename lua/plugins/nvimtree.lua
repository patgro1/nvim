vim.g.nvim_tree_side = 'left'
vim.g.nvim_tree_width = 40
vim.g.nvim_tree_ignore = {'.git', '.cache'}
vim.api.nvim_tree_gitignore = 0
vim.api.nvim_tree_auto_open = 0 -- Auto open tree when calling vim or vim $DIR
vim.api.nvim_tree_auto_close = 1 -- Auto close when tree is the last window
vim.api.nvim_tree_auto_ignore_ft = {} -- [ 'startify', 'dashboard' ] "empty by default, don't auto open tree on specific filetypes.
vim.api.nvim_tree_quit_on_open = 0 -- Auto close tree when opening a file
vim.api.nvim_tree_follow = 0 --this option allows the cursor to be updated when entering a buffer
vim.api.nvim_tree_indent_markers = 0 -- Indent marker when folder are open
vim.api.nvim_tree_hide_dotfiles = 1
vim.api.nvim_tree_highlight_opened_files = 1 -- Folder and File opened highlight
vim.api.nvim_tree_git_hl = 1 -- Git attribute highlighting
vim.api.nvim_tree_tab_open = 0 -- Auto open tree when opening a new tab
vim.api.nvim_tree_disable_netrw = 1 -- Disable netrw
vim.api.nvim_tree_hijack_netrw = 1 -- Prevent netrw from opening
vim.api.nvim_tree_root_folder_modifier = ':~' --This is the default. See :help filename-modifiers for more options
vim.api.nvim_tree_width_allow_resize  = 1 --0 by default, will not resize the tree when opening a file
vim.api.nvim_tree_add_trailing = 1 --0 by default, append a trailing slash to folder names
vim.api.nvim_tree_group_empty = 1 -- 0 by default, compact folders that only contain a single folder into one node in the file tree
vim.api.nvim_tree_lsp_diagnostics = 1 --0 by default, will show lsp diagnostics in the signcolumn. See :help nvim_tree_lsp_diagnostics
vim.api.nvim_tree_disable_window_picker = 1 --0 by default, will disable the window picker.
vim.api.nvim_tree_hijack_cursor = 0 --1 by default, when moving cursor in the tree, will position the cursor at the start of the file on the current line
vim.api.nvim_tree_icon_padding = ' ' --one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
vim.api.nvim_tree_update_cwd = 0 --1 by default, will update the tree cwd when changing nvim's directory (DirChanged event). Behaves strangely with autochdir set.
--vim.api.nvim_tree_window_picker_exclude = {
    --    \   'filetype': [
    --    \     'packer',
    --    \     'qf'
    --    \   ],
    --    \   'buftype': [
    --    \     'terminal'
    --    \   ]
    --    \ }
    --" Dictionary of buffer option names mapped to a list of option values that
    --" indicates to the window picker that the buffer's window should not be
    --" selectable.
    --let g:nvim_tree_special_files = [ 'README.md', 'Makefile', 'MAKEFILE' ] " List of filenames that gets highlighted with NvimTreeSpecialFile
vim.api.nvim_tree_show_icons = {
    git = 1,
    folders = 0,
    files = 0,
    folder_arrows = 1
}
--let g:nvim_tree_show_icons = {
    --    \ 'git': 1,
    --    \ 'folders': 0,
    --    \ 'files': 0,
    --    \ 'folder_arrows': 0,
    --    \ }
    --"If 0, do not show the icons for one of 'git' 'folder' and 'files'
    --"1 by default, notice that if 'files' is 1, it will only display
    --"if nvim-web-devicons is installed and on your runtimepath.
    --"if folder is 1, you can also tell folder_arrows 1 to show small arrows next to the folder icons.
    --"but this will not work when you set indent_markers (because of UI conflict)
    --
vim.api.nvim_tree_icons = {
    default = '',
    symlink = '',
    git = {
        unstaged = "✗",
        staged = "✓",
        unmerged = "",
        renamed = "➜",
        untracked = "★",
        deleted = "",
        ignored = "◌"
    },
    folder = {
        arrow_open = "",
        arrow_closed = "",
        default = "",
        open = "",
        empty = "",
        empty_open = "",
        symlink = "",
        symlink_open = "",
    },
    lsp = {
        hint = "",
        info = "",
        warning = "",
        error = "",
    }
}
local tree_cb = require'nvim-tree.config'.nvim_tree_callback
vim.g.nvim_tree_bindings = {
    { key = {"<CR>", "o", "<2-LeftMouse>"}, cb = tree_cb("edit") },
    { key = {"<2-RightMouse>", "<C-]>"},    cb = tree_cb("cd") },
    { key = "<C-v>",                        cb = tree_cb("vsplit") },
    { key = "<C-x>",                        cb = tree_cb("split") },
    { key = "<C-t>",                        cb = tree_cb("tabnew") },
    { key = "<",                            cb = tree_cb("prev_sibling") },
    { key = ">",                            cb = tree_cb("next_sibling") },
    { key = "P",                            cb = tree_cb("parent_node") },
    { key = "<BS>",                         cb = tree_cb("close_node") },
    { key = "<S-CR>",                       cb = tree_cb("close_node") },
    { key = "<Tab>",                        cb = tree_cb("preview") },
    { key = "K",                            cb = tree_cb("first_sibling") },
    { key = "J",                            cb = tree_cb("last_sibling") },
    { key = "I",                            cb = tree_cb("toggle_ignored") },
    { key = "H",                            cb = tree_cb("toggle_dotfiles") },
    { key = "R",                            cb = tree_cb("refresh") },
    { key = "a",                            cb = tree_cb("create") },
    { key = "d",                            cb = tree_cb("remove") },
    { key = "r",                            cb = tree_cb("rename") },
    { key = "<C-r>",                        cb = tree_cb("full_rename") },
    { key = "x",                            cb = tree_cb("cut") },
    { key = "c",                            cb = tree_cb("copy") },
    { key = "p",                            cb = tree_cb("paste") },
    { key = "y",                            cb = tree_cb("copy_name") },
    { key = "Y",                            cb = tree_cb("copy_path") },
    { key = "gy",                           cb = tree_cb("copy_absolute_path") },
    { key = "[c",                           cb = tree_cb("prev_git_item") },
    { key = "]c",                           cb = tree_cb("next_git_item") },
    { key = "-",                            cb = tree_cb("dir_up") },
    { key = "q",                            cb = tree_cb("close") },
    { key = "g?",                           cb = tree_cb("toggle_help") },
}
vim.api.nvim_set_keymap('n', '<Leader>tt', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>tr', ':NvimTreeRefresh<CR>', { noremap = true, silent = true })
