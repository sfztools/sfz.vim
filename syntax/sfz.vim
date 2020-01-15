" Vim syntax file
" Language: SFZ
" Maintainer: J Isaac Stone
" Latest Revision: 15 Jan 2020
if exists("b:current_syntax")
  finish
endif

syn match lineCommentSFZ "//.*$"
syn region blockCommentSFZ start="/\*" end="\*/" fold

" most sfz files contain only one <control> header if any
" so folding to next header makes more sense than folding to EOF
syn region controlReg matchgroup=headerSFZ fold contains=TOP
    \ start="<control>"
    \ end="<[a-z]\+>"me=s-1
" could argue the same is true of <global>
" wonder if there is a way to have vim count the # of matches
syn region globalReg matchgroup=headerSFZ fold contains=TOP
    \ start="<global>"
    \ end="<global>"me=s-1 end="<control>"me=s-1
syn region masterReg matchgroup=headerSFZ fold contains=TOP
    \ start="<master>"
    \ end="<global>"me=s-1 end="<control>"me=s-1 end="<master>"me=s-1
syn region groupReg matchgroup=headerSFZ fold contains=TOP
    \ start="<group>"
    \ end="<global>"me=s-1 end="<control>"me=s-1 end="<master>"me=s-1 end="<group>"me=s-1
syn region headerReg matchgroup=headerSFZ fold contains=TOP
    \ start="<region>" start="<curve>" start="<effect>" start="<midi>"
    \ end="<[a-z]\+>"me=s-1

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
