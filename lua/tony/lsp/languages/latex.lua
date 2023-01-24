-- Treesitter
lvim.builtin.treesitter.ensure_installed = { "latex" }

-- LSP
local capabilities = require("lvim.lsp").common_capabilities()
require("lvim.lsp.manager").setup("texlab", {
	on_attach = require("lvim.lsp").common_on_attach,
	on_init = require("lvim.lsp").common_on_init,
	capabilities = capabilities,
})

-- Formatters
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{ command = "latexindent", filetypes = { "tex" } },
})

-- Linters
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
	{ command = "chktex", filetypes = { "tex" } },
})

-- UltiSnip
vim.cmd([[
	let g:UltiSnipsExpandTrigger="<CR>"
	let g:UltiSnipsJumpForwardTrigger="<Plug>(ultisnips_jump_forward)"
	let g:UltiSnipsJumpBackwardTrigger="<Plug>(ultisnips_jump_backward)"
	let g:UltiSnipsListSnippets="<c-x><c-s>"
	let g:UltiSnipsRemoveSelectModeMappings=0
	let g:UltiSnipsEditSplit="tabdo"
	let g:UltiSnipsSnippetDirectories=[$HOME."/.config/nvim/UltiSnips"]
]])

-- Vimtex
vim.g.vimtex_view_method = "zathura"
vim.g.vimtex_quickfix_enabled = 0
