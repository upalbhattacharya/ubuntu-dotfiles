require("mason").setup()
require("mason-lspconfig").setup()

local trouble = require("trouble")
local neogen = require("neogen")

-- LspConfig
require("lspconfig").lua_ls.setup({})
require("lspconfig").pylsp.setup({})
require("lspconfig").tsserver.setup({})

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
		javascript = { "prettier" },
		typescript = { "prettier" },
		markdown = { "prettier" },
		yaml = { "prettier" },
	},
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_fallback = true,
	},
})
require("lint").linters_by_ft = {
	python = { "pflake8" },
}

neogen.setup({
	languages = {
		python = {
			template = {
				annotation_convention = "numpydoc",
				position = "after",
			},
		},
	},
})

trouble.setup({
	mode = "document_diagnostics",
})
