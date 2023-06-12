" -----------------------------------------------------------------------------
" File:         miningbox.vim
" Description:  Dark colorscheme based in Gruvbox (Fantastic!) colorscheme
" Author:       Freddie Gar
" Source:       https://github.com/freddiegar/miningbox
" Thanks:       https://github.com/gruvbox-community/gruvbox
" -----------------------------------------------------------------------------

if exists('g:colors_name') && g:colors_name ==# 'miningbox' && &background ==# get(g:, 'colors_background')
    finish
endif

" Allow changing between dark and light background
let &background=&background

highlight clear

if exists('syntax_on')
    syntax reset
endif

let g:colors_name = 'miningbox'
let g:colors_background = &background

" Palette: {{{

"           Alias               HEX Dark    256  256   HEX Light
let s:colors = {
            \ 'bg0':            ['#1D2021', 234, 230, '#F9F5D7'],
            \ 'bg1':            ['#3C3836', 237, 223, '#EBDBB2'],
            \ 'bg2':            ['#504945', 239, 250, '#D5C4A1'],
            \ 'bg3':            ['#665C54', 241, 248, '#BDAE93'],
            \ 'bg4':            ['#7C6F64', 243, 246, '#A89984'],
            \ 'fg0':            ['#FBF1C7', 229, 235, '#282828'],
            \ 'fg1':            ['#EBDBB2', 223, 237, '#3C3836'],
            \ 'fg2':            ['#D5C4A1', 250, 239, '#504943'],
            \ 'fg3':            ['#BDAE93', 248, 241, '#665C54'],
            \ 'fg4':            ['#A89984', 246, 243, '#7C6F64'],
            \ 'gray':           ['#928374', 245, 245, '#928374'],
            \ 'red':            ['#FB4934', 167, 88,  '#9D0006'],
            \ 'green':          ['#B8BB26', 142, 100, '#79740E'],
            \ 'yellow':         ['#FABD2F', 214, 136, '#B57614'],
            \ 'blue':           ['#83A598', 109, 24,  '#076678'],
            \ 'purple':         ['#D3869B', 175, 96,  '#8F3F71'],
            \ 'aqua':           ['#8EC07C', 108, 65,  '#427B58'],
            \ 'orange':         ['#FE8019', 208, 130, '#AF3A03'],
            \ 'neutral_red':    ['#CC241D', 124, 124, '#CC241D'],
            \ 'neutral_green':  ['#98971A', 106, 106, '#98971A'],
            \ 'neutral_yellow': ['#D79921', 172, 172, '#D79921'],
            \ 'neutral_blue':   ['#458588', 66,   66,  '#458588'],
            \ 'neutral_purple': ['#B16286', 132, 132, '#B16286'],
            \ 'neutral_aqua':   ['#689D6A', 72,   72,  '#689D6A']
            \ }

" }}}

" Setup Colors: (background light mode) {{{

if &background ==# 'light'
    for ncolor in keys(s:colors)
        let s:colors[ncolor] = reverse(s:colors[ncolor])
    endfor
endif

" }}}

" Setup Emphasis: {{{

let s:bold = 'bold,'
let s:italic = ''
let s:underline = 'underline,'
let s:undercurl = 'undercurl,'
let s:inverse = 'inverse,'

" }}}

" Setup Colors: {{{

" let s:vim_bg = ['bg', 'bg']
let s:vim_fg = ['fg', 'fg']
let s:none = ['NONE', 'NONE']

" }}}

" Setup Terminal Colors For Neovim: {{{

if has('nvim')
    let g:terminal_color_0 = s:colors.bg0[0]
    let g:terminal_color_8 = s:colors.gray[0]

    let g:terminal_color_1 = s:colors.neutral_red[0]
    let g:terminal_color_9 = s:colors.red[0]

    let g:terminal_color_2 = s:colors.neutral_green[0]
    let g:terminal_color_10 = s:colors.green[0]

    let g:terminal_color_3 = s:colors.neutral_yellow[0]
    let g:terminal_color_11 = s:colors.yellow[0]

    let g:terminal_color_4 = s:colors.neutral_blue[0]
    let g:terminal_color_12 = s:colors.blue[0]

    let g:terminal_color_5 = s:colors.neutral_purple[0]
    let g:terminal_color_13 = s:colors.purple[0]

    let g:terminal_color_6 = s:colors.neutral_aqua[0]
    let g:terminal_color_14 = s:colors.aqua[0]

    let g:terminal_color_7 = s:colors.fg4[0]
    let g:terminal_color_15 = s:colors.fg1[0]
endif

" }}}

" Setup Terminal Colors For Vim with termguicolors: {{{

if exists('*term_setansicolors')
    let g:terminal_ansi_colors = repeat([0], 16)

    let g:terminal_ansi_colors[0] = s:colors.bg0[0]
    let g:terminal_ansi_colors[8] = s:colors.gray[0]

    let g:terminal_ansi_colors[1] = s:colors.neutral_red[0]
    let g:terminal_ansi_colors[9] = s:colors.red[0]

    let g:terminal_ansi_colors[2] = s:colors.neutral_green[0]
    let g:terminal_ansi_colors[10] = s:colors.green[0]

    let g:terminal_ansi_colors[3] = s:colors.neutral_yellow[0]
    let g:terminal_ansi_colors[11] = s:colors.yellow[0]

    let g:terminal_ansi_colors[4] = s:colors.neutral_blue[0]
    let g:terminal_ansi_colors[12] = s:colors.blue[0]

    let g:terminal_ansi_colors[5] = s:colors.neutral_purple[0]
    let g:terminal_ansi_colors[13] = s:colors.purple[0]

    let g:terminal_ansi_colors[6] = s:colors.neutral_aqua[0]
    let g:terminal_ansi_colors[14] = s:colors.aqua[0]

    let g:terminal_ansi_colors[7] = s:colors.fg4[0]
    let g:terminal_ansi_colors[15] = s:colors.fg1[0]
endif

" }}}

" Highlighting Function: {{{

" @see :highlight syntax
" @see :highlight <GroupName>
" @see :highlight clear <GroupName>
" @see :verbose highlight <GroupName>
" @see :source $VIMRUNTIME/syntax/hitest.vim
" @see https://commons.wikimedia.org/wiki/File:Xterm_256color_chart.svg
" @see https://alvinalexander.com/linux/vi-vim-editor-color-scheme-syntax/
" @see https://terminal.sexy/
" group (string), fg (string), [bg (string), emphasis (string), special (string)]
function! s:HL(group, fg, ...) abort
    " Background
    let l:bg = a:0 >= 1 ? a:1 : s:none

    " Emphasis
    let l:emphasis = (a:0 >= 2 && strlen(a:2) ? a:2 : 'NONE,')[:-2]

    " Highlight
    " term          attributes in a B&W terminal
    " cterm         attributes in a color terminal
    " ctermfg       foreground color in a color terminal
    " ctermbg       background color in a color terminal
    " gui           attributes in the GUI
    " guifg         foreground color in the GUI
    " guibg         background color in the GUI

    " > Options cterm and gui accept bold and underline
    let hl_string = [
                \ 'highlight', a:group,
                \ 'guifg=' . a:fg[0], 'ctermfg=' . a:fg[1],
                \ 'guibg=' . l:bg[0], 'ctermbg=' . l:bg[1],
                \ 'gui=' . l:emphasis, 'cterm=' . l:emphasis
                \ ]

    " Special
    " guisp         used for undercurl and strikethrough
    if a:0 >= 3
        call add(hl_string, 'guisp=' . a:3[0])
    endif

    silent execute join(hl_string, ' ')
endfunction

" }}}

"  Highlight Groups: {{{

" call s:HL('MiningboxFg0', s:colors.fg0)
call s:HL('MiningboxFg1', s:colors.fg1)
" call s:HL('MiningboxFg2', s:colors.fg2)
call s:HL('MiningboxFg3', s:colors.fg3)
call s:HL('MiningboxFg4', s:colors.fg4)
call s:HL('MiningboxGray', s:colors.gray)
call s:HL('MiningboxBg0', s:colors.bg0)
call s:HL('MiningboxBg1', s:colors.bg1)
" call s:HL('MiningboxBg2', s:colors.bg2)
call s:HL('MiningboxBg3', s:colors.bg3)
" call s:HL('MiningboxBg4', s:colors.bg4)

call s:HL('MiningboxRed', s:colors.red)
call s:HL('MiningboxRedBold', s:colors.red, s:none, s:bold)
call s:HL('MiningboxGreen', s:colors.green)
call s:HL('MiningboxGreenBold', s:colors.green, s:none, s:bold)
call s:HL('MiningboxYellow', s:colors.yellow)
call s:HL('MiningboxYellowBold', s:colors.yellow, s:none, s:bold)
call s:HL('MiningboxBlue', s:colors.blue)
" call s:HL('MiningboxBlueBold', s:colors.blue, s:none, s:bold)
call s:HL('MiningboxPurple', s:colors.purple)
" call s:HL('MiningboxPurpleBold', s:colors.purple, s:none, s:bold)
call s:HL('MiningboxAqua', s:colors.aqua)
" call s:HL('MiningboxAquaBold', s:colors.aqua, s:none, s:bold)
call s:HL('MiningboxOrange', s:colors.orange)
call s:HL('MiningboxOrangeBold', s:colors.orange, s:none, s:bold)

call s:HL('MiningboxRedUnderline', s:none, s:none, s:undercurl, s:colors.red)
call s:HL('MiningboxYellowUnderline', s:none, s:none, s:undercurl, s:colors.yellow)

" }}}

" Vanilla colorscheme ---------------------------------------------------------

" General UI: {{{

" Normal text (Need color, in the end it's removed)
call s:HL('Normal', s:colors.fg1, s:colors.bg0)

" Screen line that the cursor is
call s:HL('CursorLine', s:none, s:colors.bg1)
" Screen line number of cursor is
call s:HL('CursorLineNr', (&cursorline ? s:colors.bg1 : s:none), (&cursorline ? s:none : s:colors.bg1), (&cursorline ? s:inverse : ''))
" Screen column that the cursor is
highlight! link CursorColumn CursorLine

" Tab pages line filler
call s:HL('TabLineFill', s:colors.bg4, s:colors.bg1, '')
" Active tab page label
call s:HL('TabLineSel', s:colors.green, s:colors.bg1, '')
" Not active tab page label
highlight! link TabLine TabLineFill

" Match paired bracket under the cursor
call s:HL('MatchParen', s:none, s:colors.bg3, s:bold)

" Highlighted screen columns
call s:HL('ColorColumn', s:none, s:colors.bg1)

" Concealed element: \lambda → λ
call s:HL('Conceal', s:colors.blue, s:none)

highlight! NonText ctermfg=238 guifg=#2E2E2E
highlight! SpecialKey ctermfg=238 guifg=#2E2E2E

call s:HL('Visual', s:none, s:colors.bg3, '')
highlight! link VisualNOS Visual

call s:HL('Search', s:colors.yellow, s:colors.bg0, s:inverse)
call s:HL('IncSearch', s:colors.orange, s:colors.bg0, s:inverse)

call s:HL('QuickFixLine', s:colors.bg0, s:colors.yellow, s:bold)

call s:HL('Underlined', s:colors.blue, s:none, s:underline)

call s:HL('StatusLine', s:colors.bg4, s:none)
" italic, is IMPORTANT: fix ^ char in not current statusline
call s:HL('StatusLineNC', s:colors.bg4, s:none, 'italic,')

" Current match in wildmenu completion
call s:HL('WildMenu', s:colors.blue, s:colors.bg2, s:bold)

" Directory names, special names in listing
highlight! link Directory MiningboxGreenBold

" Titles for output from :set all, :autocmd, etc.
highlight! link Title MiningboxGreenBold

" Error messages on the command line
call s:HL('ErrorMsg', s:colors.bg0, s:colors.red, s:bold)
" More prompt: -- More --
highlight! link MoreMsg MiningboxYellowBold
" Current mode message: -- INSERT --
highlight! link ModeMsg MiningboxYellowBold
" 'Press enter' prompt and yes/no questions
highlight! link Question MiningboxOrangeBold
" Warning messages
highlight! link WarningMsg MiningboxRedBold

" Line number for :number and :# commands
call s:HL('LineNr', s:colors.bg4, s:none)
" Column where signs are displayed
call s:HL('SignColumn', s:colors.bg4, s:none)
" Line used for closed folds
call s:HL('Folded', s:colors.gray, s:colors.bg1, s:italic)
" Column where folds are displayed
call s:HL('FoldColumn', s:colors.gray, s:colors.bg1)

" }}}

" Cursor: {{{

" Character under cursor
call s:HL('Cursor', s:none, s:none, s:inverse)
" Visual mode cursor, selection
highlight! link vCursor Cursor
" Input mode cursor
highlight! link iCursor Cursor
" Language mapping cursor
highlight! link lCursor Cursor

" }}}

" Syntax Highlighting: {{{

highlight! link Special MiningboxOrange

call s:HL('Comment', s:colors.gray, s:none, s:italic)
call s:HL('Todo', s:vim_fg, s:none, s:bold . s:italic)
call s:HL('Error', s:colors.red, s:none, s:bold . s:inverse)
call s:HL('Warning', s:colors.orange, s:none, s:bold . s:inverse)

" Generic statement
highlight! link Statement MiningboxRed
" if, then, else, endif, switch, etc.
highlight! link Conditional MiningboxRed
" for, do, while, etc.
highlight! link Repeat MiningboxRed
" case, default, etc.
highlight! link Label MiningboxRed
" try, catch, throw
highlight! link Exception MiningboxRed
" sizeof, "+", "*", etc.
highlight! link Operator MiningboxFg1
" Any other keyword
highlight! link Keyword MiningboxRed

" Variable name
highlight! link Identifier MiningboxBlue
" Function name
highlight! link Function MiningboxGreenBold

" Generic preprocessor
highlight! link PreProc MiningboxAqua
" Preprocessor #include
highlight! link Include MiningboxAqua
" Preprocessor #define
highlight! link Define MiningboxAqua
" Same as Define
highlight! link Macro MiningboxAqua
" Preprocessor #if, #else, #endif, etc.
highlight! link PreCondit MiningboxAqua

" Generic constant
highlight! link Constant MiningboxPurple
" Character constant: 'c', '/n'
highlight! link Character MiningboxPurple
" Strings: "this is a string"
call s:HL('String', s:colors.green, s:none)
" Boolean constant: TRUE, false
highlight! link Boolean MiningboxPurple
" Number constant: 234, 0xff
highlight! link Number MiningboxPurple
" Floating point constant: 2.3e10
highlight! link Float MiningboxPurple

" Generic type
highlight! link Type MiningboxYellow
" static, register, volatile, etc
highlight! link StorageClass MiningboxOrange
" struct, union, enum, etc.
highlight! link Structure MiningboxAqua
" typedef
highlight! link Typedef MiningboxYellow

" }}}

" Terminal: {{{

call s:HL('Terminal', s:none, s:colors.bg0)
call s:HL('StatusLineTerm', s:colors.bg4, s:none)
call s:HL('StatusLineTermNC', s:colors.bg4, s:none, s:italic)

" }}}

" Completion Menu: {{{

" Popup menu: normal item
call s:HL('Pmenu', s:colors.fg1, s:colors.bg2)
" Popup menu: selected item
call s:HL('PmenuSel', s:colors.bg2, s:colors.blue, s:bold)
" Popup menu: scrollbar
call s:HL('PmenuSbar', s:none, s:colors.bg2)
" Popup menu: scrollbar thumb
call s:HL('PmenuThumb', s:none, s:colors.bg4)

" }}}

" Diffs: {{{

call s:HL('DiffDelete', s:colors.red, s:colors.bg0, s:inverse)
call s:HL('DiffAdd',    s:colors.green, s:colors.bg0, s:inverse)

" Alternative setting
call s:HL('DiffChange', s:colors.aqua, s:colors.bg0, s:inverse)
call s:HL('DiffText',   s:colors.yellow, s:colors.bg0, s:inverse)

" }}}

" Plugin specific -------------------------------------------------------------

" Sneak: {{{

highlight! link Sneak Cursor
highlight! link SneakScope Search
highlight! link SneakLabel Search

" Signature: {{{

call s:HL('SignatureMarkText', s:colors.bg4, s:none)
call s:HL('SignatureMarkerText', s:colors.bg4, s:none)

" }}}

" GitGutter: {{{

call s:HL('GitGutterAdd', s:colors.bg4, s:none)
call s:HL('GitGutterChange', s:colors.bg4, s:none)
call s:HL('GitGutterDelete', s:colors.bg4, s:none)
call s:HL('GitGutterChangeDelete', s:colors.bg4, s:none)

" }}}

" ALE: {{{

highlight! link ALEError MiningboxRedUnderline
highlight! link ALEWarning MiningboxYellowUnderline

" ALE sign with same color of theme
call s:HL('ALEErrorSign', s:none, s:colors.neutral_red)
call s:HL('ALEWarningSign', s:none, s:colors.neutral_red)

" Custom color #1 in statusline
call s:HL('User1', s:none, s:colors.neutral_red)

" }}}

" FZF: {{{
" Usage: 'bg+': ['bg', 'CursorLine', 'CursorColumn', ...]
"          │       │          │           │
"          │       │          │           ╰─ if not set fallback CursorLine, so on so far
"          │       │          ╰─ first try use CursorLine
"          │       ╰─ highlight
"          ╰─ item

" Example:
"                       ╭ hl
"   marker ─╮         ╭────╮
"        │  >[4]     p[ermi]ssions.md <- fg (letters) <- bg (background)            │                │ │
"        │ > [3] #   [ermi]ne.md (cursorline) <- fg+ (letters) <- bg+ (background)  │    Preview     │ │
"        │ │         ╰────╯                                                         │                │ │
"  pointer ╯            ╰ hl+                                                       │     window     │ │
"    header   ╮                                                                     │                │ │
"        │   ╭─╮                                                                    │                │ │
"        │   [2] %   .vimrc                                                         │                │ │
"    info -> 2/2 ───────────────────────────────────────────────────────────────────│                │ │
" prompt -> Buf> ermi                                                               ╰────────────────╯ │
"        ╰─────────────────────────────────────────────────────────────────────────────────────────────╯

let g:fzf_colors = {
            \ 'fg':      ['fg', 'MiningboxFg1'],
            \ 'bg':      ['fg', 'MiningboxBg0'],
            \ 'hl':      ['fg', 'MiningboxYellow'],
            \ 'fg+':     ['fg', 'MiningboxFg1'],
            \ 'bg+':     ['fg', 'MiningboxBg1'],
            \ 'hl+':     ['fg', 'MiningboxYellow'],
            \ 'info':    ['fg', 'MiningboxBlue'],
            \ 'prompt':  ['fg', 'MiningboxFg4'],
            \ 'pointer': ['fg', 'MiningboxBlue'],
            \ 'marker':  ['fg', 'MiningboxOrange'],
            \ 'spinner': ['fg', 'MiningboxYellow'],
            \ 'header':  ['fg', 'MiningboxBg3']
            \ }

" Fzf statusline
call s:HL('Fzf1', s:colors.blue, s:colors.bg1)
call s:HL('Fzf2', s:colors.orange, s:colors.bg1)
call s:HL('Fzf3', s:colors.fg4, s:colors.bg1)

" }}}

" Netrw: {{{

highlight! link netrwDir MiningboxAqua
highlight! link netrwClassify MiningboxAqua
highlight! link netrwLink MiningboxGray
highlight! link netrwSymLink MiningboxFg1
highlight! link netrwExe MiningboxYellow
highlight! link netrwComment MiningboxGray
highlight! link netrwList MiningboxBlue
highlight! link netrwHelpCmd MiningboxAqua
highlight! link netrwCmdSep MiningboxFg3
highlight! link netrwVersion MiningboxGreen

" }}}

" Filetype specific -----------------------------------------------------------

" diff: {{{

highlight! link diffAdded MiningboxGreen
highlight! link diffRemoved MiningboxRed
highlight! link diffChanged MiningboxAqua

highlight! link diffFile MiningboxOrange
highlight! link diffNewFile MiningboxYellow

highlight! link diffLine MiningboxBlue

" }}}

" Custom specific: {{{

" Transparency
if !has('gui_running') && &background ==# 'dark'
    highlight! Normal guibg=NONE ctermbg=NONE
endif

" GitGutter sign column
highlight! link CursorLineSign LineNr

" The column separating vertically split windows
highlight! link VertSplit LineNr

" End of buffer with same color of theme
highlight! link EndOfBuffer LineNr

" }}}
