command ToggleQL :call functions#ToggleQuickFix()
command ToggleLL :call functions#ToggleLocation()
command ToggleInsertTarget :call functions#ToggleInsertTarget()
command DebugSyntax :call functions#DebugSyntax()

command! -nargs=* Cexpr cexpr system(expand(<q-args>))
command! -nargs=* Fd cexpr system('fd ' . expand(<q-args>))
command! -nargs=* -complete=file_in_path Grep cexpr system(&grepprg . ' ' . expand(<q-args>))
