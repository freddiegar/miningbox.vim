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

        cabbrev <buffer> q! silent let b:quitting_bang = 1 <bar> q!
    endfunction

    function! s:goyo_leave_quit() abort
        if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
            if b:quitting_bang
                qall!
            else
                qall
            endif
        endif
    endfunction

    function! s:goyo_enter() abort
        if has('gui_running')
            set fullscreen
        endif

        set scrolloff=999                       " Center cursor in screen
        set cursorline                          " Highlitght cursor
        set nolist                              " No space, tabs chars
        set fillchars+=eob:\                    " Hide ~ in end of buffer

        if exists(':Limelight')
            Limelight
        endif

        call <SID>goyo_enter_quit()
    endfunction

    function! s:goyo_leave() abort
        if has('gui_running')
            set nofullscreen
        endif

        set scrolloff&
        set cursorline&
        set list&
        set fillchars&

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

    augroup miningboxJson
        autocmd!

        autocmd FileType json syntax match Comment +\/\/.\+$+
    augroup END
endif
