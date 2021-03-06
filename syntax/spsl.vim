

" Comment
syn region langComment start="#" end="\n"

" Atom
syn match langAtom ":[a-zA-Z]\+"

" Number
syntax match langNumber "\v<\d+>"
syntax match langNumber "\v<0x\x+([Pp]-?)?\x+>"
syntax match langNumber "\v<0b[01]+>"

" String
syntax region langString start=/"/ skip=/\\"/ end=/"/ oneline contains=InterpolatedWrapper
syntax region InterpolatedWrapper start="\v\\\(\s*" end="\v\s*\)" contained containedin=langString contains=InterpolatedString
syntax match InterpolatedString "\v\w+(\(\))?" contained containedin=InterpolatedWrapperi

" Operators
syntax match langOperator "[+-/*=><]"


### ### ###

syn match langOpeningBracket "(" skipwhite nextgroup=langDefn,langKeyword,langCallFunction

syn keyword langDefn defn skipwhite contained nextgroup=langDeclareFunction

syn keyword langKeyword if def lambda do contained

syn match langDeclareFunction "[a-zA-Z]\+" contained

syn match langCallFunction "[a-zA-Z]\+" contained



" Highlighting
hi def link langKeyword Keyword
hi def link langDefn Keyword

hi def link langNumber Number
hi def link langString String
hi def link langOperator Operator
hi def link langComment Comment

hi def link langDeclareFunction Function
hi def link langCallFunction Function

hi def link langAtom Boolean
