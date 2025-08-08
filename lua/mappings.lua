local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- lsp
vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end,
  vim.tbl_deep_extend("force", opts, { desc = "LSP Goto Definition" }))

-- miscs
map("n", "<Esc>", "<cmd>nohlsearch<CR>")
map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })
map("n", "<leader>x", "<cmd>bd<CR>", { desc = "close current buffer" })

-- telescope
-- local builtin = require("telescope.builtin")
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
map("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
map("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
map("n", "<leader>pt", "<cmd>Telescope terms<CR>", { desc = "telescope pick hidden term" })

map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
map(
  "n",
  "<leader>fa",
  "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>",
  { desc = "telescope find files" }
)

map("n", "<C-s>", "<cmd>w<CR>", { desc = "general save file" })

-- obsidian stuffs

map("n", "<leader>on", ":ObsidianTemplate note<cr> :lua vim.cmd([[1,/^\\S/s/^\\n\\{1,}//]])<cr>")
map("n", "<leader>of", ":s/\\(# \\)[^_]*_/\\1/ | s/-/ /g<cr>")
map("n", "<leader>ok", ":!mv '%:p' ~/documents/obsidian-vault/finn/99-zettelkasten<cr>:bd<cr>")
map("n", "<leader>och", "<cmd>Obsidian toggle_checkbox<cr>", { desc = "Toggle checkbox", })
map("n", "<leader>odd", ":!rm '%:p'<cr>:bd<cr>", { desc = "!Delete file in current buffer" })

-- Typst live preview with low latency
map("n", "<leader>lp", ":TypstPreview<CR>", opts)


map("n", "<leader>yd", function()
  local diagnostics = vim.diagnostic.get(0, { lnum = vim.fn.line('.') - 1 })
  if #diagnostics > 0 then
    local message = diagnostics[1].message
    vim.fn.setreg('+', message) -- Yank to default register
    print("Yanked: " .. message)
  else
    print("No diagnostic on this line.")
  end
end, { desc = "Yank diagnostic message" })
