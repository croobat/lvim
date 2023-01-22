lvim.lsp.diagnostics.virtual_text = false
lvim.lsp.diagnostics.update_in_insert = true
lvim.lsp.diagnostics.underline = false
lvim.lsp.diagnostics.signs = {
    active = true,
    values = {
        { name = "DiagnosticSignError", text = "x" },
        { name = "DiagnosticSignWarn", text = "w" },
        { name = "DiagnosticSignHint", text = "i" },
        { name = "DiagnosticSignInfo", text = "?" },
    },
}
-- +-----------------------------------------------------------------------------+
--  ┌──────┐
--  │ TIPS │
--  └──────┘
-- ---configure a server manually. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---see the full default list `:lua =lvim.lsp.automatic_configuration.skipped_servers`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- linters and formatters <https://www.lunarvim.org/docs/languages#lintingformatting>
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "stylua" },
--   {
--     command = "prettier",
--     extra_args = { "--print-width", "100" },
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     command = "shellcheck",
--     args = { "--severity", "warning" },
--   },
-- }

-- +-----------------------------------------------------------------------------+
--  ┌────────────┐
--  │ OLD CONFIG │
--  └────────────┘
-- -- Execute after attached server
-- local on_attach = function(client, bufnr)
--     -- Enable completion triggered by <c-x><c-o>
--     vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

--     -- buffer mappings
--     local bufopts = { noremap = true, silent = true, buffer = bufnr }
--     vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
--     vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
--     vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
--     vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)

--     -- Set autocommands conditional on server_capabilities
--     if client.server_capabilities.document_highlight then
--         vim.api.nvim_exec(
--             [[
--                 augroup lsp_document_highlight
--                 autocmd! * <buffer>
--                 autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
--                 autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
--                 augroup END
--             ]],
--             false
--         )
--     end
-- end

-- local lsp_flags = {
--     debounce_text_changes = 150,
-- }

-- -- CPM support
-- local def_capabilities = vim.lsp.protocol.make_client_capabilities()
-- local capabilities = require('cmp_nvim_lsp').default_capabilities(def_capabilities)
-- local lspconfig = require('lspconfig')

-- lspconfig.pyright.setup {
--     on_attach = on_attach,
--     flags = lsp_flags,
--     capabilities = capabilities,
--     settings = {
--         python = {
--             analysis = {
--                 typeCheckingMode = "off",
--             },
--         },
--     },
-- }

-- lspconfig.rust_analyzer.setup {
--     on_attach = on_attach,
--     flags = lsp_flags,
--     capabilities = capabilities,
--     -- Server-specific settings...
--     settings = {
--         ["rust-analyzer"] = {}
--     }
-- }

-- lspconfig.sumneko_lua.setup {
--     on_attach = on_attach,
--     flags = lsp_flags,
--     capabilities = capabilities,
--     settings = {
--         Lua = {
--             diagnostics = {
--                 globals = { "vim" },
--             },
--             workspace = {
--                 library = {
--                     [vim.fn.expand("$VIMRUNTIME/lua")] = true,
--                     [vim.fn.stdpath("config") .. "/lua"] = true,
--                 },
--             },
--         },
--     },
-- }

-- lspconfig.tsserver.setup {
--     on_attach = on_attach,
--     flags = lsp_flags,
--     capabilities = capabilities,
--     -- filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less', 'vue' },
--     init_options = {
--         html = {
--             options = {
--                 -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
--                 ["bem.enabled"] = true,
--                 ["output.format"] = true;
--             },
--         },
--     }
-- }

-- lspconfig.intelephense.setup {
--     on_attach = on_attach,
--     flags = lsp_flags,
--     capabilities = capabilities,
-- }

-- lspconfig.html.setup {
--     on_attach = on_attach,
--     flags = lsp_flags,
--     capabilities = capabilities,
-- }

-- lspconfig.emmet_ls.setup {
--     on_attach = on_attach,
--     flags = lsp_flags,
--     capabilities = capabilities,
-- }

-- lspconfig.cssls.setup {
--     on_attach = on_attach,
--     flags = lsp_flags,
--     capabilities = capabilities,
-- }

-- lspconfig.bashls.setup {
--     on_attach = on_attach,
--     flags = lsp_flags,
--     capabilities = capabilities,
-- }

-- lspconfig.jqls.setup {
--     on_attach = on_attach,
--     flags = lsp_flags,
--     capabilities = capabilities,
-- }

-- lspconfig.sqlls.setup {
--     on_attach = on_attach,
--     flags = lsp_flags,
--     capabilities = capabilities,
-- }

-- lspconfig.volar.setup {
--     on_attach = on_attach,
--     flags = lsp_flags,
--     capabilities = capabilities,
-- }
