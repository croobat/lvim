require("tony.lsp.languages.c")
require("tony.lsp.languages.css")
require("tony.lsp.languages.emmet")
require("tony.lsp.languages.go")
require("tony.lsp.languages.js-ts")
require("tony.lsp.languages.latex")
require("tony.lsp.languages.php")
require("tony.lsp.languages.python")
require("tony.lsp.languages.rust")
require("tony.lsp.languages.sh")

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

-- ---configure a server manually. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---see the full default list `:lua =lvim.lsp.automatic_configuration.skipped_servers`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "jdtls" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- Set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
lvim.lsp.on_attach_callback = function(client, bufnr)
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	-- local lsp_flags = { debounce_text_changes = 150, }

	-- buffer mappings
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)

	-- Set autocommands conditional on server_capabilities
	if client.server_capabilities.document_highlight then
		vim.api.nvim_exec(
			[[
                augroup lsp_document_highlight
                autocmd! * <buffer>
                autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
                augroup END
            ]],
			false
		)
	end

	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
end

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{ command = "google_java_format", filetypes = { "java" } },
	{ command = "stylua", filetypes = { "lua" } },
})
