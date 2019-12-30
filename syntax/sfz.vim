" Vim syntax file
" Language: SFZ
" Maintainer: J Isaac Stone
" Latest Revision: 28 Dec 2019
if exists("b:current_syntax")
  finish
endif

syn match lineCommentSFZ "//.*$"
syn region blockCommentSFZ start="/\*" end="\*/"

" numbers are colored, strings and file paths are not.
syn match integerSFZ "\d\+" contained display
syn match integerSFZ "[+-]\d\+" contained display
syn match floatSFZ "\d\+.\d\+" contained display
syn match floatSFZ "[+-]\d\+.\d\+" contained display
" matches note names: c5, a#2. Equivelent to note number so should be colored the same
syn match keySFZ "[a-gA-G][0-9]" contained display
syn match keySFZ "[a-gA-G][#b][0-9]" contained display
" distinguish equals sign visually from the value to the right
syn match equalsSFZ "=" contained display
syn match optcodeSFZ "[a-z][a-zA-Z0-9_]\+="he=e-1 contains=equalsSFZ nextgroup=integerSFZ,floatSFZ,keySFZ
syn match headerSFZ "^\s*<\(region\|group\|control\|global\|curve\|effect\|master\)>"
syn match macroSFZ "^\s*\#\s*\(define\|include\)"

let b:current_syntax = "sfz"

hi def link lineCommentSFZ Comment
hi def link blockCommentSFZ Comment
hi def link integerSFZ Type
hi def link floatSFZ Type
hi def link keySFZ Type
hi def link headerSFZ Identifier
hi def link optcodeSFZ Statement
hi def link equalsSFZ Delimiter
hi def link macroSFZ PreProc
