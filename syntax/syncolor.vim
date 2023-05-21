if exists('g:colors_name')
    finish
endif

" Unwanted spaces
highlight! link ExtraWhitespace Error
highlight! link WeirdWhitespace Warning

" Unwanted long lines
highlight! link OverLenght Error

augroup miningbox
    autocmd!

    " Trailing spaces
    " @see https://vim.fandom.com/wiki/Highlight_unwanted_spaces
    autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
    autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
    autocmd InsertLeave * match ExtraWhitespace /\s\+$/

    " Char 160
    " @see https://www.codetable.net/decimal/160
    autocmd BufWinEnter * 2match WeirdWhitespace / \+/

    " Highlight color column on exceeds textwidth
    autocmd BufWinEnter * if exists('b:current_syntax')
                \ && expand('<afile>:e') ==# 'php'
                \ && &textwidth
                \ | let w:miningbox_overlengh_id = matchadd('OverLenght', '\%<' . (&textwidth + 2) . 'v.\%>' . (&textwidth + 1) . 'v', 3)
                \ | endif

    autocmd BufWinLeave * if exists('b:current_syntax')
                \ && exists('w:miningbox_overlengh_id')
                \ | silent! call matchdelete(w:miningbox_overlengh_id)
                \ | endif
augroup END
