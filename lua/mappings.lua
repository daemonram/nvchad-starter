require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map('n', '<leader>lr', '<cmd>Telescope lsp_references<CR>', { desc = 'LSP References' })
map('n', '<leader>gr', vim.lsp.buf.references, { desc = 'LSP References' })
map('n', '<leader>gb', '<cmd>Gitsigns toggle_current_line_blame<CR>', { desc = 'Toggle git blame' })
map("i", "jk", "<ESC>")
map('n', ']h', '<cmd>Gitsigns next_hunk<CR>', { desc = 'Next git hunk' })
map('n', '[h', '<cmd>Gitsigns prev_hunk<CR>', { desc = 'Prev git hunk' })
map('n', '<leader>lg', '<cmd>Telescope grep_string<CR>', { desc = 'Telescope search for word' })

-- map({ "n:, "i", "v" }, "<C-s>", "<cmd> w <cr>")
