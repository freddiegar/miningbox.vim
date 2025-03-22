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

let s:istty = $TERM ==# 'linux' && !has('gui_running')

if !exists('g:colors_name') && filereadable(expand('~/.Xresources'))
    " Detect background using Xresources
    "   Option 1: [95]#1D2021
    "   Option 2: #1D2021
    let s:hexacolor = system('xrdb -query | grep background -m 1 | cut -f 2 | tr -d "\n"')
    let &background = s:istty || (s:hexacolor[0] ==# '[' && match(split(s:hexacolor, '#')[1][0], '[0-7]') == 0) || match(s:hexacolor[1], '[0-7]') == 0 ? 'dark' : 'light'
else
    " Allow changing between dark and light background
    let &background = &background
endif

highlight clear

if exists('syntax_on')
    syntax reset
endif

let g:colors_name = 'miningbox'
let g:colors_background = &background

" Palette: {{{

"           Alias               HEX Dark    256  16  256   HEX Light
let s:colors = {
            \ 'bg0':            ['#1D2021', 234,  0, 230, '#F9F5D7'],
            \ 'bg1':            ['#3C3836', 237, -1, 223, '#EBDBB2'],
            \ 'bg2':            ['#504945', 239, -1, 250, '#D5C4A1'],
            \ 'bg3':            ['#665C54', 241, -1, 248, '#BDAE93'],
            \ 'bg4':            ['#7C6F64', 243, -1, 246, '#A89984'],
            \ 'fg0':            ['#FBF1C7', 229, -1, 235, '#282828'],
            \ 'fg1':            ['#EBDBB2', 223, 15, 237, '#3C3836'],
            \ 'fg2':            ['#D5C4A1', 250, -1, 239, '#504943'],
            \ 'fg3':            ['#BDAE93', 248, -1, 241, '#665C54'],
            \ 'fg4':            ['#A89984', 246,  7, 243, '#7C6F64'],
            \ 'gray':           ['#928374', 245,  8, 245, '#928374'],
            \ 'red':            ['#FB4934', 167,  9, 88,  '#9D0006'],
            \ 'green':          ['#B8BB26', 142, 10, 100, '#79740E'],
            \ 'yellow':         ['#FABD2F', 214, 11, 136, '#B57614'],
            \ 'blue':           ['#83A598', 109, 12, 24,  '#076678'],
            \ 'purple':         ['#D3869B', 175, 13, 96,  '#8F3F71'],
            \ 'aqua':           ['#8EC07C', 108, 14, 65,  '#427B58'],
            \ 'orange':         ['#FE8019', 208, -1, 130, '#AF3A03'],
            \ 'neutral_red':    ['#CC241D', 124,  1, 124, '#CC241D'],
            \ 'neutral_green':  ['#98971A', 106,  2, 106, '#98971A'],
            \ 'neutral_yellow': ['#D79921', 172,  3, 172, '#D79921'],
            \ 'neutral_blue':   ['#458588', 66,   4, 66,  '#458588'],
            \ 'neutral_purple': ['#B16286', 132,  5, 132, '#B16286'],
            \ 'neutral_aqua':   ['#689D6A', 72,   6, 72,  '#689D6A']
            \ }

" }}}

" Setup Colors: (background light mode) {{{

if &background ==# 'light'
    for ncolor in keys(s:colors)
        let s:colors[ncolor] = reverse(s:colors[ncolor])
    endfor
endif

" }}}

" Setup Colors: (on terminal uses 16 colors) {{{

if s:istty
    let s:colors.bg0[1] = s:colors.bg0[2]
    let s:colors.fg4[1] = s:colors.fg4[2]
    let s:colors.gray[1] = s:colors.gray[2]
    let s:colors.red[1] = s:colors.red[2]
    let s:colors.green[1] = s:colors.green[2]
    let s:colors.yellow[1] = s:colors.yellow[2]
    let s:colors.blue[1] = s:colors.blue[2]
    let s:colors.purple[1] = s:colors.purple[2]
    let s:colors.aqua[1] = s:colors.aqua[2]
    let s:colors.fg1[1] = s:colors.fg1[2]
endif

" }}}

" Setup Emphasis: {{{

let s:bold = ''
let s:italic = ''
let s:underline = 'underline,'
let s:undercurl = 'undercurl,'
let s:inverse = 'inverse,'
let s:strikethrough = 'strikethrough,'

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

call s:HL('MiningboxFg0', s:colors.fg0)
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
call s:HL('MiningboxBlueBold', s:colors.blue, s:none, s:bold)
call s:HL('MiningboxPurple', s:colors.purple)
" call s:HL('MiningboxPurpleBold', s:colors.purple, s:none, s:bold)
call s:HL('MiningboxAqua', s:colors.aqua)
" call s:HL('MiningboxAquaBold', s:colors.aqua, s:none, s:bold)
call s:HL('MiningboxOrange', s:colors.orange)
call s:HL('MiningboxOrangeBold', s:colors.orange, s:none, s:bold)

call s:HL('MiningboxRedUnderline', s:none, s:none, s:undercurl, s:colors.red)
call s:HL('MiningboxYellowUnderline', s:none, s:none, s:undercurl, s:colors.yellow)
call s:HL('MiningboxBlueUnderline', s:none, s:none, s:undercurl, s:colors.blue)
call s:HL('MiningboxAquaUnderline', s:none, s:none, s:undercurl, s:colors.aqua)
call s:HL('MiningboxPurpleUnderline', s:none, s:none, s:undercurl, s:colors.purple)

" }}}

" Vanilla colorscheme ---------------------------------------------------------

" General UI: {{{

" Normal text (Need color, in the end it's removed)
call s:HL('Normal', s:colors.fg1, s:colors.bg0)
call s:HL('NormalFloat', s:colors.fg1, s:colors.bg1)
highlight! link NormalNC Normal

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

" Invisible chars
" Whitespace extends from NonText
call s:HL('NonText', s:colors.bg3, s:none)
highlight! link SpecialKey NonText

call s:HL('Visual', (s:istty ? s:colors.gray : s:none), s:colors.bg3, s:inverse)
highlight! link VisualNOS Visual

call s:HL('Search', s:colors.yellow, s:colors.bg0, s:inverse)
call s:HL('IncSearch', s:colors.orange, s:colors.bg0, s:inverse)
highlight! link CurSearch IncSearch

call s:HL('QuickFixLine', s:colors.bg0, s:colors.yellow, s:bold)

call s:HL('Underlined', s:colors.blue, s:none, s:underline)

" italic, is IMPORTANT: highlight current statusline
call s:HL('StatusLine', s:colors.bg4, s:none, 'italic,')
call s:HL('StatusLineNC', s:colors.bg4, s:none)

call s:HL('WinBar', s:colors.fg4, s:colors.bg0)
call s:HL('WinBarNC', s:colors.fg3, s:colors.bg1)
call s:HL('WinSeparator', s:colors.bg3, s:none)

" Current match in wildmenu completion
call s:HL('WildMenu', s:colors.blue, s:colors.bg2, s:bold)

" Directory names, special names in listing
highlight! link Directory MiningboxGreenBold

" Delimeters: (, [, {
highlight! link Delimiter MiningboxOrange

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
call s:HL('Todo', s:colors.yellow, s:none, s:bold . s:inverse)
call s:HL('Done', s:colors.green, s:none, s:bold . s:inverse)
call s:HL('Error', s:colors.red, s:none, s:bold . s:inverse)
call s:HL('Warning', s:colors.orange, s:none, s:bold . s:inverse)
call s:HL('Info', s:colors.blue, s:none, s:bold . s:inverse)

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
" highlight! link Keyword MiningboxOrange

" Variable name
highlight! link Identifier MiningboxBlue
" Function name
highlight! link Function MiningboxFg1

" Generic preprocessor
highlight! link PreProc MiningboxAqua
" Preprocessor #include
highlight! link Include MiningboxOrange
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
highlight! link Type MiningboxFg1
" static, register, volatile, etc
highlight! link StorageClass MiningboxOrange
" struct, union, enum, etc.
highlight! link Structure MiningboxAqua
" type definition
highlight! link Typedef MiningboxFg1

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

" Spell: {{{

highlight! link SpellCap MiningboxBlueUnderline
highlight! link SpellBad MiningboxRedUnderline
highlight! link SpellLocal MiningboxAquaUnderline
highlight! link SpellRare MiningboxPurpleUnderline

" }}}

" Plugin specific -------------------------------------------------------------

" Sneak: justinmk/vim-sneak {{{

highlight! link Sneak Cursor
highlight! link SneakScope Search
highlight! link SneakLabel Search

" }}}

" Signature: kshenoy/vim-signature{{{

call s:HL('SignatureMarkText', s:colors.bg4, s:none)
call s:HL('SignatureMarkerText', s:colors.bg4, s:none)

" }}}

" GitGutter: airblade/vim-gitgutter {{{

call s:HL('GitGutterAdd', s:colors.bg4, s:none)
call s:HL('GitGutterChange', s:colors.bg4, s:none)
call s:HL('GitGutterDelete', s:colors.bg4, s:none)
call s:HL('GitGutterChangeDelete', s:colors.bg4, s:none)

" }}}

" GitSigns: lewis6991/gitsigns.nvim {{{

call s:HL('GitSignsAdd', s:colors.bg4, s:none)
call s:HL('GitSignsChange', s:colors.bg4, s:none)
call s:HL('GitSignsDelete', s:colors.bg4, s:none)
call s:HL('GitSignsChangeDelete', s:colors.bg4, s:none)
call s:HL('GitSignsStagedAdd', s:colors.bg4, s:none)
call s:HL('GitSignsStagedChange', s:colors.bg4, s:none)
call s:HL('GitSignsStagedDelete', s:colors.bg4, s:none)
call s:HL('GitSignsStagedChangeDelete', s:colors.bg4, s:none)
highlight! link GitSignsCurrentLineBlame LineNr

" }}}

" ALE: dense-analysis/ale {{{

highlight! link ALEError MiningboxRedUnderline
highlight! link ALEWarning MiningboxYellowUnderline
highlight! link ALEInfo MiningboxBlueUnderline

" ALE sign with same color of theme
call s:HL('ALEErrorSign', s:none, s:colors.neutral_red)
call s:HL('ALEWarningSign', s:none, s:colors.neutral_red)
call s:HL('ALEInfoSign', s:none, s:colors.neutral_blue)

" Custom color # in statusline
call s:HL('User1', s:none, s:colors.neutral_red)
call s:HL('User2', s:none, s:colors.neutral_yellow)
call s:HL('User3', s:colors.neutral_yellow, s:none)

" }}}

" FZF: junegunn/fzf.vim {{{
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

" Nvim specific {{{

if has('nvim')

    " Cmp: hrsh7th/nvim-cmp {{{

    highlight! link CmpItemAbbr MiningboxFg0
    highlight! link CmpItemAbbrDeprecated MiningboxFg1
    highlight! link CmpItemAbbrMatch MiningboxBlueBold
    highlight! link CmpItemAbbrMatchFuzzy MiningboxBlueUnderline
    highlight! link CmpItemMenu MiningboxGray
    highlight! link CmpItemKindText MiningboxOrange
    highlight! link CmpItemKindVariable MiningboxOrange
    highlight! link CmpItemKindMethod MiningboxBlue
    highlight! link CmpItemKindFunction MiningboxBlue
    highlight! link CmpItemKindConstructor MiningboxYellow
    highlight! link CmpItemKindUnit MiningboxBlue
    highlight! link CmpItemKindField MiningboxBlue
    highlight! link CmpItemKindClass MiningboxYellow
    highlight! link CmpItemKindInterface MiningboxYellow
    highlight! link CmpItemKindModule MiningboxBlue
    highlight! link CmpItemKindProperty MiningboxBlue
    highlight! link CmpItemKindValue MiningboxOrange
    highlight! link CmpItemKindEnum MiningboxYellow
    highlight! link CmpItemKindOperator MiningboxYellow
    highlight! link CmpItemKindKeyword MiningboxPurple
    highlight! link CmpItemKindEvent MiningboxPurple
    highlight! link CmpItemKindReference MiningboxPurple
    highlight! link CmpItemKindColor MiningboxPurple
    highlight! link CmpItemKindSnippet MiningboxGreen
    highlight! link CmpItemKindFile MiningboxBlue
    highlight! link CmpItemKindFolder MiningboxBlue
    highlight! link CmpItemKindEnumMember MiningboxAqua
    highlight! link CmpItemKindConstant MiningboxOrange
    highlight! link CmpItemKindStruct MiningboxYellow
    highlight! link CmpItemKindTypeParameter MiningboxYellow

    " }}}

    " Mason: williamboman/mason.nvim {{{

    highlight! link MasonHighlight GruvboxAqua
    call s:HL('MasonHighlightBlock', s:colors.bg0, s:colors.blue)
    call s:HL('MasonHighlightBlockBold', s:colors.bg0, s:colors.blue, s:bold)
    call s:HL('MasonHighlightSecondary', s:colors.yellow, s:none)
    call s:HL('MasonHighlightBlockSecondary', s:colors.bg0, s:colors.yellow)
    call s:HL('MasonHighlightBlockBoldSecondary', s:colors.bg0, s:colors.yellow, s:bold)
    highlight! link MasonHeader MasonHighlightBlockBoldSecondary
    highlight! link MasonHeaderSecondary MasonHighlightBlockBold
    call s:HL('MasonMuted', s:colors.fg4, s:none)
    call s:HL('MasonMutedBlock', s:colors.bg0, s:colors.fg4)
    call s:HL('MasonMutedBlockBold', s:colors.bg0, s:colors.fg4, s:bold)

    " }}}

endif

" }}}

" Filetype specific -----------------------------------------------------------

" diff: {{{

highlight! link diffAdded MiningboxGreen
highlight! link diffRemoved MiningboxRed
highlight! link diffChanged MiningboxAqua

highlight! link diffFile MiningboxBlue
highlight! link diffNewFile MiningboxOrange
highlight! link diffOldFile MiningboxYellow

highlight! link diffLine MiningboxGray
highlight! link diffIndexLine MiningboxPurple

" }}}

" Custom specific: {{{

" Transparency (Very important in Light mode!)
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

" Treesitter: nvim-treesitter/nvim-treesitter {{{

if has('nvim')
    highlight! link LspInlayHint Comment

    " highlight! link DiagnosticError Comment
    highlight! link DiagnosticWarn Comment
    highlight! link DiagnosticInfo Comment
    highlight! link DiagnosticHint Comment
    highlight! link DiagnosticOk Comment

    highlight! link DiagnosticUnnecessary Comment
    highlight! link DiagnosticDeprecated Comment

    highlight! link DiagnosticUnderlineError DiagnosticError
    highlight! link DiagnosticUnderlineWarn DiagnosticWarn
    highlight! link DiagnosticUnderlineInfo DiagnosticInfo
    highlight! link DiagnosticUnderlineHint DiagnosticHint
    highlight! link DiagnosticUnderlineOk DiagnosticOk

    highlight! link DiagnosticSignError MiningboxRed
    highlight! link DiagnosticSignWarn MiningboxYellow
    highlight! link DiagnosticSignInfo Comment
    highlight! link DiagnosticSignHint Comment
    highlight! link DiagnosticSignOk Comment

    highlight! link @comment Comment
    call s:HL('@none', s:none, s:none) " ['@none'] = {fg = 'NONE',  bg = 'NONE' },
    highlight! link @preproc PreProc
    highlight! link @define Define
    highlight! link @operator Operator
    highlight! link @punctuation.delimiter MiningboxFg1
    highlight! link @punctuation.bracket Delimiter
    highlight! link @punctuation.special MiningboxFg1
    highlight! link @string String
    highlight! link @string.regex String
    highlight! link @string.regexp String
    highlight! link @string.escape SpecialChar
    highlight! link @string.special SpecialChar
    highlight! link @string.special.path Underlined
    highlight! link @string.special.symbol Identifier
    highlight! link @string.special.url Underlined
    highlight! link @character Character
    highlight! link @character.special SpecialChar
    highlight! link @boolean Boolean
    highlight! link @number Number
    highlight! link @number.float Float
    highlight! link @float Float
    highlight! link @function Function
    highlight! link @function.builtin Special
    highlight! link @function.call Function
    highlight! link @function.macro Macro
    highlight! link @function.method Function
    highlight! link @method Function
    highlight! link @method.call Function
    highlight! link @constructor Special
    highlight! link @parameter Identifier
    highlight! link @keyword Keyword
    highlight! link @keyword.conditional Conditional
    highlight! link @keyword.debug Debug
    highlight! link @keyword.directive PreProc
    highlight! link @keyword.directive.define Define
    highlight! link @keyword.exception Exception
    highlight! link @keyword.function Keyword
    highlight! link @keyword.import Include
    highlight! link @keyword.operator MiningboxRed
    highlight! link @keyword.repeat Repeat
    highlight! link @keyword.return MiningboxRed
    highlight! link @keyword.storage StorageClass
    highlight! link @conditional Conditional
    highlight! link @repeat Repeat
    highlight! link @debug Debug
    highlight! link @label Label
    highlight! link @include Include
    highlight! link @exception Exception
    highlight! link @type Type
    highlight! link @type.builtin MiningboxYellow
    highlight! link @type.definition Typedef
    highlight! link @type.qualifier Keyword
    highlight! link @storageclass StorageClass
    highlight! link @attribute PreProc
    highlight! link @field Identifier
    highlight! link @property Identifier
    highlight! link @variable Identifier
    highlight! link @variable.builtin Special
    highlight! link @variable.member Identifier
    highlight! link @variable.parameter Identifier
    highlight! link @constant Constant
    highlight! link @constant.builtin MiningboxYellow
    highlight! link @constant.macro Define
    highlight! link @markup MiningboxFg1
    call s:HL('@markup.strong', s:none, s:none, s:bold) " ['@markup.strong'] = { bold = config.bold },
    call s:HL('@markup.emphasis', s:none, s:none, s:italic) " ['@markup.emphasis'] = { italic = config.italic.emphasis },
    call s:HL('@markup.italic', s:none, s:none, s:italic) " ['@markup.emphasis'] = { italic = config.italic.emphasis },
    call s:HL('@markup.underline', s:none, s:none, s:underline) " ['@markup.underline'] = { underline = config.underline },
    call s:HL('@markup.strike', s:none, s:none, s:strikethrough) " ['@markup.strike'] = { strikethrough = config.strikethrough },
    call s:HL('@markup.strikethrough', s:none, s:none, s:strikethrough) " ['@markup.strike'] = { strikethrough = config.strikethrough },
    highlight! link @markup.heading Title
    highlight! link @markup.raw String
    highlight! link @markup.math Special
    highlight! link @markup.environment Macro
    highlight! link @markup.environment.name Type
    highlight! link @markup.link Underlined
    highlight! link @markup.link.label SpecialChar
    highlight! link @markup.list Delimiter
    highlight! link @markup.list.checked MiningboxGreen
    highlight! link @markup.list.unchecked MiningboxGray
    highlight! link @comment.todo Todo
    highlight! link @comment.note SpecialComment
    highlight! link @comment.warning WarningMsg
    highlight! link @comment.error ErrorMsg
    highlight! link @diff.plus diffAdded
    highlight! link @diff.minus diffRemoved
    highlight! link @diff.delta diffChanged
    highlight! link @module MiningboxBlue
    highlight! link @namespace MiningboxFg1
    highlight! link @symbol Identifier
    highlight! link @text MiningboxFg1
    call s:HL('@text.strong', s:none, s:none, s:bold) " ['@text.strong'] = { bold = config.bold },
    call s:HL('@text.emphasis', s:none, s:none, s:italic) " ['@text.emphasis'] = { italic = config.italic.emphasis },
    call s:HL('@text.italic', s:none, s:none, s:italic) " ['@text.emphasis'] = { italic = config.italic.emphasis },
    call s:HL('@text.underline', s:none, s:none, s:underline) " ['@text.underline'] = { underline = config.underline },
    call s:HL('@text.strike', s:none, s:none, s:strikethrough) " ['@text.strike'] = { strikethrough = config.strikethrough },
    call s:HL('@text.strikethrough', s:none, s:none, s:strikethrough) " ['@text.strike'] = { strikethrough = config.strikethrough },
    highlight! link @text.title Title
    highlight! link @text.literal String
    highlight! link @text.uri Underlined
    highlight! link @text.math Special
    highlight! link @text.environment Macro
    highlight! link @text.environment.name Type
    highlight! link @text.reference Constant
    highlight! link @text.todo Todo
    highlight! link @text.todo.checked MiningboxGreen
    highlight! link @text.todo.unchecked MiningboxGray
    highlight! link @text.note SpecialComment
    call s:HL('@text.note.comment', s:colors.purple, s:none, s:bold) " ['@text.note.comment'] = { fg = colors.purple, bold = config.bold },
    highlight! link @text.warning WarningMsg
    highlight! link @text.danger ErrorMsg
    call s:HL('@text.danger.comment', s:colors.fg0, s:colors.red, s:bold) " ['@text.danger.comment'] = { fg = colors.fg0, bg = colors.red, bold = config.bold },
    highlight! link @text.diff.add diffAdded
    highlight! link @text.diff.delete diffRemoved
    highlight! link @tag Tag
    highlight! link @tag.attribute Identifier
    highlight! link @tag.delimiter Delimiter
    highlight! link @punctuation Delimiter
    highlight! link @macro Macro
    highlight! link @structure Structure
    highlight! link @lsp.type.class @type
    highlight! link @lsp.type.comment @comment
    highlight! link @lsp.type.decorator @macro
    highlight! link @lsp.type.enum @type
    highlight! link @lsp.type.enumMember @constant
    highlight! link @lsp.type.function @function
    highlight! link @lsp.type.interface @constructor
    highlight! link @lsp.type.macro @macro
    highlight! link @lsp.type.method @method
    highlight! link @lsp.type.modifier.java @keyword
    highlight! link @lsp.type.namespace @namespace
    highlight! link @lsp.type.parameter @parameter
    highlight! link @lsp.type.property @property
    highlight! link @lsp.type.struct @type
    highlight! link @lsp.type.type @type
    highlight! link @lsp.type.typeParameter @type.definition
    highlight! link @lsp.type.variable @variable
endif

" }}}
