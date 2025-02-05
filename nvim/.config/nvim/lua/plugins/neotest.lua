return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/neotest-jest",
		{
			"fredrikaverpil/neotest-golang",
			dependencies = {
				{
					"leoluz/nvim-dap-go",
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
				},
			},
		},
	},
	opts = {
		adapters = {
			"neotest-jest",
			["neotest-golang"] = {
				-- Here we can set options for neotest-golang, e.g.
				-- go_test_args = { "-v", "-race", "-count=1", "-timeout=60s" },
				go_test_args = { "-tags=integration" },
				go_list_args = { "-tags=integration" },
				dap_go_opts = {
					delve = {
						build_flags = { "-tags=integration" },
					},
				},
				runner = "gotestsum",
			},
		},
		discovery = {
			-- Drastically improve performance in ginormous projects by
			-- only AST-parsing the currently opened buffer.
			enabled = false,
			-- Number of workers to parse files concurrently.
			-- A value of 0 automatically assigns number based on CPU.
			-- Set to 1 if experiencing lag.
			concurrent = 1,
		},
	},
}
