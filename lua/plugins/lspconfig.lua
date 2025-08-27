return {
  {
    "mason-org/mason.nvim",
    opts = {},
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua_ls",
        "html",
        "cssls",
        "emmet_language_server",
        "tailwindcss",
        "ts_ls",
        "jsonls",
        "eslint",
        "marksman",
        "pylsp",
        "tinymist",
        "yamlls",
        "jdtls",
        "gopls",
      },
    },

    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
  },
  {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "mason-org/mason-lspconfig.nvim",
      { "j-hui/fidget.nvim",    opts = {} },
      "saghen/blink.cmp",
    },

    -- config = function()
    --   vim.api.nvim_create_autocmd('LspAttach', {
    --     group = vim.api.nvim_create_augroup('finn-lsp-attach', { clear = true }),
    --     callback = function(event)
    --       local map = function(keys, func, desc, mode)
    --         mode = mode or 'n'
    --         vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
    --       end
    --
    --       map('grn', vim.lsp.buf.rename, '[R]e[n]ame')
    --       map('gra', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })
    --       map('grr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    --       map('gri', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
    --       map('grd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
    --
    --       -- Fuzzy find all the symbols in your current document.
    --       --  Symbols are things like variables, functions, types, etc.
    --       map('<leader>ds', require('telescope.builtin').lsp_document_symbols, 'Open Document Symbols')
    --       -- Fuzzy find all the symbols in your current workspace.
    --       --  Similar to document symbols, except searches over your entire project.
    --       map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Open Workspace Symbols')
    --       map('grt', require('telescope.builtin').lsp_type_definitions, '[G]oto [T]ype Definition')
    --
    --       ---@param client vim.lsp.Client
    --       ---@param method vim.lsp.protocol.Method
    --       ---@param bufnr? integer some lsp support methods only in specific files
    --       ---@return boolean
    --       local function client_supports_method(client, method, bufnr)
    --         if vim.fn.has 'nvim-0.11' == 1 then
    --           return client:supports_method(method, bufnr)
    --         else
    --           return client.supports_method(method, { bufnr = bufnr })
    --         end
    --       end
    --
    --       -- The following two autocommands are used to highlight references of the
    --       -- word under your cursor when your cursor rests there for a little while.
    --       --    See `:help CursorHold` for information about when this is executed
    --       -- When you move your cursor, the highlights will be cleared (the second autocommand).
    --       local client = vim.lsp.get_client_by_id(event.data.client_id)
    --       if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
    --         local highlight_augroup = vim.api.nvim_create_augroup('finn-lsp-highlight', { clear = false })
    --         vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
    --           buffer = event.buf,
    --           group = highlight_augroup,
    --           callback = vim.lsp.buf.document_highlight,
    --         })
    --
    --         vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
    --           buffer = event.buf,
    --           group = highlight_augroup,
    --           callback = vim.lsp.buf.clear_references,
    --         })
    --
    --         vim.api.nvim_create_autocmd('LspDetach', {
    --           group = vim.api.nvim_create_augroup('finn-lsp-detach', { clear = true }),
    --           callback = function(event2)
    --             vim.lsp.buf.clear_references()
    --             vim.api.nvim_clear_autocmds { group = 'finn-lsp-highlight', buffer = event2.buf }
    --           end,
    --         })
    --       end
    --     end,
    --   })
    -- end
  },
}
