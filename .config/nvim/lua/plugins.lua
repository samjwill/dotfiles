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
    print "Installing packer close and reopen Neovim..."
    --TODO: Necessary? Apparently it lazy loads?
    vim.cmd [[packadd packer.nvim]]
end


--TODO: Look into treesitter plugin and native LSP
return require('packer').startup(function(use)
    -- Packer needs to manage itself
    use 'wbthomason/packer.nvim'

	use ({
		"nvim-telescope/telescope.nvim",
		requires = {{ "nvim-lua/plenary.nvim" }},
		config = 'require("config.telescope")',
	})
--    use
--    {
--        'nvim-telescope/telescope.nvim',
--
--        -- Plenary is a dependency for telescope
--        requires = {'nvim-lua/plenary.nvim'},
--
--        config = require("config.telescope"),
--    }

    use 'romainl/vim-cool'
    use 'psliwka/vim-smoothie'
    use 'morhetz/gruvbox'
    use 'samjwill/vim-bufdir'
    use 'samjwill/nvim-unception'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)

