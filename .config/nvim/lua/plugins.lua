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
    print "Installing Packer. Please close and reopen Neovim..."
    --TODO: Necessary? Apparently it lazy loads?
    vim.cmd [[packadd packer.nvim]]
end

-- Built-in gdb debugging tool
vim.cmd [[packadd termdebug]]

return require('packer').startup(function(use)
    -- Packer needs to manage itself
    use 'wbthomason/packer.nvim'

	use {
		"nvim-telescope/telescope.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = [[require('config.telescope')]],
	}

    use {
        "morhetz/gruvbox",
        config = "require('config.gruvbox')",
    }

    use 'romainl/vim-cool'
    use 'psliwka/vim-smoothie'
    use 'samjwill/vim-bufdir'
    use 'samjwill/nvim-unception'
    -- TODO: Look into treesitter plugin and native LSP

    -- Automatically set up your configuration after cloning packer.nvim
    if packer_bootstrap then
        require('packer').sync()
    end
end)

