if exists("b:current_syntax") && b:current_syntax =~ 'vim'
    finish
endif

highlight! link vimVar Identifier
