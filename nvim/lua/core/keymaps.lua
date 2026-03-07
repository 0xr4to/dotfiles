local map = vim.keymap.set

vim.keymap.set('n', '<C-k>', ':wincmd k<CR>')       -- move up
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>')       -- move down
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>')       -- move left
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>')       -- move right
vim.keymap.set('n', '<Space>%', ':vsplit<CR>')      -- vertical split
vim.keymap.set('n', '<Space>"', ':split<CR>')       -- horizontal split
vim.keymap.set('n', '<Space>c', ':close<CR>')       -- close tab
vim.keymap.set('n', '<Space>h', ':nohlsearch<CR>')  -- unhilight the search

-- Reload nvim TEMP
vim.keymap.set('n', '<Space>z', ':source %<CR>')

-- Lazy keymap
vim.keymap.set('n', '<Space>x', ':Lazy<CR>')        -- open lazy nvim plugins

-- Lualine config
vim.opt.laststatus = 3

-- Neo-Tree config
vim.keymap.set('n', '<Space>e', ':Neotree filesystem toggle left<CR>')

-- Mason keymap
vim.keymap.set('n', '<Space>m', ':Mason<CR>')

-- Diagnostic keymap
vim.api.nvim_set_keymap('n', '<Space>d', ':lua vim.diagnostic.open_float()<CR>', {noremap = true, silent = true})
