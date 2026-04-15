-- vim.lsp.config('lua_ls', {})
-- vim.lsp.config('clangd', {})
vim.lsp.enable({'lua_ls', 'clangd'})

vim.diagnostic.config({ virtual_text = { current_line = true }})
