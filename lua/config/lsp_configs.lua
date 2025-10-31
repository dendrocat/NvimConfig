local config = {}
config.clangd = {}
config.pyright = {}

config.lua_ls = {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			runtime = {
				version = "LuaJIT",
				path = vim.split(package.path, ';'),
			},
			workspace = {
				library = {
					[vim.fn.expand('$VIMRUNTIME/lua')] = true,
					[vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
					[vim.fn.stdpath('config') .. '/lua'] = true,
				},
				checkThirdParty = false,
			},
			telemetry = {
				enable = false,
			},
		}
	}
}

config.omnisharp = {
	cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
	settings = {
		FormattingOptions = {
			EnableEditorConfigSupport = false,
			OrganizeImports = true,
		},
		Sdk = {
			IncludePrereleases = true,
		},
	},
}

return config
