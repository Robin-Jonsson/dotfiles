vim.pack.add({
    { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main' },
    'https://github.com/nvim-tree/nvim-web-devicons',
    'https://github.com/ibhagwan/fzf-lua',
    { src = 'https://github.com/nvim-mini/mini.nvim', version = 'main' },
    'https://github.com/neovim/nvim-lspconfig',
})

require('fzf-lua').setup({
    files = {
        previewer = false,
        file_icons = true,
        git_icons = false,
    },
    fzf_opts = {
        ['--info'] = 'hidden',
        ['--color'] = vim.opt.background:get() == 'light' and 'light' or 'dark',
    },
    winopts = {
        border = 'single',
    },
})
require('mini.surround').setup({
    -- Module mappings. Use `''` (empty string) to disable one.
    mappings = {
        add = '<leader>s', -- Add surrounding in Normal and Visual modes
        delete = 'ds', -- Delete surrounding
        find = '<leader>sf', -- Find surrounding (to the right)
        find_left = '<leader>sF', -- Find surrounding (to the left)
        highlight = '<leader>sh', -- Highlight surrounding
        replace = 'cs', -- Replace surrounding

        suffix_last = 'l', -- Suffix to search with "prev" method
        suffix_next = 'n', -- Suffix to search with "next" method
    },
})
require('mini.icons').setup()
require('mini.snippets').setup()
require('mini.completion').setup()
