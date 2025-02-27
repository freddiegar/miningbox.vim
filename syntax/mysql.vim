if exists('b:current_syntax') && b:current_syntax =~ 'mysql'
    finish
endif

syntax match mysqlComment /\vQuery\s/
syntax match mysqlComment /\vInit DB \w*;/
syntax match mysqlComment /\v^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}.\d{6}Z\s\d{4,6}\s/ containedin=mysqlNumber
