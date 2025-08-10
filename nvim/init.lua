vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.tabstop = 4
vim.opt.swapfile = false

vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })

vim.g.mapleader = ' '

vim.keymap.set('n', '<leader>o', ':update<CR> :source<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit!<CR>')
vim.keymap.set('n', '<leader>e', ':Explore<CR>')

-- Copy to system clipboard
vim.keymap.set('v', '<leader>y', '"+y')

