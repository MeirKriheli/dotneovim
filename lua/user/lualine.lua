local navic = require("nvim-navic")

require('lualine').setup {
    options = {
        theme = 'nord',
        section_separators = '',
        component_separators = ''
    },
    sections = {
        lualine_c = {
            {
                'filename',
                path = 1
            },
            {
                function ()
                  return navic.get_location()
                end,
                cond = function ()
                  return navic.is_available()
                end
            },
        },
        lualine_x = {
            {
                'encoding',
                padding = 0,
            },
            'fileformat',
            {
                'filetype',
                icon_only = true,
                padding = {left = 0, right = 1},
            }
        },
    }
}
