-- Set options
local font = "Recursive Mono Linear Static:h8"
local bashcomp = "longest,full"

local options = {
	-- System
	backup = false, -- System backups
	swapfile = false, -- Swapfile for buffer files
	clipboard = "unnamedplus", -- System clipboard
	fileencoding = "utf-8", -- Encoding
	mouse = "a", -- Enable mouse
	undofile = true, -- Persistent undo upon exit
	writebackup = false, -- Backup while editing file

	-- Tabs
	expandtab = false, -- Turn tabs into spaces
	smarttab = true, -- Detect number of spaces per tab
	tabstop = 4, -- Number of spaces a tab counts for
	softtabstop = 4, -- Number of spaces a tab counts for (editing)
	shiftwidth = 4, -- Number of spaces per auto indent

	-- Indentation
	smartindent = true, -- Sensible indenting
	autoindent = true, -- Tab when jump from indented line
	lisp = false, -- Indent when line breaks
	foldmethod = "marker", -- Folding with {{{}}}

	-- Interface
	cmdheight = 1, -- Space to show cmd messages
	pumheight = 10, -- Pop-up menu height
	showtabline = 1, -- Show tabs if >=2
	splitbelow = true, -- Horizontal splits go below window
	splitright = true, -- Vertical splits go to the right of window
	textwidth = 79, -- Character column limit
	wrap = false, -- Start with text wrapped
	scrolloff = 8, -- Min distance from top-down borders
	sidescrolloff = 0, -- Min distance from left-right borders

	-- Left column
	number = true, -- Numbered lines
	relativenumber = false, -- Numbered line relative to cursor
	numberwidth = 2, -- Column width
	signcolumn = "yes", -- When to show sign columns

	-- Visuals
	showbreak = " .. ", -- Shown when line breaks
	guifont = font, -- Font in graphical applications
	conceallevel = 0, -- Don't hide special text (ie json "")
	showmode = false, -- -- INSERT --
	termguicolors = true, -- 24-bit RGB color
	cursorline = true, -- Highlight current line
	list = true, -- Enable listchars

	-- Search
	hlsearch = false, -- Highlighting
	ignorecase = true, -- Case insensitive patterns
	smartcase = true, -- Case sensitive only if there are caps

	-- Completion
	completeopt = {
		"menuone", -- Show completion menu despite only one result
		"noselect", -- Don't auto select completion result
	},
	timeoutlen = 300, -- ms to wait for mapped sequence
	updatetime = 300, -- Faster completion
	wildmode = bashcomp, -- Tab completion behaviour
	stal = 2, -- Bug bufferline closes when saving
	spell = false, -- Spelling check
	spelllang = "en,es", -- Spelling check language
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

-- Append options
vim.opt.shm:append("Ic") -- Disable start screen and certain warnings

-- Vim commands
-- Special chars for nbsp, tab and trailing space
vim.opt.listchars = { tab = "▎ ", trail = "·", precedes = "<", extends = ">", nbsp = "○" }

-- Keys that move to next wrapped line
vim.cmd("set whichwrap+=<,>,[,],h,l")

-- Recursive finds
vim.cmd("set path+=**")

-- New word delimitators
-- vim.cmd("set iskeyword+=^-,^_")
