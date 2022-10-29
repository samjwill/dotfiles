-- Automatically install Packer on startup.
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    packer_bootstrap = vim.fn.system
    {
        'git',
        'clone',
        '--depth',
        '1',
        'https://github.com/wbthomason/packer.nvim',
        install_path
    }
    --TODO: Not certain that this is the best way to do this, but if we don't, Packer isn't recognized. Also saw a solution which modifies the path Neovim searches, so that might be worth looking into.
    vim.cmd("packadd packer.nvim")
end

-- Built-in gdb debugging tool
vim.cmd("packadd termdebug")
vim.g.termdebug_wide = 1

local packer = require("packer")
-- Keep packer_compiled.lua out of the .config directory.
packer.init {compile_path = vim.fn.stdpath('data')..'/site/pack/loader/start/packer.nvim/plugin/packer_compiled.lua'}
packer.startup(function(use)
    -- Packer needs to manage itself
    use 'wbthomason/packer.nvim'

    use "psliwka/vim-smoothie"
    use "samjwill/vim-bufdir"
    use "samjwill/vim-auto-nohlsearch"

    use
    {
        "lukas-reineke/indent-blankline.nvim",
        config = "require('config.indent-blankline')"
    }

    use
    {
        "nvim-telescope/telescope.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = "require('config.telescope')"
    }
    -- TODO: Running the following two commands after Packer install completion
    -- allows for telescope and treesitter to be used immediately on first
    -- launch. Investigate why and see if something can be implemented into the
    -- init.vim file to allow for the same behavior. Might also be
    -- related to the packadd packer.nvim call above.
    --
    --runtime! plugin/**/*.vim
    --runtime! plugin/**/*.lua

    use
    {
        "sainnhe/gruvbox-material",
        config = "require('config.gruvbox-material')"
    }

    use
    {
        'phaazon/hop.nvim',
        branch = 'v2',
        config = "require('config.hop')"
    }

    use
    {
        "nvim-treesitter/nvim-treesitter",
        config = "require('config.treesitter')",
        -- :TSUpdate fails when bootstrapping. Call update function directly.
        -- https://github.com/nvim-treesitter/nvim-treesitter/issues/3135
        -- https://github.com/nvim-treesitter/nvim-treesitter/wiki/Installation#packernvim
        run = function()
            require("nvim-treesitter.install").update { with_sync = true }
        end
    }

    use
    {
        "samjwill/nvim-unception",
        config = function()
            vim.g.unception_delete_replaced_buffer = true
            vim.g.unception_enable_flavor_text = false
        end
    }

    use
    {
        'lewis6991/gitsigns.nvim',
        config = "require('config.gitsigns')"
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function()
            require('lualine').setup({
                options = {
                    section_separators = { left = '', right = '' },
                    component_separators = '',
                },
                sections = {
                    lualine_c = {
                        {'filename', path = 3},
                    },
                }
            })
        end
    }

    use
    {
        'numToStr/Comment.nvim',
        config = function() require('Comment').setup{} end
    }

    use
    {
        'echasnovski/mini.nvim',
        config = "require('config.mini')"
    }

    -- Ordered
    use
    {
        "williamboman/mason.nvim",
        config = function() require('mason').setup() end
    }

    use {
        "williamboman/mason-lspconfig.nvim",
        after = 'mason.nvim',
        config = function()
            require("mason-lspconfig").setup(
            {
                -- TODO: Just put these in the same config if possible.
                ensure_installed =
                {
                    -- If changing these, update the values in lspconfig.lua as well.
                    "clangd"
                }
            })
        end
    }

    use {
        "neovim/nvim-lspconfig",
        after = 'mason-lspconfig.nvim',
        config = function()
            require('config.lspconfig')
        end
    }

    -- Automatically set up your configuration after cloning packer.nvim
    if packer_bootstrap then
        vim.api.nvim_create_autocmd("User", {
            pattern = "PackerComplete",
            callback = function() print("Installation is complete! Please restart Neovim.") end
        })
        require('packer').sync()
    end
end)
