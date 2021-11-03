local options = {
    tab_format = ' #{b}#{f} ',
    icon_colors = true,
    disable_commands = true,
    go_to_maps = false,
    hlgroups = {
        current = 'TabLineSel',
        normal = 'TabLine',
        active = nil,
        spacing = 'SignColumn',
        modified_current = 'TabLineModCur',
        modified_normal = 'TabLineModNorm',
        modified_active = nil,
    },
}

require('buftabline').setup(options)
