local colors = require("material.colors")
require("todo-comments").setup {
    -- TODO: create todo hl
    -- FIX: fix the fixme hl
    -- NOTE: this is not the proper highlight
    -- HACK: should hack this comment
    signs = true,
    keywords = {
        FIX = {
            color = colors.red,
            icon = '',
            alt = {'FIXME', 'BUG'}
        },
        TODO = {
            color = colors.green,
            icon = ''
        },
        WARN = {
            color = colors.yellow,
            icon = '',
            alt = {'WARNING'}
        },
        HACK = {
            color = colors.orange,
            icon = ''
        },
        INFO = {
            color = colors.blue,
            icon = '',
            alt = {'NOTE'}
        },
    },
    highlight = {
        before = "", -- "fg" or "bg" or empty
        keyword = "wide", -- "fg", "bg", "wide" or empty. (wide is the same as bg, but will also highlight surrounding characters)
        after = "fg", -- "fg" or "bg" or empty
    },
    pattern = "(KEYWORDS):",
}
