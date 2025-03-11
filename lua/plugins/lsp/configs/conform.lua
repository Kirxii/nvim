local formatters_by_ft = {
  lua = { "stylua" },
  css = { "prettier" },
  flow = { "prettier" },
  graphql = { "prettier" },
  html = { "prettier" },
  json = { "prettier" },
  javascript = { "biome" },
  javascriptreact = { "biome" },
  less = { "prettier" },
  markdown = { "prettier" },
  scss = { "prettier" },
  typescript = { "biome" },
  typescriptreact = { "biome" },
}

local prettier_ft = {
  "css",
  "flow",
  "graphql",
  "html",
  "json",
  "less",
  "markdown",
  "scss",
  "vue",
}

for _, filetype in pairs(prettier_ft) do
  formatters_by_ft[filetype] = { "prettier" }
end

return {
  "stevearc/conform.nvim",
  enabled = false,
  -- event = { "BufReadPost", "BufNewFile" },
  opts = {
    formatters_by_ft = formatters_by_ft,
    format_on_save = {
      quiet = true,
      timeout_ms = 100000,
      lsp_fallback = true,
    },
  },
}
