return {
	"nvim-neotest/neotest",
	optional = true,
	dependencies = {
		"nvim-neotest/neotest-go",
		"nvim-neotest/nvim-nio",
		"rcasia/neotest-java",
		"nvim-neotest/neotest-jest",
	},
	opts = {
		adapters = {
			["neotest-go"] = {
				-- Here we can set options for neotest-go, e.g.
				args = { "-tags=integration" },
			},
			["neotest-java"] = {},
			["neotest-jest"] = {},
		},
	},
}
