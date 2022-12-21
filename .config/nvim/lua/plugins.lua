-- Automatically install Lazy on startup.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--single-branch",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end
vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup({
    {
        "psliwka/vim-smoothie"
    },

    {
        "samjwill/vim-bufdir"
    },

    {
        "samjwill/vim-auto-nohlsearch"
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("plugin_config.indent-blankline")
        end
    },

    {
        "nvim-telescope/telescope.nvim",
        dependencies = "nvim-lua/plenary.nvim",
        config = function()
            require("plugin_config.telescope")
        end
    },

    {
        "linty-org/key-menu.nvim",
        config = function()
            local km = require("key-menu")
            for i, prefix in ipairs(prefix_list) do
                km.set(unpack(prefix))
            end
        end
    },


    {
        "sainnhe/gruvbox-material",
        config = function()
            require("plugin_config.gruvbox-material")
        end
    },

    {
        "phaazon/hop.nvim",
        branch = "v2",
        config = function()
            require("hop").setup()
        end
    },

    {
        "nvim-treesitter/nvim-treesitter",
        commit = "287ffdccc1dd7ed017d844a4fad069fd3340fa94",
        config = function()
            require("plugin_config.treesitter")
        end,
        -- :TSUpdate fails when bootstrapping. Call update function directly.
        -- https://github.com/nvim-treesitter/nvim-treesitter/issues/3135
        -- https://github.com/nvim-treesitter/nvim-treesitter/wiki/Installation#packernvim
        build = function()
            require("nvim-treesitter.install").update { with_sync = true }
        end
    },

    {
        "samjwill/nvim-unception",
        config = function()
            vim.g.unception_delete_replaced_buffer = true
            vim.g.unception_enable_flavor_text = false
        end
    },

    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
        end
    },

    {
        "nvim-lualine/lualine.nvim",
        dependencies = {"kyazdani42/nvim-web-devicons", lazy = true},
        config = function()
            require("lualine").setup({
                options = {
                    section_separators = { left = "", right = "" },
                    component_separators = "",
                },
                sections = {
                    lualine_c = {
                        {"filename", path = 3},
                    },
                }
            })
        end
    },

    {
        "numToStr/Comment.nvim",
        config = function() require("Comment").setup{} end
    },

    {
        "echasnovski/mini.nvim",
        config = function()
            -- require("mini.cursorword").setup{} -- TODO: Seems to break highlighting?
            require("plugin_config.mini_completion")
            require("plugin_config.mini_map")
        end
    },

    {
        "williamboman/mason.nvim",
        config = function() require("mason").setup() end
    },

    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {"williamboman/mason.nvim"},
        config = function()
            -- TODO: May be able to merge this with other clangd-specific tables for LSP?
            local package_list = { "clangd" }

            require("mason-lspconfig").setup(
            {
                ensure_installed = package_list
            })

            -- Create an autocmd that allows for simple headless installation.
            vim.api.nvim_create_user_command("MasonInstallAll", function ()
                vim.cmd("MasonInstall "..table.concat(package_list, " "))
            end, {})
        end
    },

    {
        "neovim/nvim-lspconfig",
        dependencies = {"williamboman/mason-lspconfig.nvim"},
        config = function()
            local on_attach_func = function(client, bufnr)
                vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
            end

            -- If changing these, update the values in mason-lspconfig as well as in the headless install neovim plugins script.
            require("lspconfig").clangd.setup{
                clangd_keymaps, -- Defined in keymaps file.
                on_attach = on_attach_func
            }
        end
    }
})
