""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Vim Settings                                  "
"                                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax on
filetype plugin indent on

set autoread
set backspace=indent,eol,start
set belloff=all
set clipboard=unnamed
set confirm
set directory=~/tmp,.
set history=1000
set ignorecase
set mouse=a
set nocompatible
set noequalalways
set nomagic
set noshowmatch
set nowrap
set number
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               Netrw Settings                                 "
"                                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:netrw_bufsettings='noma nomod number nobl nowrap ro' "sets 'number' for netrw
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
   map - :e %:p:h<CR>

   "Leader / to case-sensitive, very magic search (i.e. regex search)
   map <leader>/ /\C\v

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           StatusLine and Colors                              "
"                                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

colorscheme slate

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
"                                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Auto-(no)hlsearch

function s:handle_cursor_moved()
   let hlsearch_enabled = &hlsearch
   if !hlsearch_enabled
      return
   endif

   let last_search = @/
   "Limit search to current line, starting with character under cursor
   let pos_of_next_match = searchpos(last_search, "cnz", line(".")) 
   let cursor_pos = [line("."), col(".")]

   if cursor_pos != pos_of_next_match
      set nohlsearch
   endif
   echo "CURSOR POS IS: "cursor_pos
endfunction

function s:handle_cmdline_changed()
   let hlsearch_enabled = &hlsearch
   if hlsearch_enabled
      return
   endif

   let cmd_type = getcmdtype()
   let is_search = (cmd_type == "/" || cmd_type == "?")
   if is_search
      set hlsearch
   endif
endfunction

autocmd CursorMoved * call <SID>handle_cursor_moved()
autocmd CmdlineChanged * call <SID>handle_cmdline_changed()
autocmd InsertEnter * set nohlsearch

"Disable hlsearch when abandoning command mode
cnoremap <silent> <C-c> <C-c>:set nohlsearch<CR>

noremap <silent> n :set hlsearch<CR>n
noremap <silent> N :set hlsearch<CR>N
noremap <silent> * :set hlsearch<CR>*
noremap <silent> # :set hlsearch<CR>#
noremap <silent> g* :set hlsearch<CR>g*
noremap <silent> g# :set hlsearch<CR>g#
noremap <silent> gd :set hlsearch<CR>gd
noremap <silent> gD :set hlsearch<CR>gD

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   TODOs                                      "
"                                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Find way to set persistent "very no magic" mode (":set nomagic ignorecase" is close)

"Find way to set multiple highlights of different colors
