local function map(mode, lhs, rhs, opts)
    opts = opts or {silent = true}
    opts.noremap = opts.noremap == nil and true or opts.noremap

    mode = type(mode) == 'string' and {mode} or mode
    for _, m in ipairs(mode) do
        vim.api.nvim_set_keymap(m, lhs, rhs, opts)
    end
end

map('n', '<Esc>', ':nohlsearch<CR>')
map({'n', 'i'}, '<F1>', '<Nop>')
map({'n', 'v'}, '<C-e>', '3<C-e>')
map({'n', 'v'}, '<C-y>', '3<C-y>')
map('v', '<', '<gv')
map('v', '>', '>gv')
map('v', '<C-k>', '<Esc>`<kdd`>pgv')
map('v', '<C-j>', '<Esc>`>jdd`<Pgv')
map('n', '<C-p>', "<cmd>lua require('fzf-lua').files()<CR>")
