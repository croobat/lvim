-- Formatter
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{
		command = "shfmt",
		extra_args = { "--indent", "2" },
		filetypes = { "sh", "zsh", "bash" },
	},
})

-- Linter
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
	command = "shellcheck",
	extra_args = { "--severity", "warning" },
	filetypes = { "sh", "zsh", "bash" },
})

vim.filetype.add({
	extension = {
		zsh = "zsh",
	},
})

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "bashls" })

local lsp_manager = require("lvim.lsp.manager")
lsp_manager.setup("bashls", {
	filetypes = { "sh", "zsh" },
	on_init = require("lvim.lsp").common_on_init,
	capabilities = require("lvim.lsp").common_capabilities(),
})
