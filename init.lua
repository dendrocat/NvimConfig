-- Lazy
require("config.lazy")

--- Theme
require("config.theme")

--- Plugins
require("config.cmp")
require("config.lsp")
require("config.keys")
require("config.telescope")
require("config.lualine")

--- Tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.smartindent = true

-- number
vim.opt.number = true
vim.opt.relativenumber = true

--- Open tree
require("config.tree")
