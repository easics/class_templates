function! CreateHeaderIfndef()
  let l:filename = substitute(expand('%'), ".*\/", "", "")
  if (matchstr(l:filename, "\.h$") !=? ".h")
    echo l:filename . " is not a header file"
    return
  endif
  let l:firstline = getline(1)
  if (l:firstline != "" && match(l:firstline, "^#ifndef") != -1)
    echo l:filename . " already has an ifndef construct"
    return
  endif

  let l:define_name=substitute(l:filename, "[.]", "_", "g") . "_"
  let l:error=append(0, "#ifndef " . l:define_name)
  let l:error=append(1, "#define " . l:define_name)
  let l:error=append(2, "")
  let l:error=append(line("$"), "")
  let l:error=append(line("$"), "#endif")

endfunction
