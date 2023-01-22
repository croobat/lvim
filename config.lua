reload "impatient"

--  ┌──────┐
--  │ Core │
--  └──────┘
reload "tony.plugins"
reload "tony.options"
reload "tony.keymaps"
reload "tony.autocommands"
reload "tony.lsp"

--  ┌───────────────┐
--  │ Extra plugins │
--  └───────────────┘
reload "tony.plugin.whichkey"
reload "tony.plugin.commentbox"
reload "tony.plugin.vimwiki"

--  ┌───────┐
--  │ Theme │
--  └───────┘
-- lvim.colorscheme = "tokyonight"
require("tokyonight").setup({
    style = "night",
    on_colors = function(colors) colors.comment = "#626c9c" end,
})

--  ┌──────────────┐
--  │ Lvim builtin │
--  └──────────────┘
lvim.log.level = "info"
lvim.format_on_save = { enabled = false, pattern = "*.lua", timeout = 1000, }

-- Alpha
lvim.builtin.alpha.active = false

-- Autopairs

-- Breadcrumbs

-- Bufferline
lvim.builtin.bufferline.options.show_buffer_close_icons = false
lvim.builtin.bufferline.options.show_close_icon = false
lvim.builtin.bufferline.options.diagnostics = ""

-- Cmp
local luasnip = require("luasnip")
lvim.builtin.cmp.snippet.expand = function(args) luasnip.lsp_expand(args.body) end
lvim.builtin.cmp.mapping["<C-J>"] = function()
    if luasnip.expand_or_jumpable() then luasnip.expand_or_jump() end
end
lvim.builtin.cmp.mapping["<C-K>"] = function()
    if luasnip.jumpable(-1) then luasnip.jump(-1) end
end

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
lvim.builtin.treesitter.rainbow.colors = { '#bb9af7', '#e0af68', '#2ac3de', '#9ece6a', '#f7768e' }
