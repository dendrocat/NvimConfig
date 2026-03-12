local config = {}

config.clangd = {
	init_options = {
		fallbackFlags = { "-std=c++23" },
	},
}

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
	cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()), "--project-synchronization-timeout=20" },
	settings = {
		FormattingOptions = {
			EnableEditorConfigSupport = false,
			OrganizeImports = true,
		},
		Sdk = {
			IncludePrereleases = true,
		},
		RoslynExtensionsOptions = {
			EnableAnalyzersSupport = false,
			EnableEditorConfigSupport = false,
			EnableDecompilationSupport = true,
			EnableImportCompletion = true,
		},
		OmniSharp = {
			EnableAsyncCompletion = true,
			EnableEditorVisualizerSupport = true,
			EnableRoslynAnalyzers = false,
		},
	},
}

return config
