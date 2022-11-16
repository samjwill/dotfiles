vim.opt.cmdheight = 1
vim.opt.completeopt = "menuone,noselect"
vim.opt.confirm = true
vim.opt.cursorline = true
vim.opt.equalalways = false
vim.opt.fileformats = "unix,dos,mac"
vim.opt.hidden = false
vim.opt.laststatus=3
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.showmode = false
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.termguicolors = true
vim.opt.timeoutlen = 300 -- Would want this to be higher w/o keymenu plugin
vim.opt.undofile = true
vim.opt.winbar= "%t" -- filename without path
vim.opt.wrap = false

-- Formatting Marks
vim.opt.list = true
vim.opt.listchars = {precedes = "<", extends = ">", tab = "  ", trail = "_"}
vim.opt.showbreak = "..."

-- Tabs
vim.opt.breakindent = true
vim.opt.copyindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth=4
vim.opt.softtabstop=4
vim.opt.tabstop=4

-- Wildmenu
vim.opt.wildignorecase = true
vim.opt.wildmode = "longest:full,full"

-- Swap directory
vim.g.swap_dir = vim.fn.stdpath("data") .. "/swap"
vim.fn.mkdir(vim.g.swap_dir, "p")
vim.o.directory = vim.g.swap_dir .. ',.'

-- Prefer ripgrep to grep.
if (1 == vim.fn.executable("rg")) then
    vim.opt.grepprg="rg --vimgrep"
    vim.opt.grepformat:prepend{"%f:%l:%c:%m"}
end

