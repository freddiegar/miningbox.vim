if exists("b:current_syntax") && b:current_syntax =~ 'vim'
    finish
endif

" @see /usr/share/vim/vim91/syntax/vim.vim:1311
highlight! link vimVar Identifier
