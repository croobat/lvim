reload("impatient")

--  ┌──────┐
--  │ Core │
--  └──────┘
reload("tony.options")
reload("tony.keymaps")
reload("tony.autocommands")
reload("tony.lsp")

--  ┌──────────────┐
--  │ Lvim builtin │
--  └──────────────┘
lvim.log.level = "info"
lvim.format_on_save = { enabled = false, pattern = "*.lua", timeout = 1000 }

-- Theme
lvim.colorscheme = "tokyonight"
require("tokyonight").setup({
	style = "night",
	on_colors = function(colors)
		colors.comment = "#727eb5"
	end,
})

-- Alpha
lvim.builtin.alpha.active = false

-- Autopairs

-- Breadcrumbs

-- Bufferline
lvim.builtin.bufferline.options.show_buffer_close_icons = false
lvim.builtin.bufferline.options.show_close_icon = false
lvim.builtin.bufferline.options.diagnostics = ""

-- Cmp
local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
	mapping = cmp.mapping.preset.insert({
		["<C-l>"] = cmp.mapping(cmp.mapping.confirm({ select = false }), { "i", "c" }),

		["<C-j>"] = cmp.mapping(function()
			if luasnip.jumpable(1) then
				luasnip.jump(1)
			end
		end, { "i", "s" }),

		["<C-k>"] = cmp.mapping(function()
			if luasnip.jumpable(-1) then
				luasnip.jump(-1)
			end
		end, { "i", "s" }),
	}),
})

-- Comment
vim.api.nvim_set_keymap("n", "<C-_>", "gcc", {})
vim.api.nvim_set_keymap("v", "<C-_>", "gc", {})

-- DAP

-- Gitsigns
lvim.builtin.gitsigns.opts.signs.add.text = "█"
lvim.builtin.gitsigns.opts.signs.change.text = "█"
lvim.builtin.gitsigns.opts.signs.changedelete.text = "█"
lvim.builtin.gitsigns.opts.signs.delete.text = "█"
lvim.builtin.gitsigns.opts.signs.topdelete.text = "█"
lvim.builtin.gitsigns.opts.current_line_blame_opts.delay = 100

-- Illuminate

-- Indentlines
lvim.builtin.indentlines.options.show_trailing_blankline_indent = false
vim.g.indent_blankline_max_indent_increase = 2

-- Lir

-- Lualine
lvim.builtin.lualine.style = "lvim"

-- Mason

-- Nvim-tree
lvim.builtin.nvimtree.setup.hijack_cursor = true
lvim.builtin.nvimtree.setup.view.adaptive_size = true
lvim.builtin.nvimtree.setup.view.adaptive_size = true
lvim.builtin.nvimtree.setup.actions.open_file.quit_on_open = true
lvim.builtin.nvimtree.setup.disable_netrw = true
lvim.builtin.nvimtree.setup.renderer.icons.glyphs.git.unstaged = ""
lvim.builtin.nvimtree.setup.renderer.icons.glyphs.git.staged = "S"
lvim.builtin.nvimtree.setup.renderer.icons.glyphs.git.untracked = "U"
lvim.builtin.nvimtree.setup.renderer.icons.glyphs.git.deleted = ""
lvim.builtin.nvimtree.setup.renderer.icons.glyphs.git.ignored = "◌"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
lvim.builtin.nvimtree.setup.diagnostics.icons.hint = "i"
lvim.builtin.nvimtree.setup.diagnostics.icons.info = "?"
lvim.builtin.nvimtree.setup.diagnostics.icons.warning = "w"
lvim.builtin.nvimtree.setup.diagnostics.icons.error = "x"

-- Project

-- Telescope
lvim.builtin.telescope.theme = "center"
lvim.builtin.telescope.defaults.prompt_prefix = "$ "
lvim.builtin.telescope.defaults.selection_caret = "> "

-- Terminal

-- Treesitter
lvim.builtin.treesitter.ensure_installed = "all"
lvim.builtin.treesitter.autotag.enable = true
lvim.builtin.treesitter.rainbow.enable = true
lvim.builtin.treesitter.rainbow.colors = { "#bb9af7", "#e0af68", "#2ac3de", "#9ece6a", "#f7768e" }

-- Whichkey
reload("tony.plugin.whichkey")

--  ┌──────────────────┐
--  │ External Plugins │
--  └──────────────────┘
lvim.plugins = { -- {{{
	{ "lewis6991/impatient.nvim" },

	-- Treesitter
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
	-- { "JoosepAlviste/nvim-ts-context-commentstring", event = "BufRead" },
	{ "p00f/nvim-ts-rainbow" },
	{
		"romgrk/nvim-treesitter-context",
		config = function()
			require("treesitter-context").setup({
				enable = true,
				throttle = true,
				max_lines = 0,
				patterns = { default = { "class", "function", "method" } },
			})
		end,
	},
	{ "nvim-treesitter/playground", event = "BufRead" },

	-- Syntax
	{ "NMAC427/guess-indent.nvim", config = "require('guess-indent').setup{}" },
	{ "neoclide/vim-jsx-improve", ft = { "javascript", "javascriptreact" } },
	{ "joshua7v/vim-tsx-improve", ft = { "typescript", "typescriptreact" } },

	-- Git
	{ "sindrets/diffview.nvim", event = "BufRead" },
	{
		"tpope/vim-fugitive",
		cmd = {
			"G",
			"Git",
			"Gdiffsplit",
			"Gread",
			"Gwrite",
			"Ggrep",
			"GMove",
			"GDelete",
			"GBrowse",
			"GRemove",
			"GRename",
			"Glgrep",
			"Gedit",
		},
		ft = { "fugitive" },
	},

	-- Debug
	{ "folke/trouble.nvim", cmd = "TroubleToggle" },
	{ "mxsdev/nvim-dap-vscode-js", dependencies = { "mfussenegger/nvim-dap" } },

	-- C
	{ "p00f/clangd_extensions.nvim" },

	-- Latex
	{ "lervag/vimtex" },
	{ "kdheepak/cmp-latex-symbols" },
	{ "KeitaNakamura/tex-conceal.vim" },
	{ "SirVer/ultisnips" },

	-- Python
	"AckslD/swenv.nvim",
	"mfussenegger/nvim-dap-python",
	{
		"danymat/neogen",
		config = function()
			require("neogen").setup({
				enabled = true,
				languages = { python = { template = { annotation_convention = "numpydoc" } } },
			})
		end,
	},
	{ "dccsillag/magma-nvim", build = ":UpdateRemotePlugins" },

	-- Rust
	"simrat39/rust-tools.nvim",
	{
		"saecki/crates.nvim",
		version = "v0.3.0",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("crates").setup({
				null_ls = { enabled = true, name = "crates.nvim" },
				popup = { border = "rounded" },
			})
		end,
	},
	{
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup()
		end,
	},

	-- Visuals
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({ "css", "scss", "html", "javascript" }, {
				RGB = true,
				RRGGBB = true,
				RRGGBBAA = true,
				rgb_fn = true,
				hsl_fn = true,
				css = true,
				css_fn = true,
			})
		end,
	},

	-- Preview files
	{ "npxbr/glow.nvim", ft = { "markdown" } },
	{
		"turbio/bracey.vim",
		cmd = { "Bracey", "BracyStop", "BraceyReload", "BraceyEval" },
		build = "npm install --prefix server",
	},

	-- Vanilla
	{ "tpope/vim-repeat" },
	{ "tpope/vim-surround" },
	{ "felipec/vim-sanegx", event = "BufRead" },
	{ "wellle/targets.vim" },

	-- Misc
	{
		"folke/todo-comments.nvim",
		event = "BufRead",
		config = function()
			require("todo-comments").setup()
		end,
	},
	{ "LudoPinelli/comment-box.nvim" },
	{ "vimwiki/vimwiki", ft = { "vimwiki", "markdown" } },
	{ "folke/zen-mode.nvim", cmd = { "ZenMode" } },
	{ "lambdalisue/suda.vim", lazy = false },
} -- }}}

reload("tony.plugin.commentbox")
