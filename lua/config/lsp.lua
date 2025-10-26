local function safe_require(modname)
	local ok, result = pcall(require, modname)
	if ok then return result else return {} end
end

local function on_attach(_, bufnr)
	local opts = { buffer = bufnr }
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
end

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local configs = { 'clangd', 'pyright', 'lua_ls', 'omnisharp' }
for _, i in ipairs(configs) do
	local config = safe_require('config.lsp_configs.' .. i)
	-- print("Setup config " .. i)
	-- print(config)
	config.on_attach = on_attach
	config.capabilities = capabilities

	vim.lsp.config(i, config)
	vim.lsp.enable(i)
	--	require("lspconfig")[i].setup({
	--		on_attach = on_attach,
	--	 	capabilities = capabilities
	--	})
end
