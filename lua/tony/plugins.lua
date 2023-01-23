lvim.plugins = {
    { "lewis6991/impatient.nvim" },
    -- Syntax
    { "windwp/nvim-ts-autotag", config = function() require("nvim-ts-autotag").setup() end, },
    { "JoosepAlviste/nvim-ts-context-commentstring", event = "BufRead", },
    { "p00f/nvim-ts-rainbow", },
    { "romgrk/nvim-treesitter-context",
        config = function() require("treesitter-context").setup {
                enable = true,
                throttle = true,
                max_lines = 0,
                patterns = { default = { 'class', 'function', 'method', }, },
            }
        end
    },
    { "NMAC427/guess-indent.nvim", config = "require('guess-indent').setup{}", },
    { "neoclide/vim-jsx-improve", ft = { 'javascript', 'javascriptreact' } },
    { "joshua7v/vim-tsx-improve", ft = { 'typescript', 'typescriptreact' } },

    -- Git
    { "sindrets/diffview.nvim", event = "BufRead", },
    { "tpope/vim-fugitive",
        cmd = {
            "G", "Git", "Gdiffsplit", "Gread", "Gwrite", "Ggrep", "GMove",
            "GDelete", "GBrowse", "GRemove", "GRename", "Glgrep", "Gedit"
        },
        ft = { "fugitive" }
    },

    -- Debug
    { "folke/trouble.nvim", cmd = "TroubleToggle", },
    { "mxsdev/nvim-dap-vscode-js", dependencies = { "mfussenegger/nvim-dap" } },

    -- Visuals
    { "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup({ "css", "scss", "html", "javascript" }, {
                RGB = true, RRGGBB = true, RRGGBBAA = true, rgb_fn = true,
                hsl_fn = true, css = true, css_fn = true,
            })
        end, },

    -- Preview files
    { "npxbr/glow.nvim", ft = { "markdown" } },
    { "turbio/bracey.vim", cmd = { "Bracey", "BracyStop", "BraceyReload", "BraceyEval" },
        build = "npm install --prefix server", },

    -- Vanilla
    { "tpope/vim-repeat" },
    { "tpope/vim-surround", },
    { "felipec/vim-sanegx", event = "BufRead", },
    { "wellle/targets.vim" },

    -- Misc
    { "folke/todo-comments.nvim", event = "BufRead", config = function() require("todo-comments").setup() end, },
    { "LudoPinelli/comment-box.nvim", config = "require 'plugins.comment-box'" },
    { "vimwiki/vimwiki", config = "require 'plugins.vimwiki'", ft = { 'vimwiki', 'markdown' } },
    { "folke/zen-mode.nvim", cmd = { 'ZenMode' } },
}
