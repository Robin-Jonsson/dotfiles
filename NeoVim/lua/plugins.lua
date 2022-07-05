return require('packer').startup(function()
    -- Packer --
    use 'wbthomason/packer.nvim'

    -- Treesitter --
    use {
        'nvim-treesitter/nvim-treesitter', run = ':TSUpdate',
        config = function()
            require'nvim-treesitter.configs'.setup {
                -- A list of parser names, or "all"
                ensure_installed = { "c", "lua" },

                -- Install parsers synchronously (only applied to `ensure_installed`)
                sync_install = false,

                highlight = {
                    enable = true,
                },
            }
        end
    }

    -- Fzf --
    use {
        'ibhagwan/fzf-lua',
        requires = {
            {'kyazdani42/nvim-web-devicons'},
            {'junegunn/fzf', run = './install --bin'},
        },
        config = function()
            require('fzf-lua').setup {
                file_icon_padding = ' ',
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

            }
        end
    }

    -- LSP --
    use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
    vim.diagnostic.disable()

    -- CMP --
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lua',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-vsnip',
            'hrsh7th/vim-vsnip',
            'onsails/lspkind.nvim',
        },
        config = function()
            local cmp = require'cmp'
            local lspkind = require('lspkind')

            cmp.setup({
                snippet = {
                    -- REQUIRED - you must specify a snippet engine
                    expand = function(args)
                        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                    end,
                },
                window = {
                    -- completion = cmp.config.window.bordered(),
                    -- documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    --['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    --['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'nvim_lua' },
                    { name = 'vsnip' },
                    { name = 'path' },
                }, {
                    { name = 'buffer' },
                }),
                formatting = {
                    format = lspkind.cmp_format({
                        mode = 'symbol_text',
                        maxwidth = 50,

                        before = function (entry, vim_item)
                            return vim_item
                        end
                    })
                },
            })

            -- Set configuration for specific filetype.
            cmp.setup.filetype('gitcommit', {
                sources = cmp.config.sources({
                    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
                }, {
                    { name = 'buffer' },
                })
            })

            -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline('/', {
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
                })
            })

            local lsp_caps = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
            local servers = {'clangd'}
            for _, s in ipairs(servers) do
                require('lspconfig')[s].setup {
                    capabilities = lsp_caps,
                }
            end
        end
    }

    -- Nvim-surround --
    use {
        'kylechui/nvim-surround',
        config = function()
            require('nvim-surround').setup()
        end
    }

    use {
        'terrortylor/nvim-comment',
        config = function()
            require('nvim_comment').setup {
                comment_empty = false,
            }
        end
    }
end)
