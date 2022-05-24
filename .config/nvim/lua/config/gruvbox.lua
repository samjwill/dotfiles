vim.cmd([[
    try
        colorscheme gruvbox

        "Gruvbox breaks this at the time of writing for Termdebug
        hi debugPC term=reverse ctermbg=66 guibg='#458588'

        "TODO: see if you can use named colors instead of hard-coding hex codes
        augroup INIT_STATUSLINE_COLORS | autocmd!
            "Toggle new color when in insert mode
            autocmd InsertEnter * highlight StatusLine ctermfg=108 ctermbg=237 guifg='#8ec07c' guibg='#3c3836'
            autocmd InsertLeave * highlight StatusLine ctermfg=239 ctermbg=223 guifg='#504945' guibg='#ebdbb2'
            autocmd TermEnter * highlight StatusLine ctermfg=108 ctermbg=237 guifg='#8ec07c' guibg='#3c3836'
            autocmd TermLeave * highlight StatusLine ctermfg=239 ctermbg=223 guifg='#504945' guibg='#ebdbb2'
        augroup end
    catch
    endtry
]])

