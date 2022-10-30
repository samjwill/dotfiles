-- Built-in gdb debugging tool
vim.cmd("packadd termdebug")
vim.g.termdebug_wide = 1

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
    -- TODO: Not certain that this is the best way to do this, but if we don't,
    -- Packer isn't recognized. Also saw a solution which modifies the path
    -- Neovim searches, so that might be worth looking into.
    vim.cmd("packadd packer.nvim")
end

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
        config = function()
            require('plugins.config.indent-blankline')
        end
    }

    use
    {
        "nvim-telescope/telescope.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require('plugins.config.telescope')
        end
    }

    use
    {
        "sainnhe/gruvbox-material",
        config = function()
            require('plugins.config.gruvbox-material')
        end
    }

    use
    {
        'phaazon/hop.nvim',
        branch = 'v2',
        config = function()
            require('hop').setup{}
        end
    }

    use
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require('plugins.config.treesitter')
        end,
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
        config = function()
            require('gitsigns').setup()
        end
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
        config = function()
            require('mini.cursorword').setup{}
            require('plugins.config.mini_completion')
            require('plugins.config.mini_map')
        end
    }

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
                    -- If changing these, update the values in lspconfig as well.
                    "clangd"
                }
            })
        end
    }

    use {
        "neovim/nvim-lspconfig",
        after = 'mason-lspconfig.nvim',
        config = function()
            local on_attach_func = function(client, bufnr)
                vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
            end

            -- If changing these, update the values in mason-lspconfig as well.
            require('lspconfig').clangd.setup{
                clangd_keymaps, -- Defined in keymaps file.
                on_attach = on_attach_func
            }
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

