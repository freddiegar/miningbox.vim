" -----------------------------------------------------------------------------
" File:         miningbox.vim
" Description:  Dark colorscheme based in Gruvbox (Fantastic!) colorscheme
" Author:       Freddie Gar
" Source:       https://github.com/freddiegar/miningbox
" Thanks:       https://github.com/gruvbox-community/gruvbox
" -----------------------------------------------------------------------------

set background=dark

highlight clear

if exists('syntax_on')
    syntax reset
endif

let g:colors_name = 'miningbox'

function! s:Color(name, default, ...) abort
    " color already set, validate option
    if has_key(s:colors, a:name)
        let l:color = s:colors[a:name]

        if type(l:color) == type('')
            " gui color only
            let s:colors[a:name] = copy(a:default)
            let s:colors[a:name][0] = l:color

            return 1
        elseif type(l:color) == type(0)
            " terminal color only
            let s:colors[a:name] = copy(a:default)
            let s:colors[a:name][1] = l:color

            return 1
        elseif type(l:color) == type([])
                    \ && len(l:color) == 2
                    \ && type(l:color[0]) == type('')
                    \ && type(l:color[1]) == type(0)
            " gui and terminal color

            return 1
        else
            " invalid value
            echoerr 'Color ' . a:name . ' is invalid'

            return 0
        endif

    endif

    " set default option
    let s:colors[a:name] = a:default

    return 1
endfunction

" }}}

" Palette: {{{

let s:colors = {}

call s:Color('dark0',           ['#1D2021', 234])     " 29-32-33
call s:Color('dark1',           ['#3C3836', 237])     " 60-56-54
call s:Color('dark2',           ['#504945', 239])     " 80-73-69
call s:Color('dark3',           ['#665C54', 241])     " 102-92-84
call s:Color('dark4',           ['#7C6F64', 243])     " 124-111-100

call s:Color('gray_245',        ['#928374', 245])     " 146-131-116

call s:Color('light0',          ['#FBF1C7', 229])     " 253-244-193
call s:Color('light1',          ['#EBDBB2', 223])     " 235-219-178
call s:Color('light2',          ['#D5C4A1', 250])     " 213-196-161
call s:Color('light3',          ['#BDAE93', 248])     " 189-174-147
call s:Color('light4',          ['#A89984', 246])     " 168-153-132

call s:Color('bright_red',      ['#FB4934', 167])     " 251-73-52
call s:Color('bright_green',    ['#B8BB26', 142])     " 184-187-38
call s:Color('bright_yellow',   ['#FABD2F', 214])     " 250-189-47
call s:Color('bright_blue',     ['#83A598', 109])     " 131-165-152
call s:Color('bright_purple',   ['#D3869B', 175])     " 211-134-155
call s:Color('bright_aqua',     ['#8EC07C', 108])     " 142-192-124
call s:Color('bright_orange',   ['#FE8019', 208])     " 254-128-25

call s:Color('neutral_red',     ['#CC241D', 124])     " 204-36-29
call s:Color('neutral_green',   ['#98971A', 106])     " 152-151-26
call s:Color('neutral_yellow',  ['#D79921', 172])     " 215-153-33
call s:Color('neutral_blue',    ['#458588', 66])      " 69-133-136
call s:Color('neutral_purple',  ['#B16286', 132])     " 177-98-134
call s:Color('neutral_aqua',    ['#689D6A', 72])      " 104-157-106
call s:Color('neutral_orange',  ['#D65D0E', 166])     " 214-93-14

" }}}

" Setup Emphasis: {{{

let s:bold = ''

let s:italic = ''

let s:underline = 'underline,'

let s:undercurl = 'undercurl,'

let s:inverse = 'inverse,'

" }}}

" Setup Colors: {{{

let s:vim_bg = ['bg', 'bg']
let s:vim_fg = ['fg', 'fg']
let s:none = ['NONE', 'NONE']

let s:bg0 = s:colors.dark0
let s:bg1 = s:colors.dark1
let s:bg2 = s:colors.dark2
let s:bg3 = s:colors.dark3
let s:bg4 = s:colors.dark4

let s:gray = s:colors.gray_245

let s:fg0 = s:colors.light0
let s:fg1 = s:colors.light1
let s:fg2 = s:colors.light2
let s:fg3 = s:colors.light3
let s:fg4 = s:colors.light4

let s:light = s:colors.light4

let s:red    = s:colors.bright_red
let s:green  = s:colors.bright_green
let s:yellow = s:colors.bright_yellow
let s:blue   = s:colors.bright_blue
let s:purple = s:colors.bright_purple
let s:aqua   = s:colors.bright_aqua
let s:orange = s:colors.bright_orange

call s:Color('bg0', s:bg0)
call s:Color('bg1', s:bg1)
call s:Color('bg2', s:bg2)
call s:Color('bg3', s:bg3)
call s:Color('bg4', s:bg4)

call s:Color('gray', s:gray)

call s:Color('fg0', s:fg0)
call s:Color('fg1', s:fg1)
call s:Color('fg2', s:fg2)
call s:Color('fg3', s:fg3)
call s:Color('fg4', s:fg4)

call s:Color('light', s:light)

call s:Color('red',    s:red)
call s:Color('green',  s:green)
call s:Color('yellow', s:yellow)
call s:Color('blue',   s:blue)
call s:Color('purple', s:purple)
call s:Color('aqua',   s:aqua)
call s:Color('orange', s:orange)

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

" Overload Setting: {{{

let s:hls_cursor = s:colors.orange

let s:hls_highlight = s:colors.yellow

let s:number_column = s:none

let s:sign_column = s:none

let s:color_column = s:colors.bg1

let s:vert_split = s:colors.bg0

let s:invert_signs = ''

let s:invert_selection = ''

let s:invert_tabline = ''

let s:tabline_sel = s:colors.green

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
function! s:HL(group, fg, ...) abort
    " Foreground
    let fg = a:fg

    " Background
    let bg = a:0 >= 1 ? a:1 : s:none

    " Emphasis
    let emphasis = (a:0 >= 2 && strlen(a:2) ? a:2 : 'NONE,')[:-2]

    " Highlight
    " term          attributes in a B&W terminal
    " cterm         attributes in a color terminal
    " ctermfg       foreground color in a color terminal
    " ctermbg       background color in a color terminal
    " gui           attributes in the GUI
    " guifg         foreground color in the GUI
    " guibg         background color in the GUI

    " > Options cterm and gui accept bold and underline
    let hl_string = [ 'highlight', a:group,
                \ 'guifg=' . fg[0], 'ctermfg=' . fg[1],
                \ 'guibg=' . bg[0], 'ctermbg=' . bg[1],
                \ 'gui=' . emphasis, 'cterm=' . emphasis
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
call s:HL('MiningboxFg2', s:colors.fg2)
call s:HL('MiningboxFg3', s:colors.fg3)
call s:HL('MiningboxFg4', s:colors.fg4)
call s:HL('MiningboxGray', s:colors.gray)
call s:HL('MiningboxBg0', s:colors.bg0)
call s:HL('MiningboxBg1', s:colors.bg1)
call s:HL('MiningboxBg2', s:colors.bg2)
call s:HL('MiningboxBg3', s:colors.bg3)
call s:HL('MiningboxBg4', s:colors.bg4)

call s:HL('MiningboxRed', s:colors.red)
call s:HL('MiningboxRedBold', s:colors.red, s:none, s:bold)
call s:HL('MiningboxGreen', s:colors.green)
call s:HL('MiningboxGreenBold', s:colors.green, s:none, s:bold)
call s:HL('MiningboxYellow', s:colors.yellow)
call s:HL('MiningboxYellowBold', s:colors.yellow, s:none, s:bold)
call s:HL('MiningboxBlue', s:colors.blue)
call s:HL('MiningboxBlueBold', s:colors.blue, s:none, s:bold)
call s:HL('MiningboxPurple', s:colors.purple)
call s:HL('MiningboxPurpleBold', s:colors.purple, s:none, s:bold)
call s:HL('MiningboxAqua', s:colors.aqua)
call s:HL('MiningboxAquaBold', s:colors.aqua, s:none, s:bold)
call s:HL('MiningboxOrange', s:colors.orange)
call s:HL('MiningboxOrangeBold', s:colors.orange, s:none, s:bold)

call s:HL('MiningboxRedSign', s:colors.red, s:sign_column, s:invert_signs)
call s:HL('MiningboxGreenSign', s:colors.green, s:sign_column, s:invert_signs)
call s:HL('MiningboxYellowSign', s:colors.yellow, s:sign_column, s:invert_signs)
call s:HL('MiningboxBlueSign', s:colors.blue, s:sign_column, s:invert_signs)
call s:HL('MiningboxPurpleSign', s:colors.purple, s:sign_column, s:invert_signs)
call s:HL('MiningboxAquaSign', s:colors.aqua, s:sign_column, s:invert_signs)
call s:HL('MiningboxOrangeSign', s:colors.orange, s:sign_column, s:invert_signs)

call s:HL('MiningboxRedUnderline', s:none, s:none, s:undercurl, s:colors.red)
call s:HL('MiningboxGreenUnderline', s:none, s:none, s:undercurl, s:colors.green)
call s:HL('MiningboxYellowUnderline', s:none, s:none, s:undercurl, s:colors.yellow)
call s:HL('MiningboxBlueUnderline', s:none, s:none, s:undercurl, s:colors.blue)
call s:HL('MiningboxPurpleUnderline', s:none, s:none, s:undercurl, s:colors.purple)
call s:HL('MiningboxAquaUnderline', s:none, s:none, s:undercurl, s:colors.aqua)
call s:HL('MiningboxOrangeUnderline', s:none, s:none, s:undercurl, s:colors.orange)

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
call s:HL('TabLineFill', s:colors.bg4, s:colors.bg1, s:invert_tabline)
" Active tab page label
call s:HL('TabLineSel', s:tabline_sel, s:colors.bg1, s:invert_tabline)
" Not active tab page label
highlight! link TabLine TabLineFill

" Match paired bracket under the cursor
call s:HL('MatchParen', s:none, s:colors.bg3, s:bold)

" Highlighted screen columns
call s:HL('ColorColumn', s:none, s:color_column)

" Concealed element: \lambda → λ
call s:HL('Conceal', s:colors.blue, s:none)

highlight! NonText ctermfg=238 guifg=#2E2E2E
highlight! SpecialKey ctermfg=238 guifg=#2E2E2E

call s:HL('Visual', s:none, s:colors.bg3, s:invert_selection)
highlight! link VisualNOS Visual

call s:HL('Search', s:hls_highlight, s:colors.bg0, s:inverse)
call s:HL('IncSearch', s:hls_cursor, s:colors.bg0, s:inverse)

call s:HL('QuickFixLine', s:colors.bg0, s:colors.yellow, s:bold)

call s:HL('Underlined', s:colors.blue, s:none, s:underline)

call s:HL('StatusLine', s:colors.bg4, s:none)
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

" }}}

" Gutter: {{{

" Line number for :number and :# commands
call s:HL('LineNr', s:colors.bg4, s:number_column)
" Column where signs are displayed
call s:HL('SignColumn', s:colors.bg4, s:sign_column)
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
" String constant: "this is a string"
call s:HL('String', s:colors.green, s:none, s:italic)
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
call s:HL('StatusLineTermNC', s:colors.bg4, s:none, 'italic,')

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
highlight! link SneakLabel Cursor
highlight! link SneakScope DiffAdd

" }}}

" Signature: {{{

call s:HL('SignatureMarkText', s:colors.bg4, s:sign_column)
call s:HL('SignatureMarkerText', s:colors.bg4, s:sign_column)

" }}}

" GitGutter: {{{

call s:HL('GitGutterAdd', s:colors.bg4, s:sign_column)
call s:HL('GitGutterChange', s:colors.bg4, s:sign_column)
call s:HL('GitGutterDelete', s:colors.bg4, s:sign_column)
call s:HL('GitGutterChangeDelete', s:colors.bg4, s:sign_column)

" }}}

" Syntastic: {{{

highlight! link SyntasticError MiningboxRedUnderline
highlight! link SyntasticWarning MiningboxYellowUnderline

" Syntastic sign with same color of theme
call s:HL('SyntasticErrorSign', s:none, s:colors.neutral_red)
call s:HL('SyntasticWarningSign', s:none, s:colors.neutral_red)
call s:HL('SyntasticStyleErrorSign', s:none, s:colors.neutral_yellow)
call s:HL('SyntasticStyleWarningSign', s:none, s:colors.neutral_yellow)

" Custom color #1 in statusline
call s:HL('User1', s:none, s:colors.neutral_red)

" }}}

" ALE: {{{

highlight! link ALEError MiningboxRedUnderline
highlight! link ALEWarning MiningboxYellowUnderline

" ALE sign with same color of theme
call s:HL('ALEErrorSign', s:none, s:colors.neutral_red)
call s:HL('ALEWarningSign', s:none, s:colors.neutral_red)

" }}}

" FZF: {{{

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

" Goyo: {{{

highlight! link VertSplit LineNr

" }}}

" coc.nvim: {{{

highlight! link CocErrorSign MiningboxRedSign
highlight! link CocWarningSign MiningboxOrangeSign
highlight! link CocInfoSign MiningboxBlueSign
highlight! link CocHintSign MiningboxAquaSign
highlight! link CocErrorFloat MiningboxRed
highlight! link CocWarningFloat MiningboxOrange
highlight! link CocInfoFloat MiningboxBlue
highlight! link CocHintFloat MiningboxAqua
highlight! link CocDiagnosticsError MiningboxRed
highlight! link CocDiagnosticsWarning MiningboxOrange
highlight! link CocDiagnosticsInfo MiningboxBlue
highlight! link CocDiagnosticsHint MiningboxAqua

highlight! link CocSelectedText MiningboxRed
highlight! link CocCodeLens MiningboxGray

highlight! link CocErrorHighlight MiningboxRedUnderline
highlight! link CocWarningHighlight MiningboxOrangeUnderline
highlight! link CocInfoHighlight MiningboxBlueUnderline
highlight! link CocHintHighlight MiningboxAquaUnderline

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

" html: {{{

highlight! link htmlTag MiningboxAquaBold
highlight! link htmlEndTag MiningboxAquaBold

highlight! link htmlTagName MiningboxBlue
highlight! link htmlArg MiningboxOrange

highlight! link htmlTagN MiningboxFg1
highlight! link htmlSpecialTagName MiningboxBlue

call s:HL('htmlLink', s:colors.fg4, s:none, s:underline)

highlight! link htmlSpecialChar MiningboxRed

call s:HL('htmlBold', s:vim_fg, s:vim_bg, s:bold)
call s:HL('htmlBoldUnderline', s:vim_fg, s:vim_bg, s:bold . s:underline)
call s:HL('htmlBoldItalic', s:vim_fg, s:vim_bg, s:bold . s:italic)
call s:HL('htmlBoldUnderlineItalic', s:vim_fg, s:vim_bg, s:bold . s:underline . s:italic)

call s:HL('htmlUnderline', s:vim_fg, s:vim_bg, s:underline)
call s:HL('htmlUnderlineItalic', s:vim_fg, s:vim_bg, s:underline . s:italic)
call s:HL('htmlItalic', s:vim_fg, s:vim_bg, s:italic)

" }}}

" xml: {{{

highlight! link xmlTag MiningboxAquaBold
highlight! link xmlEndTag MiningboxAquaBold
highlight! link xmlTagName MiningboxBlue
highlight! link xmlEqual MiningboxBlue
highlight! link docbkKeyword MiningboxAquaBold

highlight! link xmlDocTypeDecl MiningboxGray
highlight! link xmlDocTypeKeyword MiningboxPurple
highlight! link xmlCdataStart MiningboxGray
highlight! link xmlCdataCdata MiningboxPurple
highlight! link dtdFunction MiningboxGray
highlight! link dtdTagName MiningboxPurple

highlight! link xmlAttrib MiningboxOrange
highlight! link xmlProcessingDelim MiningboxGray
highlight! link dtdParamEntityPunct MiningboxGray
highlight! link dtdParamEntityDPunct MiningboxGray
highlight! link xmlAttribPunct MiningboxGray

highlight! link xmlEntity MiningboxRed
highlight! link xmlEntityPunct MiningboxRed

" }}}

" vim: {{{

call s:HL('vimCommentTitle', s:colors.light, s:none, s:bold . s:italic)

highlight! link vimNotation MiningboxOrange
highlight! link vimBracket MiningboxOrange
highlight! link vimMapModKey MiningboxOrange
highlight! link vimFuncSID MiningboxFg3
highlight! link vimSetSep MiningboxFg3
highlight! link vimSep MiningboxFg3
highlight! link vimContinue MiningboxFg3

" }}}

" c: {{{

highlight! link cOperator MiningboxPurple
highlight! link cppOperator MiningboxPurple
highlight! link cStructure MiningboxOrange

" }}}

" python: {{{

highlight! link pythonBuiltin MiningboxOrange
highlight! link pythonBuiltinObj MiningboxOrange
highlight! link pythonBuiltinFunc MiningboxOrange
highlight! link pythonFunction MiningboxAqua
highlight! link pythonDecorator MiningboxRed
highlight! link pythonInclude MiningboxBlue
highlight! link pythonImport MiningboxBlue
highlight! link pythonRun MiningboxBlue
highlight! link pythonCoding MiningboxBlue
highlight! link pythonOperator MiningboxRed
highlight! link pythonException MiningboxRed
highlight! link pythonExceptions MiningboxPurple
highlight! link pythonBoolean MiningboxPurple
highlight! link pythonDot MiningboxFg3
highlight! link pythonConditional MiningboxRed
highlight! link pythonRepeat MiningboxRed
highlight! link pythonDottedName MiningboxGreenBold

" }}}

" css: {{{

highlight! link cssBraces MiningboxBlue
highlight! link cssFunctionName MiningboxYellow
highlight! link cssIdentifier MiningboxOrange
highlight! link cssClassName MiningboxGreen
highlight! link cssColor MiningboxBlue

highlight! link cssSelectorOp MiningboxBlue
highlight! link cssSelectorOp2 MiningboxBlue
highlight! link cssImportant MiningboxGreen
highlight! link cssVendor MiningboxFg1
highlight! link cssTextProp MiningboxAqua
highlight! link cssAnimationProp MiningboxAqua
highlight! link cssUIProp MiningboxYellow
highlight! link cssTransformProp MiningboxAqua
highlight! link cssTransitionProp MiningboxAqua
highlight! link cssPrintProp MiningboxAqua
highlight! link cssPositioningProp MiningboxYellow
highlight! link cssBoxProp MiningboxAqua
highlight! link cssFontDescriptorProp MiningboxAqua
highlight! link cssFlexibleBoxProp MiningboxAqua
highlight! link cssBorderOutlineProp MiningboxAqua
highlight! link cssBackgroundProp MiningboxAqua
highlight! link cssMarginProp MiningboxAqua
highlight! link cssListProp MiningboxAqua
highlight! link cssTableProp MiningboxAqua
highlight! link cssFontProp MiningboxAqua
highlight! link cssPaddingProp MiningboxAqua
highlight! link cssDimensionProp MiningboxAqua
highlight! link cssRenderProp MiningboxAqua
highlight! link cssColorProp MiningboxAqua
highlight! link cssGeneratedContentProp MiningboxAqua

" }}}

" javascript: {{{

highlight! link javaScriptBraces MiningboxFg1
highlight! link javaScriptFunction MiningboxAqua
highlight! link javaScriptIdentifier MiningboxRed
highlight! link javaScriptMember MiningboxBlue
highlight! link javaScriptNumber MiningboxPurple
highlight! link javaScriptNull MiningboxPurple
highlight! link javaScriptParens MiningboxFg3

" }}}

" typescript: {{{

highlight! link typescriptReserved MiningboxAqua
highlight! link typescriptLabel MiningboxAqua
highlight! link typescriptFuncKeyword MiningboxAqua
highlight! link typescriptIdentifier MiningboxOrange
highlight! link typescriptBraces MiningboxFg1
highlight! link typescriptEndColons MiningboxFg1
highlight! link typescriptDOMObjects MiningboxFg1
highlight! link typescriptAjaxMethods MiningboxFg1
highlight! link typescriptLogicSymbols MiningboxFg1
highlight! link typescriptDocSeeTag MiningboxComment
highlight! link typescriptDocParam MiningboxComment
highlight! link typescriptDocTags MiningboxvimCommentTitle
highlight! link typescriptGlobalObjects MiningboxFg1
highlight! link typescriptParens MiningboxFg3
highlight! link typescriptOpSymbols MiningboxFg3
highlight! link typescriptHtmlElemProperties MiningboxFg1
highlight! link typescriptNull MiningboxPurple
highlight! link typescriptInterpolationDelimiter MiningboxAqua

" }}}

" go: {{{

highlight! link goDirective MiningboxAqua
highlight! link goConstants MiningboxPurple
highlight! link goDeclaration MiningboxRed
highlight! link goDeclType MiningboxBlue
highlight! link goBuiltins MiningboxOrange

" }}}

" lua: {{{

highlight! link luaIn MiningboxRed
highlight! link luaFunction MiningboxAqua
highlight! link luaTable MiningboxOrange

" }}}

" markdown: {{{

call s:HL('markdownItalic', s:fg3, s:none, s:italic)
call s:HL('markdownBold', s:fg3, s:none, s:bold)
call s:HL('markdownBoldItalic', s:fg3, s:none, s:bold . s:italic)

highlight! link markdownH1 MiningboxGreenBold
highlight! link markdownH2 MiningboxGreenBold
highlight! link markdownH3 MiningboxYellowBold
highlight! link markdownH4 MiningboxYellowBold
highlight! link markdownH5 MiningboxYellow
highlight! link markdownH6 MiningboxYellow

highlight! link markdownCode MiningboxAqua
highlight! link markdownCodeBlock MiningboxAqua
highlight! link markdownCodeDelimiter MiningboxAqua

highlight! link markdownBlockquote MiningboxGray
highlight! link markdownListMarker MiningboxGray
highlight! link markdownOrderedListMarker MiningboxGray
highlight! link markdownRule MiningboxGray
highlight! link markdownHeadingRule MiningboxGray

highlight! link markdownUrlDelimiter MiningboxFg3
highlight! link markdownLinkDelimiter MiningboxFg3
highlight! link markdownLinkTextDelimiter MiningboxFg3

highlight! link markdownHeadingDelimiter MiningboxOrange
highlight! link markdownUrl MiningboxPurple
highlight! link markdownUrlTitleDelimiter MiningboxGreen

call s:HL('markdownLinkText', s:gray, s:none, s:underline)
highlight! link markdownIdDeclaration MiningboxmarkdownLinkText

" }}}

" json: {{{

highlight! link jsonKeyword MiningboxGreen
highlight! link jsonQuote MiningboxGreen
highlight! link jsonBraces MiningboxFg1
highlight! link jsonString MiningboxFg1

" }}}

" rust: {{{

highlight! link rustSigil MiningboxOrange
highlight! link rustEscape MiningboxAqua
highlight! link rustStringContinuation MiningboxAqua
highlight! link rustEnum MiningboxAqua
highlight! link rustStructure MiningboxAqua
highlight! link rustModPathSep MiningboxFg2
highlight! link rustCommentLineDoc MiningboxComment
highlight! link rustDefault MiningboxAqua

" }}}

" Custom specific: {{{

" Transparency
if !has('gui_running')
    highlight! Normal guibg=NONE ctermbg=NONE
endif

" GitGutter sign column
highlight! link CursorLineSign LineNr

" The column separating vertically split windows
highlight! link VertSplit LineNr

" End of buffer with same color of theme
highlight! link EndOfBuffer LineNr

" Unwanted spaces
" @see syntax/syncolor.vim
highlight! link ExtraWhitespace Error

" }}}
