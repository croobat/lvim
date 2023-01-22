--Chris autocommands {{{
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  callback = function()
    vim.cmd "set formatoptions-=cro"
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
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
    vim.cmd [[
      nnoremap <silent> <buffer> q :close<CR> 
      nnoremap <silent> <buffer> <esc> :close<CR> 
      set nobuflisted 
    ]]
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "Jaq" },
  callback = function()
    vim.cmd [[
      nnoremap <silent> <buffer> <m-r> :close<CR>
      set nobuflisted 
    ]]
  end,
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = { "" },
  callback = function()
    local buf_ft = vim.bo.filetype
    if buf_ft == "" or buf_ft == nil then
      vim.cmd [[
      nnoremap <silent> <buffer> q :close<CR> 
      " nnoremap <silent> <buffer> <c-j> j<CR> 
      " nnoremap <silent> <buffer> <c-k> k<CR> 
      set nobuflisted 
    ]]
    end
  end,
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = { "" },
  callback = function()
    local get_project_dir = function()
      local cwd = vim.fn.getcwd()
      local project_dir = vim.split(cwd, "/")
      local project_name = project_dir[#project_dir]
      return project_name
    end

    vim.opt.titlestring = get_project_dir() .. " - nvim"
  end,
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = { "term://*" },
  callback = function()
    vim.cmd "startinsert!"
    -- TODO: if java = 2
    vim.cmd "set cmdheight=1"
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "NeogitCommitMessage" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
    vim.cmd "startinsert!"
  end,
})

vim.api.nvim_create_autocmd({ "VimResized" }, {
  callback = function()
    vim.cmd "tabdo wincmd ="
  end,
})

vim.api.nvim_create_autocmd({ "CmdWinEnter" }, {
  callback = function()
    vim.cmd "quit"
  end,
})

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  callback = function()
    vim.cmd "set formatoptions-=cro"
  end,
})

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 40 }
  end,
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function()
    vim.cmd "hi link illuminatedWord LspReferenceText"
  end,
})

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  pattern = { "*" },
  callback = function()
    vim.cmd "checktime"
  end,
})

vim.api.nvim_create_autocmd({ "CursorHold" }, {
  callback = function()
    local status_ok, luasnip = pcall(require, "luasnip")
    if not status_ok then
      return
    end
    if luasnip.expand_or_jumpable() then
      -- ask maintainer for option to make this silent
      -- luasnip.unlink_current()
      vim.cmd [[silent! lua require("luasnip").unlink_current()]]
    end
  end,
})
-- }}}

-- Old autocommands{{{
-- vim.cmd [[
--     augroup _general_settings
--         autocmd!
--         autocmd VimResized * tabdo wincmd =
--         autocmd BufEnter * set formatoptions-=o
--     augroup end

--     augroup _man_settings
--         autocmd!
--         autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR>
--         autocmd FileType qf set nobuflisted
--     augroup end

--     augroup _markdown
--         autocmd!
--     augroup end

--     augroup _vimwiki
--         autocmd!
--         autocmd Filetype vimwiki set textwidth=0
--     augroup end

--     augroup _tex
--         autocmd!
--     augroup end

--     augroup _csv
--         autocmd!
--         autocmd Filetype csv set textwidth=0
--     augroup end

--     augroup _txt
--         autocmd!
--         autocmd Filetype text set nonumber
--     augroup end

--     augroup _sql
--         autocmd!
--         autocmd Filetype csv set textwidth=0
--     augroup end

--     augroup _tmux
--         autocmd!
--         autocmd Filetype tmux set textwidth=0
--     augroup end

--     augroup _lua
--         autocmd!
--     augroup end

--     augroup _cron
--         autocmd!
--         autocmd Filetype crontab set textwidth=0
--     augroup end

-- ]] }}}

-- auto close nvim-tree if only buffer
vim.api.nvim_create_autocmd("BufEnter", {
    nested = true,
    callback = function()
        if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
            vim.cmd "quit"
        end
    end
})

lvim.autocommands = {
    -- {
    --     "BufEnter",
    --     {
    --         pattern = { "" },
    --         command = "source /home/tony/.config/lvim/lua/tony/plugin/cmp.lua",
    --     }
    -- },
}
