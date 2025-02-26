if exists("b:current_syntax") && b:current_syntax =~ 'sql'
    finish
endif

" Don't highlight logs debug
"                   |
" ╭───────────────────────────────────────╮
"  2025-02-26T00:16:32.001854Z 42584 Query SET NAMES utf8mb4;
"  2025-02-26T00:16:32.001854Z 42584 Init DB wordpress;

syntax match sqlComment /\vQuery\s/
syntax match sqlComment /\vInit DB \w*;/
syntax match sqlComment /\v^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}.\d{6}Z\s\d{4,6}\s/ containedin=sqlNumber
