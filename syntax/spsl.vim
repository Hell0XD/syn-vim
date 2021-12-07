
syn region langComment start="#" end="\n"

syntax keyword langKeyword if def defn lambda mod !

syntax match langNumber "\v<\d+>"
syntax match langNumber "\v<0x\x+([Pp]-?)?\x+>"
syntax match langNumber "\v<0b[01]+>"

syntax region langString start=/"/ skip=/\\"/ end=/"/ oneline contains=InterpolatedWrapper
syntax region InterpolatedWrapper start="\v\\\(\s*" end="\v\s*\)" contained containedin=langString contains=InterpolatedString
syntax match InterpolatedString "\v\w+(\(\))?" contained containedin=InterpolatedWrapperi

syntax match langOperator "[+-/*=><]"

syn match langDeclareFunction "\w\+" contained 
syn match langDefn "defn" skipwhite nextgroup=langDeclareFunction

hi def link langKeyword Keyword
hi def link langNumber Number
hi def link langString String
hi def link langOperator Operator
hi def link langComment Comment
hi def link langDeclareFunction Number
