let s:path = fnamemodify(resolve(expand('<sfile>:p')), ':h')

augroup sfz_filetype_script
  autocmd!
  au BufRead,BufNewFile *.sfz set filetype=sfz dictionary=s:path.'sfz.dict'
augroup END
