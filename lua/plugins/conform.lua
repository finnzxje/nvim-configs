return {
  "stevearc/conform.nvim",
  event = "BufWritePre", -- uncomment for format on save
  lazy = false,
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      css = { "prettier" },
      html = { "prettier" },
      json = { "prettier" },
      javascript = { "prettier" },
      javascriptreact = { "prettier" },
      markdown = { "prettier" },
      typescript = { "prettier" },
      typescriptreact = { "prettier", stop_after_first = true },
      yaml = { "yamlfmt" },
    },

    format_on_save = {
      -- These options will be passed to conform.format()
      timeout_ms = 500,
      lsp_fallback = true,
    },
  },
}
