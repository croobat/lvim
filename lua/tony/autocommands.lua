lvim.autocommands = {
	-- Set window title
	{
		"BufEnter",
		{
			callback = function()
				local get_project_dir = function()
					local cwd = vim.fn.getcwd()
					local project_dir = vim.split(cwd, "/")
					local project_name = project_dir[#project_dir]
					return project_name
				end

				vim.opt.titlestring = get_project_dir() .. " - nvim"
			end,
		},
	},

	-- Auto close nvim-tree if only buffer
	{
		"BufEnter",
		{
			nested = true,
			callback = function()
				if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
					vim.cmd("quit")
				end
			end,
		},
	},

	-- Disable auto-comment new line
	{
		"BufWinEnter",
		{
			callback = function()
				vim.cmd("checktime")
				vim.cmd("set formatoptions-=cro")
			end,
		},
	},

	-- Change illuminated word color
	{
		"VimEnter",
		{
			callback = function()
				vim.cmd("hi link illuminatedWord LspReferenceText")
			end,
		},
	},

	-- Auto resizing window
	{
		"VimResized",
		{
			callback = function()
				vim.cmd("tabdo wincmd =")
			end,
		},
	},

	-- Change tab size to 2
	{
		"Filetype",
		{
			pattern = {
				"javascript",
				"vue",
				"json",
				"sh",
				"zsh",
			},
			callback = function()
				vim.opt_local.tabstop = 2
				vim.opt_local.shiftwidth = 2
			end,
		},
	},

	-- Change tabs to spaces
	{
		"Filetype",
		{
			pattern = {
				"javascript",
				"vue",
				"json",
				"sh",
			},
			callback = function()
				vim.opt_local.expandtab = true
			end,
		},
	},

	-- Close help pages with q
	{
		"Filetype",
		{
			pattern = {
				"Jaq",
				"qf",
				"help",
				"man",
				"lspinfo",
				"spectre_panel",
				"lir",
				"DressingSelect",
				"tsplayground",
				"Markdown",
			},
			callback = function()
				vim.cmd([[
				nnoremap <silent> <buffer> q :close<CR> 
				nnoremap <silent> <buffer> <esc> :close<CR> 
				set nobuflisted ]])
			end,
		},
	},

	-- Enable wrap and spelling
	{
		"Filetype",
		{
			pattern = { "gitcommit", "markdown", "NeogitCommitMessage" },
			callback = function()
				vim.opt_local.wrap = true
				vim.opt_local.spell = true
			end,
		},
	},

	-- Disable linenumber on textfiles
	{
		"Filetype",
		{
			pattern = { "text" },
			callback = function()
				vim.opt_local.number = false
			end,
		},
	},

	-- Disable foldmethod for diff files
	{
		"Filetype",
		{
			pattern = { "diff", "gitcommit" },
			callback = function()
				vim.opt_local.number = false
				vim.opt_local.foldmethod = "diff"
				vim.opt.listchars = { tab = "  " }
				vim.cmd("IndentBlanklineDisable")
				vim.cmd("hi DiffAdd guifg=#449dab guibg=NONE")
				vim.cmd("hi DiffDelete guifg=#914c54 guibg=NONE")
				vim.cmd("hi DiffChange guifg=#6183bb guibg=NONE")
			end,
		},
	},

	-- Disable text-width
	{
		"Filetype",
		{
			pattern = { "csv, sql", "tmux", "crontab" },
			callback = function()
				vim.cmd("setlocal textwidth=0")
			end,
		},
	},

	-- Auto-close command window
	{
		"CmdWinEnter",
		{
			callback = function()
				vim.cmd("quit")
			end,
		},
	},

	-- Highlight yanked text
	{
		"TextYankPost",
		{
			callback = function()
				vim.highlight.on_yank({ higroup = "Visual", timeout = 300 })
			end,
		},
	},

	-- Unlink luasnippet on cursor hold
	{
		"CursorHold",
		{
			callback = function()
				local status_ok, luasnip = pcall(require, "luasnip")
				if not status_ok then
					return
				end
				if luasnip.expand_or_jumpable() then
					-- ask maintainer for option to make this silent
					-- luasnip.unlink_current()
					vim.cmd([[silent! lua require("luasnip").unlink_current()]])
				end
			end,
		},
	},
}
