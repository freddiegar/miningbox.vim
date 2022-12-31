" -----------------------------------------------------------------------------
" File:     plugin/miningbox.vim
" Author:   Freddie Gar
" -----------------------------------------------------------------------------

if exists('g:loaded_miningbox')
    finish
endif

let g:loaded_miningbox = 'yes'

if exists(':Limelight')
    " ========================================================
    " Limelight Integration
    " @see https://github.com/junegunn/limelight.vim
    " ========================================================

    " Color name (:help cterm-colors) or ANSI code
    let g:limelight_conceal_ctermfg = 238

    " Color name (:help gui-colors) or RGB color
    let g:limelight_conceal_guifg = '#2E2E2E'
endif

if exists(':Goyo')
    let s:initial = {}
    let s:hasgui = has('gui_running')

    " ========================================================
    " Goyo Integration (+Limelight)
    " @see https://github.com/junegunn/goyo.vim
    " ========================================================

    " Quit Vim if Goyo is only buffer active
    " @thanks https://github.com/junegunn/goyo.vim/wiki/Customization#ensure-q-to-quit-even-when-goyo-is-active
    function! s:goyo_enter_quit() abort
        let b:quitting = 0
        let b:quitting_bang = 0

        autocmd QuitPre <buffer> let b:quitting = 1

        cabbrev <buffer> q! silent let b:quitting_bang = 1 <Bar> q!
    endfunction

    function! s:goyo_leave_quit() abort
        if get(b:, 'quitting', 0) && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) ==# 1
            if get(b:, 'quitting_bang', 0)
                qall!
            else
                qall
            endif
        endif
    endfunction

    function! s:goyo_enter() abort
        if s:hasgui
            let s:initial['fullscreen'] = &fullscreen
        endif

        let s:initial['scrolloff'] = &scrolloff
        let s:initial['fillchars'] = &fillchars
        let s:initial['cursorline'] = &cursorline
        let s:initial['cursorcolumn'] = &cursorcolumn
        let s:initial['list'] = &list
        let s:initial['relativenumber'] = &relativenumber

        if s:hasgui && !&fullscreen
            set fullscreen
        endif

        set scrolloff=999                       " Center cursor in screen
        set fillchars+=eob:\                    " Hide ~ in end of buffer

        set nolist                              " No space, tabs chars
        set norelativenumber                    " Show numbers
        set cursorline                          " Highlight row
        set cursorcolumn                        " Highlight column

        if exists(':Limelight')
            Limelight
        endif

        call <SID>goyo_enter_quit()
    endfunction

    function! s:goyo_leave() abort
        if s:hasgui && !s:initial['fullscreen']
            set nofullscreen
        endif

        silent execute 'let &scrolloff = ' . s:initial['scrolloff']
        silent execute 'let &fillchars = "' . s:initial['fillchars'] . '"'
        silent execute 'let &list = ' . s:initial['list']
        silent execute 'let &relativenumber = ' . s:initial['relativenumber']
        silent execute 'let &cursorline = ' . s:initial['cursorline']
        silent execute 'let &cursorcolumn = ' . s:initial['cursorcolumn']

        if exists(':Limelight')
            Limelight!
        endif

        call <SID>goyo_leave_quit()
    endfunction

    augroup miningboxGoyo
        autocmd!

        autocmd User GoyoEnter nested call <SID>goyo_enter()
        autocmd User GoyoLeave nested call <SID>goyo_leave()
    augroup END
endif
