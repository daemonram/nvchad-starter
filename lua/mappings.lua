require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local function toggle_quickfix()
  local windows = vim.fn.getwininfo()
  for _, win in pairs(windows) do
    if win["quickfix"] == 1 then
      vim.cmd.cclose()
      return
    end
  end
  vim.cmd.copen()
end

vim.keymap.set('n', '<Leader>q', toggle_quickfix, { desc = "Toggle Quickfix Window" })


map("n", ";", ":", { desc = "CMD enter command mode" })
map('n', '<leader>lr', '<cmd>Telescope lsp_references<CR>', { desc = 'LSP References' })
map('n', '<leader>gr', vim.lsp.buf.references, { desc = 'LSP References' })
map('n', '<leader>gb', '<cmd>Gitsigns toggle_current_line_blame<CR>', { desc = 'Toggle git blame' })
map("i", "jk", "<ESC>")
map('n', ']h', '<cmd>Gitsigns next_hunk<CR>', { desc = 'Next git hunk' })
map('n', '[h', '<cmd>Gitsigns prev_hunk<CR>', { desc = 'Prev git hunk' })
map('n', '<leader>fg', '<cmd>Telescope grep_string<CR>', { desc = 'Telescope search for word' })
-- In your keymaps.lua or init.lua
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = 'Go to declaration' })
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { desc = 'Go to implementation' })

map('i', '<C-l>', function ()
  vim.fn.feedkeys(vim.fn['copilot#Accept'](), '')
end, { desc = 'Copilot Accept', noremap = true, silent = true })

-- map({ "n:, "i", "v" }, "<C-s>", "<cmd> w <cr>")
