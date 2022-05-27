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
    print "Installing Packer. Please close and reopen Neovim on install completion..."
    --TODO: Not certain that this is the best way to do this, but if we don't, Packer isn't recognized. Also saw a solution which modifies the path Neovim searches, so that might be worth looking into.
    vim.cmd("packadd packer.nvim")
end

-- Built-in gdb debugging tool
vim.cmd("packadd termdebug")
vim.g.termdebug_wide = 1

return require('packer').startup(function(use)
    -- Packer needs to manage itself
    use 'wbthomason/packer.nvim'

    use {
        "nvim-telescope/telescope.nvim",
        requires = { "nvim-lua/plenary.nvim" },
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

    use {
        "ellisonleao/gruvbox.nvim",
        config = "require('config.gruvbox')"
    }

    use {
        "nvim-treesitter/nvim-treesitter",
        config = "require('config.treesitter')",
        --TODO: I guess we need to lazy load this, as otherwise the command isn't recognized?
        event = "VimEnter",
        run = ":TSUpdate"
    }
    use "romainl/vim-cool"
    use "psliwka/vim-smoothie"
    use "samjwill/vim-bufdir"
    use "samjwill/nvim-unception"
    -- TODO: Look into native LSP

    -- Automatically set up your configuration after cloning packer.nvim
    if packer_bootstrap then
        require('packer').sync()
    end
end)

