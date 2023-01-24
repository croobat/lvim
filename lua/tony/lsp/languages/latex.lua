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

-- CMP
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("LaTeXGroup", { clear = true }),
	pattern = "tex",
	callback = function()
		local luasnip = require("luasnip")
		lvim.builtin.cmp.snippet.expand = function(args)
			luasnip.lsp_expand(args.body)
		end
		lvim.builtin.cmp.mapping["<C-J>"] = function()
			if luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			end
		end
		lvim.builtin.cmp.mapping["<C-K>"] = function()
			if luasnip.jumpable(-1) then
				luasnip.jump(-1)
			end
		end
	end,
})

-- Vimtex
vim.g.vimtex_view_method = "zathura"
vim.g.vimtex_quickfix_enabled = 0
