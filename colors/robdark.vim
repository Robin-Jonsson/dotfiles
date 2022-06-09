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
" https://huemint.com/brand-intersection/#palette=fffbe8-2c2b2d-90643b-daaf48
"
" Tint/Shade:
" https://maketintsandshades.com/#fffbe8,2c2b2d,90643b,daaf48

let s:Dark0     = "#2c2b2d"
let s:Dark1     = "#414042"
let s:Dark2     = "#565557"
let s:Dark3     = "#6b6b6c"
let s:Dark4     = "#808081"

let s:Light0    = "#fffbe8"
let s:Light1    = "#e6e2d1"
let s:Light2    = "#ccc9ba"
let s:Light3    = "#b3b0a2"
let s:Light4    = "#99978b"

let s:Accent0   = "#90643b"
let s:Accent1   = "#9b744f"
let s:Accent2   = "#a68362"
let s:Accent3   = "#b19376"
let s:Accent4   = "#bca289"

let s:Gold0     = "#daaf48"
let s:Gold1     = "#deb75a"
let s:Gold2     = "#e1bf6d"
let s:Gold3     = "#e5c77f"
let s:Gold4     = "#e9cf91"

"            --------------------------------------------------------
"            | GROUP            | FG        | BG        | STYLE     |
"            --------------------------------------------------------
call s:SetHi("Normal",          s:Light0,   s:Dark0,    "none")
call s:SetHi("Comment",         s:Light4,   "none",     "italic")
call s:SetHi("Statement",       s:Light0,   "none",     "bold")
call s:SetHi("LineNr",          s:Dark2,    "none",     "none")
call s:SetHi("CursorLineNr",    s:Accent1,  "none",     "bold")
" Bugfix
set cursorline
call s:SetHi("CursorLine",      "none",     "none",     "none")
call s:SetHi("String",          s:Light3,   "none",     "none")
call s:SetHi("Special",         s:Light0,   "none",     "bold")
call s:SetHi("Visual",          "none",     s:Dark1,    "none")
call s:SetHi("PmenuSel",        "none",     s:Dark2,    "bold")
call s:SetHi("Search",          "none",     s:Dark2,    "none")
call s:SetHi("SpellBad",        "none",     "none",     "underline")

" Status line
call s:SetHi("StatusLine",      s:Dark0,    s:Gold4,    "none")
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
