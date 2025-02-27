if exists('b:current_syntax') && b:current_syntax =~ 'markdown'
    finish
endif

" @see https://vimhelp.org/usr_44.txt.html
" @see https://learnvimscriptthehardway.stevelosh.com/chapters/46.html
" @see https://learnbyexample.gitbooks.io/vim-reference/content/Regular_Expressions.html
" @see :h /character-classes

syntax keyword markdownNotesChecking    Checking    contained
syntax keyword markdownNotesAlmuerzo    Almuerzo    contained
syntax keyword markdownNotesFDD         FDD         contained

syntax match markdownNotesStatusTodo        /\v(^T: | T: )/ skipempty contained
syntax match markdownNotesStatusInProgress  /\v(^I: | I: )/ skipempty contained
syntax match markdownNotesStatusPullRequest /\v(^P: | P: )/ skipempty contained
syntax match markdownNotesStatusDone        /\v(^D: | D: )/ skipempty contained
syntax match markdownNotesStatusQuality     /\v(^Q: | Q: )/ skipempty contained
syntax match markdownNotesStatusStopped     /\v(^S: | S: )/ skipempty contained

syntax match markdownNotesFix       /\v (<(hot)?fi[x|s]_?>|security):? ?/            skipempty contained
syntax match markdownNotesRefactor  /\v (ref?actor|remove): ?/                       skipempty contained
syntax match markdownNotesTest      /\v (tes?t?s?|tests?\(.*\)): ?/                  skipempty contained
syntax match markdownNotesFeature   /\v (feature|fea[t|r]|db:|<config>|<perf>):? ?/  skipempty contained
syntax match markdownNotesCi        /\v (<c[i|d]>|<core>):? ?/                       skipempty contained
syntax match markdownNotesWip       /\v wip:? ?/                                     skipempty contained
syntax match markdownNotesRevert    /\v Revert /                                     skipempty contained

syntax match markdownNotesHourSunrise /\vT(01|02|03|04|05|06):\d{2}:\d{2}/ skipempty contained
syntax match markdownNotesHourMorning /\vT(07|08|09|10|11|12):\d{2}:\d{2}/ skipempty contained
syntax match markdownNotesHourEvening /\vT(13|14|15|16|17|18):\d{2}:\d{2}/ skipempty contained
syntax match markdownNotesHourNight   /\vT(19|20|21|22|23|00):\d{2}:\d{2}/ skipempty contained

syntax match markdownNotesContent   /[^=]\S\+/
            \ contains=markdownNotesAlmuerzo,markdownNotesFDD,markdownListMarker,markdownNotesHourSunrise,markdownNotesHourMorning,markdownNotesHourEvening,markdownNotesHourNight,markdownNotesFix,markdownNotesRefactor,markdownNotesTest,markdownNotesFeature,markdownNotesCi,markdownNotesWip,markdownNotesRevert,markdownNotesStatusTodo,markdownNotesStatusInProgress,markdownNotesStatusPullRequest,markdownNotesStatusDone,markdownNotesStatusQuality,markdownNotesStatusStopped
            \ skipempty
syntax match markdownNotesTime      /\v \d{2}:\d{2} /
            \ nextgroup=markdownNotesContent
            \ skipempty
syntax match markdownNotesHeader    /\v .* \d{2} of \w* \d{4}$/
            \ nextgroup=markdownNotesTime
            \ skipempty
syntax match markdownNotesSeparator /=\{109}$/

highlight! link markdownNotesChecking   MiningboxOrange
highlight! link markdownNotesAlmuerzo   Comment
highlight! link markdownNotesFDD        Comment

highlight! link markdownNotesStatusTodo         Info
highlight! link markdownNotesStatusInProgress   DiffChange
highlight! link markdownNotesStatusPullRequest  FloatShadow
highlight! link markdownNotesStatusDone         Pmenu
highlight! link markdownNotesStatusQuality      Warning
highlight! link markdownNotesStatusStopped      Error

highlight! link markdownNotesFix        Error
highlight! link markdownNotesRefactor   Todo
highlight! link markdownNotesTest       Info
highlight! link markdownNotesFeature    Done
highlight! link markdownNotesCi         Pmenu
highlight! link markdownNotesWip        Todo
highlight! link markdownNotesRevert     MatchParen

highlight! link markdownNotesHourSunrise    MiningboxPurple
highlight! link markdownNotesHourMorning    MiningboxGreen
highlight! link markdownNotesHourEvening    MiningboxBlue
highlight! link markdownNotesHourNight      MiningboxOrange

highlight! link markdownNotesTime       MiningboxBlue
highlight! link markdownNotesHeader     MiningboxOrange
highlight! link markdownNotesSeparator  Comment

" Don't highlight _ in words
" @see /usr/share/vim/vim91/syntax/markdown.vim:119
highlight! link markdownError Normal
