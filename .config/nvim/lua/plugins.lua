-- Automatically install Packer on startup.
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system
    {
        'git',
        'clone',
        '--depth',
        '1',
        'https://github.com/wbthomason/packer.nvim',
        install_path
    }
    print "Installing Packer. Please wait..."
    --TODO: Not certain that this is the best way to do this, but if we don't, Packer isn't recognized. Also saw a solution which modifies the path Neovim searches, so that might be worth looking into.
    vim.cmd("packadd packer.nvim")
end

-- Built-in gdb debugging tool
vim.cmd("packadd termdebug")
vim.g.termdebug_wide = 1

require('packer').startup(function(use)
    -- Packer needs to manage itself
    use 'wbthomason/packer.nvim'

    use "romainl/vim-cool"
    use "psliwka/vim-smoothie"
    use "samjwill/vim-bufdir"

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
        "ellisonleao/gruvbox.nvim",
        commit = "3352c12c083d0ab6285a9738b7679e24e7602411",
        config = "require('config.gruvbox')"
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
        --TODO: I guess we need to lazy load this, as otherwise the command isn't recognized?
        event = "VimEnter",
        run = ":TSUpdate"
    }

    use
    {
        "neovim/nvim-lspconfig",
        config = "require('config.lspconfig')"
    }

    use
    {
        "samjwill/nvim-unception",
        config = "vim.g.unception_delete_replaced_buffer = true vim.g.unception_enable_flavor_text = false"
    }

    use
    {
        'lewis6991/gitsigns.nvim',
        config = "require('config.gitsigns')"
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
