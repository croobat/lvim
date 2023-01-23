-- Treesitter
lvim.builtin.treesitter.ensure_installed = {
	"php",
}

-- LSP
 local lsp_manager = require("lvim.lsp.manager")
lsp_manager.setup("intelephense")

-- Formatters
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{ command = "phpcsfixer", filetypes = { "php" } },
})

lvim.format_on_save = {
	pattern = { "*.php" },
}

-- Linters
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
	{
		command = "phpcs",
		args = { "--standard=/home/tony/.config/lvim/lua/tony/lsp/languages/phpcs.xml" },
		filetypes = { "php" },
	},
})

-- DAP
local dap = require("dap")
local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/")
dap.adapters.php = {
	type = "executable",
	command = "node",
	args = { mason_path .. "packages/php-debug-adapter/extension/out/phpDebug.js" },
}
dap.configurations.php = {
	{
		name = "Xdebug",
		type = "php",
		request = "launch",
		port = 9003,
	},
	{
		name = "Xdebug (Docker)",
		type = "php",
		request = "launch",
		port = 9003,
		pathMappings = {
			["/demo/"] = "${workspaceFolder}",
		},
	},
	{
		name = "Debug currently open script",
		type = "php",
		request = "launch",
		port = 9003,
		cwd = "${fileDirname}",
		program = "${file}",
		runtimeExecutable = "php74",
	},
}
