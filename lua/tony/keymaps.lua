local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap

lvim.leader = "space"

--## Disable mappings ##
-- Better scrolling
keymap("n", "<C-j>", "5gj", opts)
keymap("n", "<C-k>", "5gk", opts)
keymap("n", "<C-h>", "5h", opts)
keymap("n", "<C-l>", "5l", opts)

-- keymap("v", "<C-j>", "5gj", opts)
-- keymap("v", "<C-k>", "5gk", opts)
-- keymap("v", "<C-h>", "5h", opts)
-- keymap("v", "<C-l>", "5l", opts)

keymap("x", "<C-j>", "5gj", opts)
keymap("x", "<C-k>", "5gk", opts)
keymap("x", "<C-h>", "3h", opts)
keymap("x", "<C-l>", "3l", opts)

keymap("n", "j", "gj", opts)
keymap("n", "k", "gk", opts)
keymap("v", "j", "gj", opts)
keymap("v", "k", "gk", opts)

--Quickfix
keymap("n", "<C-n>", ":cnext<CR>", opts)
keymap("n", "<C-p>", ":cprevious<CR>", opts)
keymap("n", "<C-q>", ":copen<CR>", opts)
keymap("n", "<C-A-q>", ":cclose<CR>", opts)

-- Better window navigation
keymap("n", "<A-h>", "<C-w>h", opts)
keymap("n", "<A-j>", "<C-w>j", opts)
keymap("n", "<A-k>", "<C-w>k", opts)
keymap("n", "<A-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Folding
keymap("n", ",", "za", opts)

-- Insert things
-- Line
keymap("n", "<enter>", "o<esc>", opts)
keymap("n", "<A-enter>", "i<CR><esc>", opts)

-- Word Wrap
keymap("n", "<A-z>", ":set wrap!<CR>", opts)

-- Better pasting
keymap("n", "<A-p>", "pg;h", opts)

--## Insert ##
-- Better insert navigation
keymap("i", "<A-l>", "<ESC>la", opts)
keymap("i", "<A-h>", "<ESC>i", opts)
keymap("i", "<A-j>", "<ESC>ja", opts)
keymap("i", "<A-k>", "<ESC>ka", opts)

-- Emacs like keys
keymap("i", "<C-a>", "<ESC>I", opts)
keymap("i", "<C-e>", "<ESC>A", opts)
keymap("i", "<M-f>", "<ESC><Space>Wi", opts)
keymap("i", "<M-b>", "<ESC>Bi", opts)
keymap("i", "<M-d>", "<ESC>ciw", opts)

--## Visual ##
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)

--## Visual Block ##
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

--## Terminal ##
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
