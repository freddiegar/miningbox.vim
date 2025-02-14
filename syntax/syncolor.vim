if exists('g:colors_name')
    finish
endif

" Unwanted spaces
highlight! link ExtraWhitespace Error
highlight! link WeirdWhitespace Warning

" " Unwanted long lines
" highlight! link OverLenght Error

augroup miningbox
    autocmd!

    " Highlight diff markers. Please NOT! in notes this is AWFUL ... and only it's applied in Vim
    " @see :h :match
    " autocmd BufWinEnter * match Error /\v^[<>=\|]{4,7}\s?[a-zA-Z-_]*$/

    " Trailing spaces. There are cleaned, then, doesnt matter ...  and only it's applied in Vim
    " @see https://vim.fandom.com/wiki/Highlight_unwanted_spaces
    " autocmd BufWinEnter * 2match ExtraWhitespace /\s\+$/
    " autocmd InsertEnter * 2match ExtraWhitespace /\s\+\%#\@<!$/
    " autocmd InsertLeave * 2match ExtraWhitespace /\s\+$/

    " Char 160
    " @see https://www.codetable.net/decimal/160
    autocmd BufWinEnter * 3match WeirdWhitespace / \+/

    " " Highlight color column on exceeds textwidth
    " " Sometimes is slower and unpredictable
    " autocmd BufWinEnter * if exists('b:current_syntax')
    "             \ && expand('<afile>:e') ==# 'php'
    "             \ && &textwidth
    "             \ | let w:miningbox_overlengh_id = matchadd('OverLenght', '\%<' . (&textwidth + 2) . 'v.\%>' . (&textwidth + 1) . 'v', 3)
    "             \ | endif

    " autocmd BufWinLeave * if exists('b:current_syntax')
    "             \ && exists('w:miningbox_overlengh_id')
    "             \ | silent! call matchdelete(w:miningbox_overlengh_id)
    "             \ | endif
augroup END
