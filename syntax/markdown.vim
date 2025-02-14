if exists("b:current_syntax") && b:current_syntax =~ 'markdown'
    finish
endif

" @see https://vimhelp.org/usr_44.txt.html
" @see https://learnvimscriptthehardway.stevelosh.com/chapters/46.html
" @see https://learnbyexample.gitbooks.io/vim-reference/content/Regular_Expressions.html
" @see :h /character-classes

syntax keyword markdownNotesChecking Checking
syntax match markdownNotesContent /[^=]\S\+/ contains=markdownListMarker skipempty
syntax match markdownNotesTime /\v \d{2}:\d{2} / nextgroup=markdownNotesContent skipempty
syntax match markdownNotesHeader /\v .* \d{2} of \w* \d{4}$/ nextgroup=markdownNotesTime skipempty
syntax match markdownNotesSeparator /=\{109}$/

highlight! link markdownNotesChecking MiningboxOrange
highlight! link markdownNotesTime MiningboxBlue
highlight! link markdownNotesHeader MiningboxOrange
highlight! link markdownNotesSeparator Comment

" Don't highlight _ in words
" @see /usr/share/vim/vim91/syntax/markdown.vim:119
highlight! link markdownError Normal
