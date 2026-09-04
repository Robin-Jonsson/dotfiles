require('colorscheme.utils')

theme = {
    statusline = {
        bg = '#e9cf91',
        inactive_bg = '#e6e2d1',
        fg = '#2c2b2d',
    },
    robdark = { -- https://colorkit.io/#121212-#f2eadb-15
        bg        = '#121212',
        fg        = '#f2eadb',
        -- accent    = '#cf6b2a', -- burnt amber
        accent    = '#5f9e6b', -- sage/olive
        comment   = '#524e4a',
        highlight = '#282826',
        string    = '#6a6a62',   -- alternative: #96968a
        visual    = '#232321',
    },
    roblight = {
        bg        = '#fffbe8',
        fg        = '#2c2b2d',
        accent    = '#b19376',
        comment   = '#808081',
        highlight = '#dcdcdc',
        string    = '#6b6b6c',
        visual    = '#e6e2d1',
    },
}

vim.opt.cursorline = true

clear_hl()

set_hl({'SpellBad', 'SpellCap'}, 'none', 'none', 'underline')
set_hl('StatusLine', theme.statusline.fg, theme.statusline.bg)
set_hl('StatusLineNC', theme.statusline.fg, theme.statusline.inactive_bg)
