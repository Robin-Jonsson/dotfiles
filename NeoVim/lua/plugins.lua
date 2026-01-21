-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        -- add your plugins here

        -- Treesitter --
        {
            'nvim-treesitter/nvim-treesitter',
            lazy = false,
            build = ':TSUpdate',
            opts = {
                ensure_installed = { "c", "lua", "python" },
                highlight = { enable = true },
            },
        },

        -- FZF --
        {
            "ibhagwan/fzf-lua",
            -- optional for icon support
            dependencies = { "nvim-tree/nvim-web-devicons" },
            opts = {
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
            },
        },

        -- Nvim-surround --
        {
            'kylechui/nvim-surround',
            config = function()
                require('nvim-surround').setup()
            end
        },

        -- Nvim-comment
        {
            'terrortylor/nvim-comment',
            config = function()
                require('nvim_comment').setup {
                    comment_empty = false,
                }
            end
        },

        -- Nvim-cmp --
        {
            'hrsh7th/nvim-cmp',

            dependencies = {
                'neovim/nvim-lspconfig',
                'hrsh7th/cmp-nvim-lsp',
                'hrsh7th/cmp-buffer',
                'hrsh7th/cmp-path',
                'hrsh7th/cmp-cmdline',
                'hrsh7th/nvim-cmp',

                -- For vsnip users.
                'hrsh7th/cmp-vsnip',
                'hrsh7th/vim-vsnip',
            },

            config = function()
                local cmp = require'cmp'

                cmp.setup({
                    snippet = {
                        -- REQUIRED - you must specify a snippet engine
                        expand = function(args)
                            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                            -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
                            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
                            -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)

                            -- For `mini.snippets` users:
                            -- local insert = MiniSnippets.config.expand.insert or MiniSnippets.default_insert
                            -- insert({ body = args.body }) -- Insert at cursor
                            -- cmp.resubscribe({ "TextChangedI", "TextChangedP" })
                            -- require("cmp.config").set_onetime({ sources = {} })
                        end,
                    },
                    window = {
                        -- completion = cmp.config.window.bordered(),
                        -- documentation = cmp.config.window.bordered(),
                    },
                    mapping = cmp.mapping.preset.insert({
                        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                        ['<C-f>'] = cmp.mapping.scroll_docs(4),
                        ['<C-Space>'] = cmp.mapping.complete(),
                        ['<C-e>'] = cmp.mapping.abort(),
                        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                    }),
                    sources = cmp.config.sources({
                        { name = 'nvim_lsp' },
                        { name = 'vsnip' }, -- For vsnip users.
                        -- { name = 'luasnip' }, -- For luasnip users.
                        -- { name = 'ultisnips' }, -- For ultisnips users.
                        -- { name = 'snippy' }, -- For snippy users.
                    }, {
                        { name = 'buffer' },
                    })
                })

                -- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
                -- Set configuration for specific filetype.
                --[[ cmp.setup.filetype('gitcommit', {
                sources = cmp.config.sources({
                { name = 'git' },
                }, {
                { name = 'buffer' },
                })
                })
                require("cmp_git").setup() ]]--

                -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
                cmp.setup.cmdline({ '/', '?' }, {
                    mapping = cmp.mapping.preset.cmdline(),
                    sources = {
                        { name = 'buffer' }
                    }
                })

                -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
                cmp.setup.cmdline(':', {
                    mapping = cmp.mapping.preset.cmdline(),
                    sources = cmp.config.sources({
                        { name = 'path' }
                    }, {
                        { name = 'cmdline' }
                    }),
                    matching = { disallow_symbol_nonprefix_matching = false }
                })

                -- Set up lspconfig.
                local capabilities = require('cmp_nvim_lsp').default_capabilities()
                -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
                vim.lsp.config['clangd'].setup = {
                    capabilities = capabilities,
                }
                vim.lsp.enable({'clangd'})
            end
        },
    },
    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    install = { colorscheme = { "habamax" } },
    -- automatically check for plugin updates
    checker = { enabled = true },
})
