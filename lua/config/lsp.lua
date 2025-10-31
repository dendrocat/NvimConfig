local function on_attach(_, bufnr)
	local opts = { buffer = bufnr }
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
end

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local configs = require("config.lsp_configs")
for lsp, config in pairs(configs) do
	config.on_attach = on_attach
	config.capabilities = capabilities

	vim.lsp.config(lsp, config)
	vim.lsp.enable(lsp)
end
