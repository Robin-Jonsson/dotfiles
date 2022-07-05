function set_hl(name, fg, bg, style)
    name = type(name) == 'string' and {name} or name
    style = style or {}
    style = type(style) == 'string' and {style} or style

    local val = {}
    val.fg = fg
    val.bg = bg
    for _, s in ipairs(style) do
        val[s] = true
    end

    for _, n in ipairs(name) do
        vim.api.nvim_set_hl(0, n, val)
    end
end

function clear_hl()
    local i = 1
    while true do
        name = vim.fn.synIDattr(vim.fn.synIDtrans(i), 'name')
        if name == "" then break end
        set_hl(name, 'none', 'none')

        i = i+1
    end
end
