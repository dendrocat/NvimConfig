-- Plugins
require("config.lazy")
require("config.cmp")
require("config.lsp")
require("config.keys")
require("config.tree")
require("config.telescope")

--- Tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.smartindent = true


--- Open tree
vim.cmd [[NvimTreeOpen]]

--- Default theme
vim.cmd [[colorscheme nightfox]]
