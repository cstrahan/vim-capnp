if exists("b:did_indent")
	finish
endif
let b:did_indent = 1

setlocal autoindent
setlocal nolisp
setlocal indentexpr=CapnpIndent(v:lnum)

if exists('*CapnpIndent')
	finish
endif

function! CapnpIndent(lineNum)
	let l:prevLineNum = prevnonblank(a:lineNum - 1)
	if l:prevLineNum == 0
		return 0
	endif

	let l:prevLine = substitute(getline(l:prevLineNum), '#.*$', '', '')
	let l:line = substitute(getline(a:lineNum), '#.*$', '', '')
	let l:prevIndent = indent(l:prevLineNum)
	let l:indent = l:prevIndent

	if l:prevLine =~ '[({]\s*$'
		let l:indent += shiftwidth()
	endif

	if l:line =~ '^\s*[)}]'
		let l:indent -= shiftwidth()
	endif

	return l:indent
endfunction
