""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              Neovim Settings                                 "
"                                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set confirm
set fileformats=unix,dos,mac
set mouse=a
set noequalalways
set nohidden
set nowrap
set splitright
set splitbelow
set termguicolors

"Formatting Marks
set list
set listchars=precedes:<,extends:>,tab:\ \ ,trail:_
set showbreak=...

"Tabs
set breakindent
set copyindent
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

"Wildmenu
set wildignorecase
set wildmode=longest:full,full

"Swap directory
let g:swap_dir = stdpath('data') . "/swap"
call mkdir(g:swap_dir, "p", 0700)
let &directory=g:swap_dir . ',.'

"Settings for both netrw and neovim
set number
let g:netrw_bufsettings='noma nomod number nobl nowrap ro' "All but 'number' are default

"Netrw Settings
let g:netrw_banner=0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                         Keybinds and Autocommands                            "
"                                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"TODO: Sort these mappings more logically.
let mapleader = " "

"Normal, Visual, Select, Operator-pending Modes

    "- to edit directory of current file
    noremap <silent> - :e %:p:h<CR>

    "Don't want to :set ignorecase because * and # should be case-sensitive
    "Case-insensitive search
    noremap / /\c
    noremap ? ?\c
    "Case-sensitive search
    noremap <Leader>/ /
    noremap <Leader>? /

    noremap <Leader>t :Telescope<CR>

"Insert Mode

    "shift-tab to inverse tab
    inoremap <S-Tab> <C-d>

"Tab switching
"TODO: Should I just use "noremap" here vvv?
    "Some terminals intercept these keystrokes, so if these mappings don't work,
    "check the terminal settings.
    cnoremap <silent> <C-Tab> <Esc>:tabn<CR>
    inoremap <silent> <C-Tab> <Esc>:tabn<CR>
    nnoremap <silent> <C-Tab> :tabn<CR>
    tnoremap <silent> <C-Tab> <C-\><C-N>:tabn<CR>
    vnoremap <silent> <C-Tab> <Esc>:tabn<CR>

    cnoremap <silent> <C-S-Tab> <Esc>:tabp<CR>
    inoremap <silent> <C-S-Tab> <Esc>:tabp<CR>
    nnoremap <silent> <C-S-Tab> :tabp<CR>
    tnoremap <silent> <C-S-Tab> <C-\><C-N>:tabp<CR>
    vnoremap <silent> <C-S-Tab> <Esc>:tabp<CR>

"Autocommands
    augroup INIT_CMDS | autocmd!
        "Turn off line numbers in terminal emulator
        autocmd TermOpen * setlocal nonumber

        "Automatically close terminal buffer when done. This is a work-around I
        "found here:
        "https://github.com/neovim/neovim/issues/14986#issuecomment-902705190
        autocmd TermClose * execute 'bdelete! ' . expand('<abuf>')
    augroup end

    tnoremap <Esc> <C-\><C-n>
    tnoremap <C-q> <Esc>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 StatusLine                                   "
"                                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set statusline=         "clear entire statusline
set statusline+=%n      "buffer number
set statusline+=\       "space
set statusline+=%{&ff}  "file format where EOL is: dos = <CR><NL>, unix = <NL>, mac = <CR>
set statusline+=\       "space
set statusline+=%y      "file type
set statusline+=\       "space
set statusline+=%F      "full filepath
set statusline+=%=      "separation point between left and right aligned items
set statusline+=%m      "modified flag where: [+] = modified, [-] = unmodifiable
set statusline+=\       "space
set statusline+=L:      "L:
set statusline+=%l      "current line
set statusline+=/       "/
set statusline+=%L      "total lines
set statusline+=\       "space
set statusline+=C:      "C:
set statusline+=%v      "column number
set statusline+=\       "space

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  Plugins                                     "
"                                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Built-in gdb debugging tool
packadd termdebug

"Auto-install vim-plug when launching vim if it's not already installed
"From https://github.com/junegunn/vim-plug/wiki/tips
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"TODO: Look into treesitter plugin and native LSP
call plug#begin()
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'tpope/vim-fugitive'
    Plug 'romainl/vim-cool'
    Plug 'psliwka/vim-smoothie'
    Plug 'morhetz/gruvbox'
    Plug 'SamuelWilliams256/vim-bufdir'
call plug#end()

colorscheme gruvbox
"Gruvbox breaks this at the time of writing for Termdebug
hi debugPC term=reverse ctermbg=66 guibg='#458588'

"TODO: see if you can use named colors instead of hard-coding hex codes
augroup INIT_STATUS | autocmd!
    "Toggle new color when in insert mode
    autocmd InsertEnter * highlight StatusLine ctermfg=108 ctermbg=237 guifg='#8ec07c' guibg='#3c3836'
    autocmd InsertLeave * highlight StatusLine ctermfg=239 ctermbg=223 guifg='#504945' guibg='#ebdbb2'
    autocmd TermEnter * highlight StatusLine ctermfg=108 ctermbg=237 guifg='#8ec07c' guibg='#3c3836'
    autocmd TermLeave * highlight StatusLine ctermfg=239 ctermbg=223 guifg='#504945' guibg='#ebdbb2'
augroup end

lua << EOF
    function exists(filename)
       local ok, message, err_code = os.rename(filename, filename)
       if not ok then
          if err_code == 13 then
			 --file inaccessible, but was found
			 ok = true
          end
       end
       return ok
    end

    local expected_pipe_name = "/tmp/nvim.pipe"

    if exists(expected_pipe_name) then
    	args = vim.call("argv")

    	local arg_str = ""
    	for index, iter in pairs(args) do
    		arg_str = arg_str.." "..iter
    	end

		if (#args > 0) then
    		os.execute("\\nvim --server "..expected_pipe_name.." --remote-send \"<C-\\><C-N>:argedit "..arg_str.."<CR>\"")
		else
    		os.execute("\\nvim --server "..expected_pipe_name.." --remote-send \"<C-\\><C-N>:enew<CR>\"")
		end
    	vim.cmd("quit")
    else
    	vim.call("serverstart", expected_pipe_name)
    end
EOF
