""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Vim Settings                                  "
"                                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax on
filetype plugin indent on

set backspace=indent,eol,start
set belloff=all
set clipboard=unnamed
set confirm
set directory=~/tmp,.
set history=1000
set ignorecase
set incsearch
set mouse=a
set nocompatible
set noequalalways
set nomagic
set nowrap
set scrolloff=0
set showcmd
set t_Co=256

"Tabs
set autoindent
set copyindent
set expandtab
set shiftwidth=3
set softtabstop=3
set tabstop=3

"Wildmenu
set wildignorecase
set wildmenu
set wildmode=longest:full,full

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                   Settings applied to both Vim and Netrw                     "
"                                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set autochdir
let g:netrw_keepdir=0

set splitright
let g:netrw_altv=1

set splitbelow
let g:netrw_alto=1

set number
let g:netrw_bufsettings='noma nomod number nobl nowrap ro' "All but 'number' are default

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               Netrw Settings                                 "
"                                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:netrw_liststyle=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   Keybinds                                   "
"                                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = " "

""Insert Mode

   "shift-tab to inverse tab
   inoremap <S-Tab> <C-d>

"Normal, Visual, Select, Operator-pending Modes

   "- to edit directory of current file
   map <silent> - :e %:p:h<CR>

   "Leader-/ to case-sensitive, very magic search (i.e. regex search)
   map <leader>/ /\C\v

   "TODO: May want to map <leader>- *, #, g*, g#, gd, gD, etc. to be case sensitive.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           StatusLine and Colors                              "
"                                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

colorscheme slate

"Prevents undesired statusline color inversion
highlight StatusLine term=Reverse cterm=Reverse
highlight StatusLineTerm term=Reverse cterm=Reverse
highlight StatusLineTermNC term=Reverse cterm=Reverse

"Define colors for use below
highlight User1 ctermfg=Black    ctermbg=LightGray
highlight User2 ctermfg=Darkred  ctermbg=LightGray
highlight User3 ctermfg=DarkBlue ctermbg=LightGray
highlight User4 ctermfg=Black    ctermbg=LightGray
highlight User5 ctermfg=Black    ctermbg=LightGray
highlight User6 ctermfg=DarkBlue ctermbg=LightGray
highlight User7 ctermfg=DarkRed  ctermbg=LightGray

set laststatus=2        "set statusline visiblility to 'always'

set statusline=         "clear entire statusline
set statusline+=%1*     "set color
set statusline+=%n      "buffer number
set statusline+=\       "space
set statusline+=%2*     "set color
set statusline+=%{&ff}  "file format where EOL is: dos = <CR><NL>, unix = <NL>, mac = <CR>
set statusline+=\       "space
set statusline+=%3*     "set color
set statusline+=%y      "file type
set statusline+=\       "space
set statusline+=%4*     "set color
set statusline+=%F      "full filepath
set statusline+=%=      "separation point between left and right aligned items
set statusline+=%5*     "set color
set statusline+=%m      "modified flag where: [+] = modified, [-] = unmodifiable
set statusline+=\       "space
set statusline+=%6*     "set color
set statusline+=L:      "L:
set statusline+=%l      "current line
set statusline+=/       "/
set statusline+=%L      "total lines
set statusline+=\       "space
set statusline+=%7*     "set color
set statusline+=C:      "C:
set statusline+=%v      "column number
set statusline+=\       "space
set statusline+=%0*     "clear color


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Highlighting                                  "
"                             Auto-(no)hlsearch                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Turn off search highlighting once done searching

set nohlsearch
let g:enter_was_pressed = 0 "TODO: Find out if there's a way to avoid tracking state like this.

function s:handle_cursor_moved()
   if &hlsearch == 0
      return
   endif

   let last_search = @/
   let cursor_pos = [line("."), col(".")]
   "Limit search to current line, starting with character under cursor
   let pos_of_next_match = searchpos(last_search, "cnz", cursor_pos[0]) 

   if cursor_pos != pos_of_next_match
      set nohlsearch
   endif
endfunction

function s:handle_cmdline_changed()
   let cmd_type = getcmdtype()
   let is_search = (cmd_type == "/" || cmd_type == "?")
   if is_search
      set hlsearch
   else
      set nohlsearch
   endif
endfunction

function s:handle_cmdline_leave()
   if (!g:enter_was_pressed)
      set nohlsearch
      return
   endif

   let cmdwin_char = expand('<afile>')
   let is_search = (cmdwin_char == "/" || cmdwin_char == "?")
   if is_search
      set hlsearch
   else
      set nohlsearch
   endif
   let g:enter_was_pressed = 0
endfunction

function s:handle_enter_pressed()
   let g:enter_was_pressed = 1
   call feedkeys("\<CR>", "n")
   return ""
endfunction

autocmd CursorMoved * call <SID>handle_cursor_moved()
autocmd CmdlineChanged * call <SID>handle_cmdline_changed()
autocmd CmdlineLeave * call <SID>handle_cmdline_leave()
autocmd InsertEnter * set nohlsearch
"TODO: Attach autocmd to evaluate whether hlsearch should be enabled upon leaving search history window (/+<C-f>)

"TODO: See if there's a way to map shift-enter as well.
cnoremap <silent><expr> <CR> <SID>handle_enter_pressed()

noremap <silent> n n:set hlsearch<CR>
noremap <silent> N N:set hlsearch<CR>
noremap <silent> * *:set hlsearch<CR>
noremap <silent> # #:set hlsearch<CR>
noremap <silent> g* g*:set hlsearch<CR>
noremap <silent> g# g#:set hlsearch<CR>
noremap <silent> gd gd:set hlsearch<CR>
noremap <silent> gD gD:set hlsearch<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   TODOs                                      "
"                                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Find way to set persistent "very no magic" mode (":set nomagic ignorecase" is close)

"Find way to set multiple highlights of different colors
