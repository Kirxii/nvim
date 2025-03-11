return {
  "neovim/nvim-lspconfig",
	dependencies = {
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
	},

  event = { "BufReadPost", "BufNewFile" },
  cmd = { "LspInfo", "LspInstall", "LspUninstall" },

  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
		local clangd = require("plugins.lsp.settings.clangd")

		require("lspconfig")["clangd"].setup(clangd)
  end,
}
