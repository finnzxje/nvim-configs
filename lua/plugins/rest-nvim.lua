return {
  -- "rest-nvim/rest.nvim",
  "mistweaverco/kulala.nvim",
  lazy = true,
  -- dependencies = {
  --   "nvim-treesitter/nvim-treesitter",
  --   { "rest-nvim/tree-sitter-http", build = ":TSInstall http" },
  --   opts = function(_, opts)
  --     opts.ensure_installed = opts.ensure_installed or {}
  --     table.insert(opts.ensure_installed, "http")
  --   end,
  -- },
  keys = {
    { "<leader>rs", desc = "Send request" },
    { "<leader>ra", desc = "Send all requests" },
    { "<leader>rb", desc = "Open scratchpad" },
  },
  ft = { "http", "rest" },
  opts = {
    -- your configuration comes here
    global_keymaps = true,
    global_keymaps_prefix = "<leader>r",
    kulala_keymaps_prefix = "",
  },
}
