require('colorscheme.utils')

color = {
    dark = {
        '#2c2b2d',
        '#414042',
        '#565557',
        '#6b6b6c',
        '#808081',
    },
    light = {
        '#fffbe8',
        '#e6e2d1',
        '#ccc9ba',
        '#b3b0a2',
        '#99978b',
    },
    accent = {
        '#90643b',
        '#9b744f',
        '#a68362',
        '#b19376',
        '#bca289',
    },
    gold = {
        '#daaf48',
        '#deb75a',
        '#e1bf6d',
        '#e5c77f',
        '#e9cf91',
    },
}

vim.opt.cursorline = true

clear_hl()

set_hl({'SpellBad', 'SpellCap'}, 'none', 'none', 'underline')
set_hl('StatusLine', color.dark[1], color.gold[5])
set_hl('StatusLineNC', color.dark[1], color.light[2])
