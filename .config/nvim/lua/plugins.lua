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

-- TODO: See if there's a way that you can define these closer to where they're used.

-- Packages for Mason to install
local mason_package_list = { "clangd", "cpptools" }

require("lazy").setup({

    {
        "mfussenegger/nvim-dap",
        dependencies = {"rcarriga/nvim-dap-ui"},
        config = function()
            require("plugin_config.nvim-dap")
        end
    },

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
        "prichrd/netrw.nvim",
        dependencies = {"kyazdani42/nvim-web-devicons"},
        config = function()
            require("netrw").setup()
        end
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
        "nvim-treesitter/nvim-treesitter",
        commit = "287ffdccc1dd7ed017d844a4fad069fd3340fa94",
        config = function()
            require("plugin_config.treesitter")
        end,
        build = ":TSUpdate"
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
        dependencies = {"kyazdani42/nvim-web-devicons"},
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
            require("plugin_config.mini_completion")
            require("plugin_config.mini_map")
        end
    },

    {
        "williamboman/mason.nvim",
        build = function()
            -- TODO: This causes some odd issues if Neovim is currently being
            -- bootstrapped. Leaving in place because at least this installs
            -- packages automatically on launch if they haven't been installed
            -- already.
            vim.cmd("MasonInstall "..table.concat(mason_package_list, " "))
        end,
        config = function()
            require("mason").setup()

            -- Create an autocmd that allows for simple headless installation.
            vim.api.nvim_create_user_command("MasonInstallAll", function ()
                vim.cmd("MasonInstall "..table.concat(mason_package_list, " "))
            end, {})
        end
    },

    {
        "neovim/nvim-lspconfig",
        config = function()
            local on_attach_func = function(client, bufnr)
                vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
            end

            require("lspconfig").clangd.setup{
                clangd_keymaps, -- Defined in keymaps file.
                on_attach = on_attach_func
            }
        end
    }
})
