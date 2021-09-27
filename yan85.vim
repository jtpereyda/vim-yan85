" Vim syntax file
" Language: Yan85 Assembly
" Maintainer: Joshua Pereyda

if exists("b:current_syntax")
  finish
endif

syn keyword imm IMM nextgroup=immReg,immStar skipwhite
syn match immStar contained '*' nextgroup=immReg skipwhite
syn match immReg contained '[abcdsif]' nextgroup=immVal,immEq skipwhite
syn match immEq contained '=' nextgroup=immVal skipwhite
syn match immVal contained '0x[0-9a-fA-F]\{1,2}'

syn keyword add ADD nextgroup=reg,none,star skipwhite
syn keyword ldm LDM nextgroup=reg,none,star skipwhite
syn keyword stm STM nextgroup=reg,none,star skipwhite
syn keyword stk STK nextgroup=reg,none,star skipwhite
syn keyword cmp CMP nextgroup=reg,none,star skipwhite
syn match star contained '*' nextgroup=reg,none skipwhite
syn match reg contained '[abcdsif]' nextgroup=reg,none,equals skipwhite
syn match none contained 'NONE' nextgroup=reg,none,equals skipwhite
syn match equals contained '=' nextgroup=reg,none skipwhite

syn keyword sys SYS nextgroup=sysNum skipwhite
syn match sysNum contained '0x[0-9a-fA-F]\{1,2}' nextgroup=sysReg,sysNone skipwhite
syn match sysReg contained '[abcdsif]'
syn match sysNone contained 'NONE'

syn keyword jmp JMP nextgroup=jmpFlags skipwhite
syn match jmpFlags contained '0x[0-9a-fA-F]\{1,2}' nextgroup=jmpReg,jmpNone skipwhite
syn match jmpReg contained '[abcdsif]'
syn match jmpNone contained 'NONE'

syn match lineNum '0x[0-9a-fA-F]\{1,2}:'
syn match lineStart "\[s\]"
syn match comment "#.*$"

let b:current_syntax = "yan85"

hi def link imm          Statement
hi def link add          Statement
hi def link ldm          Statement
hi def link stm          Statement
hi def link stk          Statement
hi def link cmp          Statement
hi def link jmp          Statement
hi def link sys          Statement

hi def link reg          Label
hi def link sysReg       Label
hi def link jmpReg       Label
hi def link immReg       Label
hi def link none         Macro
hi def link sysNone      Macro
hi def link jmpNone      Macro

hi def link immVal       Number
hi def link sysNum       Function
hi def link jmpFlags     Function
hi def link lineStart    Comment
hi def link lineNum      Comment
hi def link comment      Comment
