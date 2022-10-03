""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              Neovim Settings                                 "
"                                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set completeopt=menuone,noselect
set confirm
set fileformats=unix,dos,mac
set mouse=a
set noequalalways
set nohidden
set nowrap
set splitright
set splitbelow
set termguicolors
set timeoutlen=3000
set undofile

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
    "TODO: disallow for terminal buffers
    noremap <silent> - :e %:p:h<CR>

    "Don't want to :set ignorecase because * and # should be case-sensitive
    "Case-insensitive search
    noremap / /\c
    noremap ? ?\c
    "Case-sensitive search
    noremap <Leader>/ /
    noremap <Leader>? /

    "Bufdir Plugin
    "Open command-line
    noremap <Leader>cc :Bufdir terminal<CR>i
    noremap <Leader>cC :terminal<CR>i
    noremap <Leader>cs :split \| Bufdir terminal<CR>i
    noremap <Leader>cS :split \| terminal<CR>i
    noremap <Leader>cv :vsplit \| Bufdir terminal<CR>i
    noremap <Leader>cV :vsplit \| terminal<CR>i

    "Telescope Plugin
    noremap <Leader>tb :Bufdir Telescope current_buffer_fuzzy_find<CR>
    noremap <Leader>tf :Bufdir Telescope find_files<CR>
    noremap <Leader>tl :Bufdir Telescope live_grep<CR>
    noremap <Leader>tt :Buffir Telescope<CR>
    noremap <Leader>tB :Telescope current_buffer_fuzzy_find<CR>
    noremap <Leader>tF :Telescope find_files<CR>
    noremap <Leader>tL :Telescope live_grep<CR>
    noremap <Leader>tT :Telescope<CR>

"Insert Mode

    "shift-tab to inverse tab
    inoremap <S-Tab> <C-d>

"Tab switching
    "Some terminals intercept these keystrokes, so if these mappings don't
    "work, check the terminal settings. For Konsole, unbind everything else in
    "Settings>Keyboard Shortcuts and then bind:
    "    Backtab+Ctrl+Ansi -> \E[27;6;9~
    "    Tab+Ctrl+Ansi     -> \E[27;5;9~
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

    tnoremap <Esc> <C-\><C-n>
    tnoremap <C-q> <Esc>
"Autocommands
    augroup INIT_CMDS | autocmd!
        "Turn off line numbers in terminal emulator
        autocmd TermOpen * setlocal nonumber

        "Automatically close terminal buffer when done. This is a work-around I
        "found here:
        "https://github.com/neovim/neovim/issues/14986#issuecomment-902705190
        "TODO: This breaks the :ter command.
        autocmd TermClose * call <SID>try_delete_buffer()
        function! s:try_delete_buffer()
            try
                execute('bdelete! ' . expand('<abuf>'))
            endtry
        endfunction

    augroup end

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

lua require "plugins"

