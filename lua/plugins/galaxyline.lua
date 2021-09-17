local gl = require('galaxyline')
local condition = require('galaxyline.condition')
local gls = gl.section

--local colors = require("material.colors")
local nightfox_colors = {
    black = "#141C26",
    black_br = "#7f8c98",
    blue = "#719cd6",
    blue_br = "#84CEE4",
    cyan = "#63cdcf",
    cyan_br = "#59F0FF",
    green = "#81B29A",
    green_br = "#58cd8b",
    magenta = "#9D79D6",
    magenta_br = "#B8A1E3",
    orange = "#F4A261",
    orange_br = "#F6A878",
    pink = "#D67AD2",
    pink_br = "#DF97DB",
    red = "#c94f6d",
    red_br = "#D6616B",
    white = "#dfdfe0",
    white_br = "#F2F2F2",
    yellow = "#dbc074",
    yellow_br = "#FFE37E"
}
local colors = nightfox_colors

gls.left[1] = {
    FirstElement = {
        provider = function() return ' ' end,
        highlight = {colors.red,colors.bg}
    }
}
gls.left[2] = {
    ViMode = {
        provider = function()
            local mode_color = {n = colors.orange, no = colors.orange,
                i = colors.green, ic = colors.green,
                ix = colors.green,
                R = colors.purple, Rc = colors.purple,
                Rv = colors.purple, Rx = colors.purple,
                [''] = colors.blue,
                V = colors.blue, v = colors.blue,
                s = colors.red, S = colors.red,
                [''] = colors.orange,
                t = colors.orange, ['!'] = colors.orange,
                rm = colors.cyan, ['r?'] = colors.cyan,
                c = colors.yellow,
            }
            vim.api.nvim_command('hi GalaxyViMode guifg='..mode_color[vim.fn.mode()])
            return ' '
        end,
        highlight = {colors.red,colors.bg,'bold'}
    },
}
gls.left[3] = {
    FileSize = {
        provider = 'FileSize',
        condition = condition.buffer_not_empty,
        highlight = {colors.fg,colors.bg},
    },
}
gls.left[4] = {
    FileIcon = {
        provider = 'FileIcon',
        condition = condition.buffer_not_empty,
        highlight = {require('galaxyline.providers.fileinfo').get_file_icon_color,colors.bg},
    },
}

gls.left[5] = {
    GitBranch = {
        provider = 'GitBranch',
        condition = condition.git_check_workspace,
        icon = " ",
        separator = '',
        highlight = {colors.orange, colors.bg}
    }
}
gls.left[6] = {
    Space = {
        provider = function () return ' ' end,
        highlight = {colors.fg, colors.bg}
    }
}
gls.left[7] = {
    GitAdd = {
        provider = 'DiffAdd',
        condition = condition.git_check_workspace,
        icon = " ",
        highlight = {colors.green, colors.bg}
    }
}
gls.left[8] = {
    GitRemove = {
        provider = 'DiffRemove',
        condition = condition.git_check_workspace,
        icon = " ",
        highlight = {colors.red, colors.bg}
    }
}
gls.left[9] = {
    GitModified = {
        provider = 'DiffModified',
        condition = condition.hide_in_width,
        icon = " ",
        highlight = {colors.yellow, colors.bg}
    }
}

gls.mid[1] = {
    ShowLspClient = {
        provider = 'GetLspClient',
        condition = function ()
            local tbl = {['dashboard'] = true,['']=true}
            if tbl[vim.bo.filetype] then
                return false
            end
            return true
        end,
        icon = ' LSP: ',
        highlight = {colors.green,colors.bg},
    },
}
gls.mid[2] = {
    Space = {
        provider = function () return ' ' end,
        highlight = {colors.fg, colors.bg}
    }
}
gls.mid[3] = {
    DiagError = {
        provider = 'DiagnosticError',
        icon = "  ",
        highlight = {colors.red, colors.bg}
    }
}
gls.mid[4] = {
    DiagnosticWarn = {
        provider = 'DiagnosticWarn',
        icon = "   ",
        highlight = {colors.yellow, colors.bg}
    }
}
gls.mid[5] = {
    DiagnosticHint = {
        provider = 'DiagnosticHint',
        icon = "  ",
        highlight = {colors.blue, colors.bg}
    }
}
gls.mid[6] = {
    DiagnosticInfo = {
        provider = 'DiagnosticInfo',
        icon = "  ",
        highlight = {colors.green, colors.bg}
    }
}


gls.right[1] = {
    FileFormat = {
        provider = 'FileFormat',
        condition = condition.buffer_not_empty,
        highlight = {colors.bg,colors.fg},
    }
}
gls.right[2] = {
    LineColumn = {
        provider = 'LineColumn',
        separator = ' ',
        condition = condition.buffer_not_empty,
        highlight = {colors.fg,colors.bg},
    }
}
gls.right[3] = {
    LinePercent = {
        provider = 'LinePercent',
        condition = condition.buffer_not_empty,
        highlight = {colors.fg,colors.bg},
    }
}
