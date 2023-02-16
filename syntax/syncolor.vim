augroup miningbox
    autocmd!

    " Unwanted spaces
    " @see https://vim.fandom.com/wiki/Highlight_unwanted_spaces
    autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
    autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
    autocmd InsertLeave * match ExtraWhitespace /\s\+$/

    " Char 160
    " @see https://www.codetable.net/decimal/160
    autocmd BufWinEnter * match WeirdWhitespace / \+/
    autocmd InsertEnter * match WeirdWhitespace / \+\%#\@<!/
    autocmd InsertLeave * match WeirdWhitespace / \+/

    autocmd BufWinLeave * call clearmatches()
augroup END
