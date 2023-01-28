-- Treesitter
lvim.builtin.treesitter.ensure_installed = { "python" }

-- LSP
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
local capabilities = require("lvim.lsp").common_capabilities()

require("lvim.lsp.manager").setup("pyright", {
	settings = {
		python = {
			analysis = {
				typeCheckingMode = "off",
			},
		},
	},
})

-- Formatters
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{ command = "black", filetypes = { "python" } },
})

-- Linters
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
	{ command = "flake8", filetypes = { "python" } },
})

-- DAP
local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/")
pcall(function()
	require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python")
end)

-- Magma Setup

-- Image options. Other options:
-- 1. none:     Don't show images.
-- 2. ueberzug: use Ueberzug to display images.
-- 3. kitty:    use the Kitty protocol to display images.
vim.g.magma_image_provider = "ueberzug"

-- If this is set to true, then whenever you have an active cell its output
-- window will be automatically shown.
vim.g.magma_automatically_open_output = true

-- If this is true, then text output in the output window will be wrapped.
vim.g.magma_wrap_output = false

-- If this is true, then the output window will have rounded borders.
vim.g.magma_output_window_borders = false

-- The highlight group to be used for highlighting cells.
vim.g.magma_cell_highlight_group = "CursorLine"

-- Where to save/load with :MagmaSave and :MagmaLoad.
-- The generated file is placed in this directory, with the filename itself
-- being the buffer's name, with % replaced by %% and / replaced by %, and
-- postfixed with the extension .json.
vim.g.magma_save_path = vim.fn.stdpath("data") .. "/magma"
