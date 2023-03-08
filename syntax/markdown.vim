if exists("b:current_syntax")
    finish
endif

" Don't highlight _ in words
" @see /usr/share/vim/vim90/syntax/markdown.vim:119
highlight link markdownError Normal
