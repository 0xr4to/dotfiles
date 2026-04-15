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
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = function()
            require("theme")
        end
    },

    -- Vim-Lualine
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
    	    require("plugins.lualine")
	    end
    },

    -- Mason
    {
        "mason-org/mason.nvim",
        config = function()
            require("plugins.mason")
        end
    },

    -- Mason LSP config
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {"mason-org/mason.nvim"},
        config = function()
            require("plugins.mason-lspconfig")
        end
    },

    -- nvim LSP
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "mason-org/mason.nvim",
            "mason-org/mason-lspconfig.nvim"
        },
        --config = function()
        --    require("plugins.lspconfig")
        --end
    },

    -- Auto completion
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'saadparwaiz1/cmp_luasnip',
            'rafamadriz/friendly-snippets',
            'L3MON4D3/LuaSnip',
            {
                'windwp/nvim-autopairs',
                event = "InsertEnter",
                config = true,
            },
        },
        config = function()
            require('plugins.cmp').setup()
        end
    },

    -- Neo-tree
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons",
        },
        lazy = false
    },

    -- Noice NVIM
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {},
        dependencies = {
            "MunifTanjim/nui.nvim",
            {
                "rcarriga/nvim-notify",
                config = function()
                    require('plugins.notify')
                end
            }
        }
    }
})

require("core.keymaps")

-- Configurações Gerais
vim.o.number = true                                 -- Mostrar números das linhas
vim.o.relativenumber = true                         -- Números relativos nas linhas
vim.o.expandtab = true                              -- Usar espaços ao invés de tabs
vim.o.shiftwidth = 4                                -- Tamanho da indentação
vim.o.tabstop = 4                                   -- Tamanho de uma tabulação
vim.o.smartindent = true                           -- Indentação automática inteligente
vim.o.termguicolors = true                          -- Habilitar cores 24-bit

-- Gruvbox theme
vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])
