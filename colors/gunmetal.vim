" Clear UI
hi ColorColumn      none
hi Conceal          none
hi Cursor           none
hi CursorIM         none
hi CursorColumn     none
hi CursorLine       none
hi Directory        none
hi DiffAdd          none
hi DiffChange       none
hi DiffDelete       none
hi DiffText         none
hi EndOfBuffer      none
hi TermCursor       none
hi TermCursorNC     none
hi ErrorMsg         none
hi VertSplit        none
hi Folded           none
hi FoldColumn       none
hi SignColumn       none
hi IncSearch        none
hi Substitute       none
hi LineNr           none
hi CursorLineNr     none
hi MatchParen       none
hi ModeMsg          none
hi MsgArea          none
hi MsgSeparator     none
hi MoreMsg          none
hi NonText          none
hi Normal           none
hi NormalFloat      none
hi NormalNC         none
hi Pmenu            none
hi PmenuSel         none
hi PmenuSbar        none
hi PmenuThumb       none
hi Question         none
hi QuickFixLine     none
hi Search           none
hi SpecialKey       none
hi SpellBad         none
hi SpellCap         none
hi SpellLocal       none
hi SpellRare        none
hi StatusLine       none
hi StatusLineNC     none
hi TabLine          none
hi TabLineFill      none
hi TabLineSel       none
hi Title            none
hi Visual           none
hi VisualNOS        none
hi WarningMsg       none
hi Whitespace       none
hi WildMenu         none

" Clear Syntax
hi Comment	        none
hi Constant	        none
hi String		    none
hi Character	    none
hi Number		    none
hi Boolean	        none
hi Float		    none
hi Identifier	    none
hi Function	        none
hi Statement	    none
hi Conditional	    none
hi Repeat		    none
hi Label		    none
hi Operator	        none
hi Keyword	        none
hi Exception	    none
hi PreProc	        none
hi Include	        none
hi Define		    none
hi Macro		    none
hi PreCondit	    none
hi Type		        none
hi StorageClass	    none
hi Structure	    none
hi Typedef	        none
hi Special	        none
hi SpecialChar	    none
hi Tag		        none
hi Delimiter	    none
hi SpecialComment   none
hi Debug		    none
hi Underlined	    none
hi Ignore		    none
hi Error		    none
hi Todo		        none

" Colors
function! s:SetHi(grp, fg, bg, style)
    exec 'highlight ' . a:grp . ' guifg=' . a:fg . ' guibg=' . a:bg . ' gui=' . a:style
endfunc

" Color generator:
" https://coolors.co/dadcd8-746560-0f1218-d7b58c-6a70d9
"
" Dark      #0F1218 (Rich Black FOGRA 29)
" Light     #DADCD8 (Timberwolf)
" Gold      #D7B58C (Tan)
" Gray      #746560 (Dim Gray)
" Blue      #6A70D9 (Violet Blue Crayola)

let s:Dark0     = "#0F1218" " 0 (Tint)
let s:Dark1     = "#1D222E"
let s:Dark2     = "#2A3242"

let s:Light0    = "#DADCD8" " 0 (Shade)
let s:Light1    = "#C9CCC7"
let s:Light2    = "#BABDB6"
let s:Light3    = "#AAAFA6"
let s:Light4    = "#9BA096"
let s:Light5    = "#8B9186"

let s:Gold0     = "#D7B58C"
let s:Gray0     = "#746560"
let s:Blue0     = "#6A70D9"

"            --------------------------------------------------------
"            | GROUP            | FG        | BG        | STYLE     |
"            --------------------------------------------------------
call s:SetHi("Normal",          s:Light0,   s:Dark0,    "none")
call s:SetHi("Comment",         s:Light5,   "none",     "italic")
call s:SetHi("Statement",       s:Light0,   "none",     "bold")
call s:SetHi("LineNr",          s:Dark1,    "none",     "none")
call s:SetHi("CursorLineNr",    s:Dark2,    "none",     "bold")
call s:SetHi("String",          s:Light3,   "none",     "none")
call s:SetHi("Special",         s:Light3,   "none",     "bold")
call s:SetHi("Visual",          "none",     s:Dark1,    "none")
call s:SetHi("PmenuSel",        "none",     s:Dark2,    "bold")
call s:SetHi("Search",          "none",     s:Dark2,    "none")
call s:SetHi("SpellBad",        "none",     "none",     "underline")

" Status line
call s:SetHi("StatusLine",      s:Dark0,    s:Gold0,    "none")
call s:SetHi("StatusLineNC",    s:Dark0,    s:Light1,   "none")

" Linking
hi link             Type          Statement
hi link             PreProc       Statement
hi link             Character     String
hi link             Number        String
hi link             SpecialChar   Special
hi link             CursorLine    Visual
hi link             ColorColumn   Visual
hi link             Pmenu         Visual
hi link             SpellCap      SpellBad
