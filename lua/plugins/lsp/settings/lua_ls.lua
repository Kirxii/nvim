local capabilities = require("cmp-nvim-lsp").default_capabilities()

return {
  capabilities = capabilities,
  settings = {
    Lua = {
      semantic = {
        enable = false,
      },
      hint = { enable = true },
      diagnostics = {
        globals = { "vim" },
        undefined_global = false,
        missing_parameters = false,
        -- disable = { "missing-parameters", "missing-fields" },
      },
      telemetry = { enable = false },
      workspace = {
        library = {
          vim.api.nvim_get_runtime_file("", true),
          vim.fn.stdpath("data") .. "/lazy/ui/nvchad_types",
        },
        checkThirdParty = false,
        maxPreload = 5000,
        preloadFileSize = 500,
        ignoreDir = {
          ".vscode",
          "**/nvim-data",
          "C:/Users/K/Appdata/**",
        },
      },
    },
  },
}
