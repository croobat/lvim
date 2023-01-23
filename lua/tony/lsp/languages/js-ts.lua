-- Setup lsp.
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "tsserver" })

local capabilities = require("lvim.lsp").common_capabilities()

require("lvim.lsp.manager").setup("tsserver", {
	-- require("typescript").setup {
	-- disable_commands = false, -- prevent the plugin from creating Vim commands
	debug = false, -- enable debug logging for commands
	go_to_source_definition = {
		fallback = true, -- fall back to standard LSP definition on failure
	},
	server = { -- pass options to lspconfig's setup method
		on_attach = require("lvim.lsp").common_on_attach,
		on_init = require("lvim.lsp").common_on_init,
		capabilities = capabilities,
		init_options = {
			html = {
				options = {
					-- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
					["bem.enabled"] = true,
					["output.format"] = true,
				},
			},
		},
		settings = {
			typescript = {
				inlayHints = {
					includeInlayEnumMemberValueHints = true,
					includeInlayFunctionLikeReturnTypeHints = true,
					includeInlayFunctionParameterTypeHints = false,
					includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
					includeInlayParameterNameHintsWhenArgumentMatchesName = true,
					includeInlayPropertyDeclarationTypeHints = true,
					includeInlayVariableTypeHints = true,
				},
			},
		},
	},
})

-- Set a formatter.
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{
		command = "prettier",
		extra_args = { "--tab-width", "4" },
		filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact", "css" },
	},
})

local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/")

-- require("dap-vscode-js").setup {
--     -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
--     debugger_path = mason_path .. "packages/js-debug-adapter", -- Path to vscode-js-debug installation.
--     -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
--     adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
-- }

-- for _, language in ipairs { "typescript", "javascript" } do
--     require("dap").configurations[language] = {
--         {
--             type = "pwa-node",
--             request = "launch",
--             name = "Debug Jest Tests",
--             -- trace = true, -- include debugger info
--             runtimeExecutable = "node",
--             runtimeArgs = {
--                 "./node_modules/jest/bin/jest.js",
--                 "--runInBand",
--             },
--             rootPath = "${workspaceFolder}",
--             cwd = "${workspaceFolder}",
--             console = "integratedTerminal",
--             internalConsoleOptions = "neverOpen",
--         },
--     }
-- end

-- setup adapters
require("dap-vscode-js").setup({
	debugger_path = vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter",
	debugger_cmd = { "js-debug-adapter" },
	adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
})

local dap = require("dap")

-- custom adapter for running tasks before starting debug
local custom_adapter = "pwa-node-custom"
dap.adapters[custom_adapter] = function(cb, config)
	if config.preLaunchTask then
		local async = require("plenary.async")
		local notify = require("notify").async

		async.run(function()
			---@diagnostic disable-next-line: missing-parameter
			notify("Running [" .. config.preLaunchTask .. "]").events.close()
		end, function()
			vim.fn.system(config.preLaunchTask)
			config.type = "pwa-node"
			dap.run(config)
		end)
	end
end

-- language config
for _, language in ipairs({ "typescript", "javascript" }) do
	dap.configurations[language] = {
		{
			name = "Launch",
			type = "pwa-node",
			request = "launch",
			program = "${file}",
			rootPath = "${workspaceFolder}",
			cwd = "${workspaceFolder}",
			sourceMaps = true,
			skipFiles = { "<node_internals>/**" },
			protocol = "inspector",
			console = "integratedTerminal",
		},
		-- {
		--     name = 'Attach to node process',
		--     type = 'pwa-node',
		--     request = 'attach',
		--     rootPath = '${workspaceFolder}',
		--     processId = require('dap.utils').pick_process,
		-- },
		-- {
		--     name = 'Debug Main Process (Electron)',
		--     type = 'pwa-node',
		--     request = 'launch',
		--     program = '${workspaceFolder}/node_modules/.bin/electron',
		--     args = {
		--         '${workspaceFolder}/dist/index.js',
		--     },
		--     outFiles = {
		--         '${workspaceFolder}/dist/*.js',
		--     },
		--     resolveSourceMapLocations = {
		--         '${workspaceFolder}/dist/**/*.js',
		--         '${workspaceFolder}/dist/*.js',
		--     },
		--     rootPath = '${workspaceFolder}',
		--     cwd = '${workspaceFolder}',
		--     sourceMaps = true,
		--     skipFiles = { '<node_internals>/**' },
		--     protocol = 'inspector',
		--     console = 'integratedTerminal',
		-- },
		-- {
		--     name = 'Compile & Debug Main Process (Electron)',
		--     type = custom_adapter,
		--     request = 'launch',
		--     preLaunchTask = 'npm run build-ts',
		--     program = '${workspaceFolder}/node_modules/.bin/electron',
		--     args = {
		--         '${workspaceFolder}/dist/index.js',
		--     },
		--     outFiles = {
		--         '${workspaceFolder}/dist/*.js',
		--     },
		--     resolveSourceMapLocations = {
		--         '${workspaceFolder}/dist/**/*.js',
		--         '${workspaceFolder}/dist/*.js',
		--     },
		--     rootPath = '${workspaceFolder}',
		--     cwd = '${workspaceFolder}',
		--     sourceMaps = true,
		--     skipFiles = { '<node_internals>/**' },
		--     protocol = 'inspector',
		--     console = 'integratedTerminal',
		-- },
	}
end

-- Set a linter.
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
	{ command = "eslint", filetypes = { "javascript", "typescript" } },
})
