" -----------------------------------------------------------------------------
" File: miningbox.vim
" Description: Dark colorscheme based in Gruvbox (Fantastic!) colorscheme
" Author: Freddie Gar <freddie.garNOSPAM@outlook.com>
" Source: https://github.com/freddiegar/miningbox
" Thanks: https://github.com/gruvbox-community/gruvbox
" -----------------------------------------------------------------------------

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

let s:bg0  = s:colors.dark0
let s:bg1  = s:colors.dark1
let s:bg2  = s:colors.dark2
let s:bg3  = s:colors.dark3
let s:bg4  = s:colors.dark4

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

function! s:HL(group, fg, ...) abort
    " foreground
    let fg = a:fg

    " background
    let bg = a:0 >= 1 ? a:1 : s:none

    " emphasis
    let emphasis = (a:0 >= 2 && strlen(a:2) ? a:2 : 'NONE,')[:-2]

    " highlight
    let hl_string = [ 'highlight', a:group,
                \ 'guifg=' . fg[0], 'ctermfg=' . fg[1],
                \ 'guibg=' . bg[0], 'ctermbg=' . bg[1],
                \ 'gui=' . emphasis, 'cterm=' . emphasis
                \ ]

    " special
    if a:0 >= 3
        call add(hl_string, 'guisp=' . a:3[0])
    endif

    silent execute join(hl_string, ' ')
endfunction

" }}}

"  Highlight Groups: {{{

call s:HL('Fg0', s:colors.fg0)
call s:HL('Fg1', s:colors.fg1)
call s:HL('Fg2', s:colors.fg2)
call s:HL('Fg3', s:colors.fg3)
call s:HL('Fg4', s:colors.fg4)
call s:HL('Gray', s:colors.gray)
call s:HL('Bg0', s:colors.bg0)
call s:HL('Bg1', s:colors.bg1)
call s:HL('Bg2', s:colors.bg2)
call s:HL('Bg3', s:colors.bg3)
call s:HL('Bg4', s:colors.bg4)

call s:HL('Red', s:colors.red)
call s:HL('RedBold', s:colors.red, s:none, s:bold)
call s:HL('Green', s:colors.green)
call s:HL('GreenBold', s:colors.green, s:none, s:bold)
call s:HL('Yellow', s:colors.yellow)
call s:HL('YellowBold', s:colors.yellow, s:none, s:bold)
call s:HL('Blue', s:colors.blue)
call s:HL('BlueBold', s:colors.blue, s:none, s:bold)
call s:HL('Purple', s:colors.purple)
call s:HL('PurpleBold', s:colors.purple, s:none, s:bold)
call s:HL('Aqua', s:colors.aqua)
call s:HL('AquaBold', s:colors.aqua, s:none, s:bold)
call s:HL('Orange', s:colors.orange)
call s:HL('OrangeBold', s:colors.orange, s:none, s:bold)

call s:HL('RedSign', s:colors.red, s:sign_column, s:invert_signs)
call s:HL('GreenSign', s:colors.green, s:sign_column, s:invert_signs)
call s:HL('YellowSign', s:colors.yellow, s:sign_column, s:invert_signs)
call s:HL('BlueSign', s:colors.blue, s:sign_column, s:invert_signs)
call s:HL('PurpleSign', s:colors.purple, s:sign_column, s:invert_signs)
call s:HL('AquaSign', s:colors.aqua, s:sign_column, s:invert_signs)
call s:HL('OrangeSign', s:colors.orange, s:sign_column, s:invert_signs)

call s:HL('RedUnderline', s:none, s:none, s:undercurl, s:colors.red)
call s:HL('GreenUnderline', s:none, s:none, s:undercurl, s:colors.green)
call s:HL('YellowUnderline', s:none, s:none, s:undercurl, s:colors.yellow)
call s:HL('BlueUnderline', s:none, s:none, s:undercurl, s:colors.blue)
call s:HL('PurpleUnderline', s:none, s:none, s:undercurl, s:colors.purple)
call s:HL('AquaUnderline', s:none, s:none, s:undercurl, s:colors.aqua)
call s:HL('OrangeUnderline', s:none, s:none, s:undercurl, s:colors.orange)

" }}}

" Vanilla colorscheme ---------------------------------------------------------

" General UI: {{{

" Normal text
call s:HL('Normal', s:colors.fg1, s:colors.bg0)

" Screen line that the cursor is
call s:HL('CursorLine',   s:none, s:colors.bg1)
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
call s:HL('ColorColumn',  s:none, s:color_column)

" Concealed element: \lambda → λ
call s:HL('Conceal', s:colors.blue, s:none)

" Line number of CursorLine
call s:HL('CursorLineNr', s:colors.yellow, s:colors.bg1)

highlight! NonText ctermfg=238 guifg=#2E2E2E
highlight! SpecialKey ctermfg=238 guifg=#2E2E2E

call s:HL('Visual',    s:none,  s:colors.bg3, s:invert_selection)
highlight! link VisualNOS Visual

call s:HL('Search', s:hls_highlight, s:colors.bg0, s:inverse)
call s:HL('IncSearch', s:hls_cursor, s:colors.bg0, s:inverse)

call s:HL('QuickFixLine', s:colors.bg0, s:colors.yellow, s:bold)

call s:HL('Underlined', s:colors.blue, s:none, s:underline)

call s:HL('StatusLine',   s:colors.bg2, s:colors.fg1, s:inverse)
call s:HL('StatusLineNC', s:colors.bg1, s:colors.fg4, s:inverse)

" The column separating vertically split windows
call s:HL('VertSplit', s:colors.bg3, s:vert_split)

" Current match in wildmenu completion
call s:HL('WildMenu', s:colors.blue, s:colors.bg2, s:bold)

" Directory names, special names in listing
highlight! link Directory GreenBold

" Titles for output from :set all, :autocmd, etc.
highlight! link Title GreenBold

" Error messages on the command line
call s:HL('ErrorMsg',   s:colors.bg0, s:colors.red, s:bold)
" More prompt: -- More --
highlight! link MoreMsg YellowBold
" Current mode message: -- INSERT --
highlight! link ModeMsg YellowBold
" 'Press enter' prompt and yes/no questions
highlight! link Question OrangeBold
" Warning messages
highlight! link WarningMsg RedBold

" }}}

" Gutter: {{{

" Line number for :number and :# commands
call s:HL('LineNr', s:colors.bg4, s:number_column)

" Column where signs are displayed
call s:HL('SignColumn', s:none, s:sign_column)

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
" Input moder cursor
highlight! link iCursor Cursor
" Language mapping cursor
highlight! link lCursor Cursor

" }}}

" Syntax Highlighting: {{{

highlight! link Special Orange

call s:HL('Comment', s:colors.gray, s:none, s:italic)
call s:HL('Todo', s:vim_fg, s:none, s:bold . s:italic)
call s:HL('Error', s:colors.red, s:none, s:bold . s:inverse)

" Generic statement
highlight! link Statement Red
" if, then, else, endif, switch, etc.
highlight! link Conditional Red
" for, do, while, etc.
highlight! link Repeat Red
" case, default, etc.
highlight! link Label Red
" try, catch, throw
highlight! link Exception Red
" sizeof, "+", "*", etc.
highlight! link Operator Fg1
" Any other keyword
highlight! link Keyword Red

" Variable name
highlight! link Identifier Blue
" Function name
highlight! link Function GreenBold

" Generic preprocessor
highlight! link PreProc Aqua
" Preprocessor #include
highlight! link Include Aqua
" Preprocessor #define
highlight! link Define Aqua
" Same as Define
highlight! link Macro Aqua
" Preprocessor #if, #else, #endif, etc.
highlight! link PreCondit Aqua

" Generic constant
highlight! link Constant Purple
" Character constant: 'c', '/n'
highlight! link Character Purple
" String constant: "this is a string"
call s:HL('String',  s:colors.green, s:none, s:italic)
" Boolean constant: TRUE, false
highlight! link Boolean Purple
" Number constant: 234, 0xff
highlight! link Number Purple
" Floating point constant: 2.3e10
highlight! link Float Purple

" Generic type
highlight! link Type Yellow
" static, register, volatile, etc
highlight! link StorageClass Orange
" struct, union, enum, etc.
highlight! link Structure Aqua
" typedef
highlight! link Typedef Yellow

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

" GitGutter: {{{

highlight! link GitGutterAdd SignColumn
highlight! link GitGutterChange SignColumn
highlight! link GitGutterDelete SignColumn
highlight! link GitGutterChangeDelete SignColumn

" }}}

" Syntastic: {{{

highlight! link SyntasticError RedUnderline
highlight! link SyntasticWarning YellowUnderline

" Syntastic sign with same color of theme
highlight! link SyntasticErrorSign SignColumn
highlight! link SyntasticWarningSign SignColumn
highlight! link SyntasticStyleErrorSign SignColumn
highlight! link SyntasticStyleWarningSign SignColumn

" Sintastic line highlight
highlight! clear ErrorText
highlight! clear ErrorLine
highlight! ErrorLine guifg=NONE ctermbg=52 guibg=#55393D ctermbg=NONE
highlight! link SyntasticStyleErrorLine ErrorLine
highlight! SyntasticStyleWarningLine guifg=NONE ctermbg=236 guibg=#534C38 ctermbg=NONE

" Custom color for statusline
highlight! User1 guifg=#FF2222 ctermfg=1

" }}}

" FZF: {{{

let g:fzf_colors = {
            \ 'fg':      ['fg', 'Fg1'],
            \ 'bg':      ['fg', 'Bg0'],
            \ 'hl':      ['fg', 'Yellow'],
            \ 'fg+':     ['fg', 'Fg1'],
            \ 'bg+':     ['fg', 'Bg1'],
            \ 'hl+':     ['fg', 'Yellow'],
            \ 'info':    ['fg', 'Blue'],
            \ 'prompt':  ['fg', 'Fg4'],
            \ 'pointer': ['fg', 'Blue'],
            \ 'marker':  ['fg', 'Orange'],
            \ 'spinner': ['fg', 'Yellow'],
            \ 'header':  ['fg', 'Bg3']
            \ }


call s:HL('Fzf1', s:colors.blue, s:colors.bg1)
call s:HL('Fzf2', s:colors.orange, s:colors.bg1)
call s:HL('Fzf3', s:colors.fg4, s:colors.bg1)

" }}}

" Netrw: {{{

highlight! link netrwDir Aqua
highlight! link netrwClassify Aqua
highlight! link netrwLink Gray
highlight! link netrwSymLink Fg1
highlight! link netrwExe Yellow
highlight! link netrwComment Gray
highlight! link netrwList Blue
highlight! link netrwHelpCmd Aqua
highlight! link netrwCmdSep Fg3
highlight! link netrwVersion Green

" }}}

" Goyo: {{{

highlight! link VertSplit LineNr
highlight! StatusLineNC guibg=NONE ctermbg=NONE

" }}}

" coc.nvim: {{{

highlight! link CocErrorSign RedSign
highlight! link CocWarningSign OrangeSign
highlight! link CocInfoSign BlueSign
highlight! link CocHintSign AquaSign
highlight! link CocErrorFloat Red
highlight! link CocWarningFloat Orange
highlight! link CocInfoFloat Blue
highlight! link CocHintFloat Aqua
highlight! link CocDiagnosticsError Red
highlight! link CocDiagnosticsWarning Orange
highlight! link CocDiagnosticsInfo Blue
highlight! link CocDiagnosticsHint Aqua

highlight! link CocSelectedText Red
highlight! link CocCodeLens Gray

highlight! link CocErrorHighlight RedUnderline
highlight! link CocWarningHighlight OrangeUnderline
highlight! link CocInfoHighlight BlueUnderline
highlight! link CocHintHighlight AquaUnderline

" }}}


" Filetype specific -----------------------------------------------------------

" diff: {{{

highlight! link diffAdded Green
highlight! link diffRemoved Red
highlight! link diffChanged Aqua

highlight! link diffFile Orange
highlight! link diffNewFile Yellow

highlight! link diffLine Blue

" }}}

" html: {{{

highlight! link htmlTag AquaBold
highlight! link htmlEndTag AquaBold

highlight! link htmlTagName Blue
highlight! link htmlArg Orange

highlight! link htmlTagN Fg1
highlight! link htmlSpecialTagName Blue

call s:HL('htmlLink', s:colors.fg4, s:none, s:underline)

highlight! link htmlSpecialChar Red

call s:HL('htmlBold', s:vim_fg, s:vim_bg, s:bold)
call s:HL('htmlBoldUnderline', s:vim_fg, s:vim_bg, s:bold . s:underline)
call s:HL('htmlBoldItalic', s:vim_fg, s:vim_bg, s:bold . s:italic)
call s:HL('htmlBoldUnderlineItalic', s:vim_fg, s:vim_bg, s:bold . s:underline . s:italic)

call s:HL('htmlUnderline', s:vim_fg, s:vim_bg, s:underline)
call s:HL('htmlUnderlineItalic', s:vim_fg, s:vim_bg, s:underline . s:italic)
call s:HL('htmlItalic', s:vim_fg, s:vim_bg, s:italic)

" }}}

" xml: {{{

highlight! link xmlTag AquaBold
highlight! link xmlEndTag AquaBold
highlight! link xmlTagName Blue
highlight! link xmlEqual Blue
highlight! link docbkKeyword AquaBold

highlight! link xmlDocTypeDecl Gray
highlight! link xmlDocTypeKeyword Purple
highlight! link xmlCdataStart Gray
highlight! link xmlCdataCdata Purple
highlight! link dtdFunction Gray
highlight! link dtdTagName Purple

highlight! link xmlAttrib Orange
highlight! link xmlProcessingDelim Gray
highlight! link dtdParamEntityPunct Gray
highlight! link dtdParamEntityDPunct Gray
highlight! link xmlAttribPunct Gray

highlight! link xmlEntity Red
highlight! link xmlEntityPunct Red

" }}}

" vim: {{{

call s:HL('vimCommentTitle', s:colors.light, s:none, s:bold . s:italic)

highlight! link vimNotation Orange
highlight! link vimBracket Orange
highlight! link vimMapModKey Orange
highlight! link vimFuncSID Fg3
highlight! link vimSetSep Fg3
highlight! link vimSep Fg3
highlight! link vimContinue Fg3

" }}}

" c: {{{

highlight! link cOperator Purple
highlight! link cppOperator Purple
highlight! link cStructure Orange

" }}}

" python: {{{

highlight! link pythonBuiltin Orange
highlight! link pythonBuiltinObj Orange
highlight! link pythonBuiltinFunc Orange
highlight! link pythonFunction Aqua
highlight! link pythonDecorator Red
highlight! link pythonInclude Blue
highlight! link pythonImport Blue
highlight! link pythonRun Blue
highlight! link pythonCoding Blue
highlight! link pythonOperator Red
highlight! link pythonException Red
highlight! link pythonExceptions Purple
highlight! link pythonBoolean Purple
highlight! link pythonDot Fg3
highlight! link pythonConditional Red
highlight! link pythonRepeat Red
highlight! link pythonDottedName GreenBold

" }}}

" css: {{{

highlight! link cssBraces Blue
highlight! link cssFunctionName Yellow
highlight! link cssIdentifier Orange
highlight! link cssClassName Green
highlight! link cssColor Blue
highlight! link cssSelectorOp Blue
highlight! link cssSelectorOp2 Blue
highlight! link cssImportant Green
highlight! link cssVendor Fg1

highlight! link cssTextProp Aqua
highlight! link cssAnimationProp Aqua
highlight! link cssUIProp Yellow
highlight! link cssTransformProp Aqua
highlight! link cssTransitionProp Aqua
highlight! link cssPrintProp Aqua
highlight! link cssPositioningProp Yellow
highlight! link cssBoxProp Aqua
highlight! link cssFontDescriptorProp Aqua
highlight! link cssFlexibleBoxProp Aqua
highlight! link cssBorderOutlineProp Aqua
highlight! link cssBackgroundProp Aqua
highlight! link cssMarginProp Aqua
highlight! link cssListProp Aqua
highlight! link cssTableProp Aqua
highlight! link cssFontProp Aqua
highlight! link cssPaddingProp Aqua
highlight! link cssDimensionProp Aqua
highlight! link cssRenderProp Aqua
highlight! link cssColorProp Aqua
highlight! link cssGeneratedContentProp Aqua

" }}}

" javascript: {{{

highlight! link javaScriptBraces Fg1
highlight! link javaScriptFunction Aqua
highlight! link javaScriptIdentifier Red
highlight! link javaScriptMember Blue
highlight! link javaScriptNumber Purple
highlight! link javaScriptNull Purple
highlight! link javaScriptParens Fg3

" }}}

" typescript: {{{

highlight! link typescriptReserved Aqua
highlight! link typescriptLabel Aqua
highlight! link typescriptFuncKeyword Aqua
highlight! link typescriptIdentifier Orange
highlight! link typescriptBraces Fg1
highlight! link typescriptEndColons Fg1
highlight! link typescriptDOMObjects Fg1
highlight! link typescriptAjaxMethods Fg1
highlight! link typescriptLogicSymbols Fg1
highlight! link typescriptDocSeeTag Comment
highlight! link typescriptDocParam Comment
highlight! link typescriptDocTags vimCommentTitle
highlight! link typescriptGlobalObjects Fg1
highlight! link typescriptParens Fg3
highlight! link typescriptOpSymbols Fg3
highlight! link typescriptHtmlElemProperties Fg1
highlight! link typescriptNull Purple
highlight! link typescriptInterpolationDelimiter Aqua

" }}}

" go: {{{

highlight! link goDirective Aqua
highlight! link goConstants Purple
highlight! link goDeclaration Red
highlight! link goDeclType Blue
highlight! link goBuiltins Orange

" }}}

" lua: {{{

highlight! link luaIn Red
highlight! link luaFunction Aqua
highlight! link luaTable Orange

" }}}

" markdown: {{{

call s:HL('markdownItalic', s:fg3, s:none, s:italic)
call s:HL('markdownBold', s:fg3, s:none, s:bold)
call s:HL('markdownBoldItalic', s:fg3, s:none, s:bold . s:italic)

highlight! link markdownH1 GreenBold
highlight! link markdownH2 GreenBold
highlight! link markdownH3 YellowBold
highlight! link markdownH4 YellowBold
highlight! link markdownH5 Yellow
highlight! link markdownH6 Yellow

highlight! link markdownCode Aqua
highlight! link markdownCodeBlock Aqua
highlight! link markdownCodeDelimiter Aqua

highlight! link markdownBlockquote Gray
highlight! link markdownListMarker Gray
highlight! link markdownOrderedListMarker Gray
highlight! link markdownRule Gray
highlight! link markdownHeadingRule Gray

highlight! link markdownUrlDelimiter Fg3
highlight! link markdownLinkDelimiter Fg3
highlight! link markdownLinkTextDelimiter Fg3

highlight! link markdownHeadingDelimiter Orange
highlight! link markdownUrl Purple
highlight! link markdownUrlTitleDelimiter Green

call s:HL('markdownLinkText', s:gray, s:none, s:underline)
highlight! link markdownIdDeclaration markdownLinkText

" }}}

" json: {{{

highlight! link jsonKeyword Green
highlight! link jsonQuote Green
highlight! link jsonBraces Fg1
highlight! link jsonString Fg1

" }}}

" rust: {{{

highlight! link rustSigil Orange
highlight! link rustEscape Aqua
highlight! link rustStringContinuation Aqua
highlight! link rustEnum Aqua
highlight! link rustStructure Aqua
highlight! link rustModPathSep Fg2
highlight! link rustCommentLineDoc Comment
highlight! link rustDefault Aqua

" }}}

" Custom specific: {{{

" Transparency
highlight! Normal guibg=NONE ctermbg=NONE
highlight! LineNr guibg=NONE ctermbg=NONE

" SignColumn and StatusLine with same color of theme
highlight! link SignColumn LineNr
highlight! link StatusLine LineNr
highlight! link EndOfBuffer LineNr

" Extend cursorline format to cursorline number
highlight! link CursorLineNr CursorLine
highlight! CursorLineNr guibg=NONE ctermbg=NONE

" }}}
