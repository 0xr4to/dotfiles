-- Instalar lazy.nvim
local lazypath = vim.fn.stdpath('data')..'/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git', 'clone', '--depth', '1',
    'https://github.com/folke/lazy.nvim.git', lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    -- Colorscheme gruvbox
    {
        'ellisonleao/gruvbox.nvim',
        priority = 1000,
        config = function()
            require('theme')
        end
    },

    -- Vim-Lualine
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
    	    require('plugins.lualine')
	    end
    },

    -- Neo Tree
    {
        'nvim-neo-tree/neo-tree.nvim',
        branch = "v3.x",
        dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
        'MunifTanjim/nui.nvim',
        }
    },

    -- Auto-Completion plugins
    {
        'hrsh7th/nvim-cmp',
         config = function()
            require('plugins.cmp')
         end
    },
    {
        'hrsh7th/cmp-nvim-lsp',
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
        'rafamadriz/friendly-snippets',
        {
            'windwp/nvim-autopairs',
            event = "InsertEnter",
            config = true,
        },
    },

    -- LSP plugins
    {
        {
            'williamboman/mason.nvim',
            config = function()
                require('plugins.lsp')
            end
        },
        'williamboman/mason-lspconfig.nvim',
        'neovim/nvim-lspconfig',
    },

    -- TEMP
    {'gpanders/nvim-parinfer'},
    {'elkowar/yuck.vim'},

})

require("theme")

-- Configurações Gerais
vim.o.number = true                                 -- Mostrar números das linhas
vim.o.relativenumber = true                         -- Números relativos nas linhas
vim.o.expandtab = true                              -- Usar espaços ao invés de tabs
vim.o.shiftwidth = 4                                -- Tamanho da indentação
vim.o.tabstop = 4                                   -- Tamanho de uma tabulação
vim.o.smartindent = true                            -- Indentação automática inteligente
vim.o.termguicolors = true                          -- Habilitar cores 24-bit

-- Neovim Keymaps
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
vim.opt.cmdheight  = 0

-- Neo-Tree config
vim.keymap.set('n', '<Space>e', ':Neotree filesystem toggle left<CR>')

-- Mason keymap
vim.keymap.set('n', '<Space>m', ':Mason<CR>')

-- Diagnostic keymap
vim.api.nvim_set_keymap('n', '<Space>d', ':lua vim.diagnostic.open_float()<CR>', {noremap = true, silent = true})

-- Gruvbox theme
vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])
