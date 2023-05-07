if exists("b:current_syntax") && b:current_syntax =~ 'php'
    finish
endif

" Keywords: use
syntax match phpUseNamespaceSeparator "\\" contained display
syntax keyword phpInclude use contained
      \ nextgroup=phpUseFunction,phpUseClass skipwhite skipempty
syntax match phpUseFunction /function\_s\+\(\\\|\h\w*\)*\h\w*/ contained contains=phpUseKeyword
      \ nextgroup=phpUseAlias skipwhite skipempty
syntax match phpUseClass /\(function\_s\+\)\@!\(\\\|\h\w*\)*\h\w*/ contained contains=phpUseNamespaceSeparator
      \ nextgroup=phpUseAlias skipwhite skipempty
syntax match phpUseAlias /as\_s\+\h\w*/ contained contains=phpUseKeyword
syntax match phpUseKeyword /\(function\|as\)\_s\+/ contained contains=phpKeyword

" Keywords: function
syntax keyword phpKeyword function contained
      \ nextgroup=phpFunction skipwhite skipempty
syntax match phpFunction /\h\w*/ contained

" Keywords: class, interface, trait, etc
highlight def link phpStructure     StorageClass
" Keywords: use, include, require, etc
highlight def link phpInclude       StorageClass
" Keywords: new, clone, function, fn, echo, etc
highlight def link phpDefine        StorageClass

" Keywords: as in use statement
highlight def link phpUseKeyword    phpKeyword

" Keywords: built-in interfaces, ie: DateTimeInterface
highlight def link phpInterfaces    phpClass
" Keywords: built-in classes, ie: Exception, DateTime
highlight def link phpClasses       phpClass

" Keywords: isset, unset, eval, etc
highlight def link phpSpecialFunction   phpStatement

" Keywords: @param, @return, etc
highlight def link phpDocTags           phpComment
" Keywords: @dataProvider, etc
highlight def link phpDocCustomTags     phpComment
