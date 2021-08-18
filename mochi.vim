"			             _     _	         _
"           			| |   (_)	        (_)
"   _ __ ___   ___   ___| |__  _      __   ___ _ __ ___
"  | '_ ` _ \ / _ \ / __| '_ \| |     \ \ / / | '_ ` _ \
"  | | | | | | (_) | (__| | | | |  _   \ V /| | | | | | |
"  |_| |_| |_|\___/ \___|_| |_|_| (_)	\_/ |_|_| |_| |_|
"
" Author: Hudson Smith
" Github: @hudsonsmith
" Description: "A dark theme that easy on the eyes."


" Make sure to clear any other predefined colors on the screen.
highlight clear
if exists("syntax_on")
    syntax reset
endif


" Enable gui colors if the terminal supports them
if (has('termguicolors'))
  set termguicolors
endif


" Make the background dark.
set background=dark


" Enable the cursorline.
hi CursorLine term=bold cterm=bold guibg=#1D1D26
set cul

" Make a function to change the colors.
function! GuiFor(group, ...)
    let histring = 'hi ' . a:group . ' '

    if strlen(a:1)
        let histring .= 'guibg=' . a:1 . ' '
    endif

    if strlen(a:2)
        let histring .= 'guifg=' . a:2 . ' '
    endif

    if a:0 >= 3 && strlen(a:3)
        let histring .= 'gui=' . a:3 . ' '
    endif

    execute histring
endfunction

" Set the background.
call GuiFor("Normal", "#1D1D26", "NONE")

" Hide Tildas.
call GuiFor("NonText", "NONE", "#1D1D26")

" Set the colors for the line numbers.
call GuiFor("LineNr", "#252530", "#80A0FF")
hi CursorLineNr guibg=#252530 guifg=#FF80FF cterm=bold term=bold

" Set the TabLine color.
call GuiFor("TabLineFill", "NONE", "#252530")
call GuiFor("TabLineSel", "#FF80FF", "#000000")
call GuiFor("TabLine", "#252530", "#474747")
call GuiFor("Title", "NONE", "#000000")
call GuiFor("VertSplit", "NONE", "#252530")

" Highlight variables.
call GuiFor("String", "NONE", "#60FF60")
call GuiFor("Special", "NONE", "#FF80FF")
call GuiFor("Type", "NONE", "#FF80FF")
call GuiFor("Statement", "NONE", "#FF80FF")
call GuiFor("Keyword", "NONE", "#40FFFF")

" Python advanced syntax support.
" TODO: Make the regex work.
" syn match pythonSpecialChar "\(\*|-|+|/|%|[|]\)"
syntax keyword pythonKeyword self __main__ char string i j k 
syntax keyword pythonImport json random choice time os
highlight link pythonKeyword Keyword
highlight link pythonImport Keyword
highlight link pythonSpecialChar Keyword


" Highlight errors.
call GuiFor("ErrorMsg", "#FF80FF", "#000000")

" Highlight the gutter.
call GuiFor("SignColumn", "#252530", "NONE")

" Highlight git gutter signs.
call GuiFor("GitGutterAdd", "#252530", "#60FF60")
call GuiFor("GitGutterChange", "#252530", "#ff8c00")


