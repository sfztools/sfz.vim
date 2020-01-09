" Vim syntax file
" Language: SFZ
" Maintainer: J Isaac Stone
" Latest Revision: 9 Jan 2020
if exists("b:current_syntax")
  finish
endif

syn match lineCommentSFZ "//.*$"
syn region blockCommentSFZ start="/\*" end="\*/" fold

" Master and group regions fold until next region of same type, others fold
" until next region of any type
syn region masterReg matchgroup=headerSFZ start="<master>" end="<master>"me=s-1 fold contains=TOP
syn region groupReg matchgroup=headerSFZ start="<group>" end="<group>"me=s-1 fold contains=TOP
syn region headerReg matchgroup=headerSFZ start="<\(region\|control\|global\|curve\|effect\|midi\)>" end="<[a-z]\+>"me=s-1 fold contains=TOP

" Numbers are colored, strings and file paths are not.
syn match integerSFZ "\d\+" contained display
syn match integerSFZ "[+-]\d\+" contained display
syn match floatSFZ "\d\+.\d\+" contained display
syn match floatSFZ "[+-]\d\+.\d\+" contained display
" Matches note names: c5, a#2. Equivelent to note number so should be colored the same
syn match keySFZ "[a-gA-G][0-9]" contained display
syn match keySFZ "[a-gA-G][#b][0-9]" contained display
syn match defineVarSFZ "\$[a-zA-Z_][a-zA-Z0-9_]*" contained display
syn cluster opValuesSFZ contains=integerSFZ,floatSFZ,keySFZ,defineVarSFZ
" Distinguish equals sign visually from the value to the right
syn match equalsSFZ "=" contained display
syn match opcodeSFZ "[a-z][a-zA-Z0-9_]\+="he=e-1 contains=equalsSFZ nextgroup=@opValuesSFZ
syn match macroSFZ "^\s*\#\s*\(define\|include\).*$" contains=macroNameSFZ,@opValuesSFZ
syn match macroNameSFZ "\#\s*\(define\|include\)" contained display

let b:current_syntax = "sfz"

hi def link lineCommentSFZ Comment
hi def link blockCommentSFZ Comment
hi def link integerSFZ Type
hi def link floatSFZ Type
hi def link keySFZ Type
hi def link defineVarSFZ PreProc
hi def link headerSFZ Identifier
hi def link opcodeSFZ Statement
hi def link equalsSFZ Delimiter
hi def link macroNameSFZ PreProc
