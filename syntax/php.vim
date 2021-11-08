if exists("b:current_syntax")
  finish
endif

highlight def link phpStructure     StorageClass
highlight def link phpInclude       StorageClass
highlight def link phpDefine        StorageClass
highlight def link phpDocTags       phpComment

