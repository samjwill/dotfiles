vim.cmd([[
" TODO - list of things that don't work quite right and need to be addressed.
" Using `:ter <my_command>` without automatically closing buffer.
" Terminal buffer being deleted when it's still visible using unception
" Termdebug does not always follow highlighting
" Hop not working when terminal buffer has focus or when inside of commandline window

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              Neovim Settings                                 "
"                                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set cmdheight=1
set completeopt=menuone,noselect
set confirm
set cursorline
set fileformats=unix,dos,mac
set laststatus=3
set mouse=a
set noequalalways
set nohidden
set noshowmode
set nowrap
set splitright
set splitbelow
set termguicolors
set timeoutlen=3000
set undofile
set winbar=%t "filename without path

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
let &directory = g:swap_dir . ',.'

"Settings for both netrw and neovim
set number
let g:netrw_bufsettings='noma nomod number nobl nowrap ro' "All but 'number' are default

"Netrw Settings
let g:netrw_banner=0

" Hide . and .. directories.
let g:netrw_list_hide=''
let g:netrw_list_hide.='^\./$'
let g:netrw_list_hide.=','
let g:netrw_list_hide.='^\.\./$'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                         Keybinds and Autocommands                            "
"                                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"TODO: Sort these mappings more logically.
let mapleader = " "

"Normal, Visual, Select, Operator-pending Modes

    "Don't want to :set ignorecase because * and # should be case-sensitive
    noremap / /\c
    noremap ? ?\c
    noremap <Leader>/ /
    noremap <Leader>? ?

    "- to edit directory of current file
    "TODO: disallow for terminal buffers
    noremap <silent> - :e %:p:h<CR>

    "Bufdir Plugin
    "Open command-line
    noremap <Leader>cc :Bufdir terminal<CR>i
    noremap <Leader>cC :terminal<CR>i
    noremap <Leader>cs :split \| Bufdir terminal<CR>i
    noremap <Leader>cS :split \| terminal<CR>i
    noremap <Leader>cv :vsplit \| Bufdir terminal<CR>i
    noremap <Leader>cV :vsplit \| terminal<CR>i

    "Telescope Plugin
    noremap <Leader>t/ :Telescope current_buffer_fuzzy_find<CR>
    noremap <Leader>tf :Telescope find_files<CR>
    noremap <Leader>tl :Telescope live_grep<CR>
    noremap <Leader>tt :Telescope<CR>

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

        "Automatically close terminal buffer when done.
        "TODO: This breaks the :ter command.
        autocmd TermClose * if !v:event.status | execute 'bdelete! ' . expand('<abuf>') | endif

        "Clear highlighting when pressing ctrl-l. Already happens by default
        "apparently, but needs to be set in netrw buffers.
        autocmd FileType netrw nnoremap <buffer> <C-l> <CMD>nohlsearch<CR><C-l>
    augroup end

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Highlighting                                  "
"                             Auto-(no)hlsearch                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Turn off search highlighting once done searching

let g:enter_was_pressed = 0

function! s:handle_cursor_moved()
   if &hlsearch == 0 "See :h expr-option
      return
   endif

   let last_search = @/
   if last_search != ""
      let cursor_pos = [line("."), col(".")]
      "Limit search to current line, starting with character under cursor
      let pos_of_next_match = searchpos(last_search, "cnz", cursor_pos[0])
      if cursor_pos != pos_of_next_match
         set nohlsearch
      endif
  endif
endfunction

function! s:handle_cmdline_leave()
   if (!g:enter_was_pressed)
      set nohlsearch
   else
      let g:enter_was_pressed = 0
      set hlsearch
   endif
endfunction

function! s:handle_enter_pressed_in_cmdline()
   let g:enter_was_pressed = 1
   return "\<CR>"
endfunction

augroup AUTO_NOHLSEARCH_CMDS | autocmd!
    "See :h cmdwin-char and :h file-pattern. Maps to ? and / searches.
    autocmd! CmdlineChanged [\/\?] set hlsearch
    autocmd! CmdlineLeave [\/\?] call <SID>handle_cmdline_leave()
    autocmd! CmdwinEnter [\/\?] nnoremap <CR> <CMD>let g:enter_was_pressed = 1<CR><CR>
    autocmd! CmdwinLeave [\/\?] nunmap <CR>
    autocmd! CursorMoved * call <SID>handle_cursor_moved()
    autocmd! InsertEnter * set nohlsearch
augroup end

cnoremap <silent><expr> <CR> <SID>handle_enter_pressed_in_cmdline()

noremap <silent> n n<CMD>set hlsearch<CR>
noremap <silent> N N<CMD>set hlsearch<CR>
noremap <silent> * *<CMD>set hlsearch<CR>
noremap <silent> # #<CMD>set hlsearch<CR>
noremap <silent> g* g*<CMD>set hlsearch<CR>
noremap <silent> g# g#<CMD>set hlsearch<CR>
noremap <silent> gd gd<CMD>set hlsearch<CR>
noremap <silent> gD gD<CMD>set hlsearch<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  Plugins                                     "
"                                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

lua require "plugins"

]])
