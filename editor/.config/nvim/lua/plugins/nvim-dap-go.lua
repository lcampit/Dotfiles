return {
	"leoluz/nvim-dap-go",
	dependencies = {
		"mfussenegger/nvim-dap",
	},
	dap_configurations = {
		{
			type = "go",
			name = "Debug (Build Flags & Arguments)",
			request = "launch",
			program = "${file}",
			args = require("dap-go").get_arguments,
			buildFlags = require("dap-go").get_build_flags,
		},
	},
	opts = {
		delve = {
			args = {
				"--check-go-version=false",
			},
			build_flags = {
				"-tags=integration",
			},
		},
	},
}
