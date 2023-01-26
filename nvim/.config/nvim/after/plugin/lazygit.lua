local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- lazygit mappings
map('n', '<leader>gg', '<Cmd>LazyGit<CR>', opts)
map('n', '<leader>gc', '<Cmd>LazyGitCurrentFile<CR>', opts)

