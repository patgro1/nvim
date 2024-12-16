return {
    {
        "https://github.com/sainnhe/gruvbox-material",
        config = function()
            vim.cmd([[let g:gruvbox_material_background = 'soft']])
            vim.cmd([[colorscheme gruvbox-material]])
        end
    },
}
