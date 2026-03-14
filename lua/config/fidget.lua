local fid = require("fidget")

local config = {}
config.notification = {
	override_vim_notify = true,
}
config.notification.view = {
	stack_upwards = false,
}

config.notification.window = {
	normal_hl = "DiagnosticInfo",
	align = "top",
	border = "rounded"
}

fid.setup(config)
