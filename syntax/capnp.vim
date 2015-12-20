" Vim syntax file
" Language: capnp
" Maintainer: Charles Strahan

if exists("b:current_syntax")
  finish
endif

syn case match

syn keyword capnpTodo       contained TODO FIXME XXX
syn cluster capnpCommentGrp contains=capnpTodo

syn keyword capnpInclude    import using
syn keyword capnpStructure  annotation struct union
syn keyword capnpInterface  interface extends

syn match   capnpType       /:[a-zA-Z0-9]\+/
syn keyword capnpTypedef    const enum

syn keyword capnpBool       true false
syn match   capnpInt        /-\?\<\d\+\>/
syn match   capnpInt        /\<0[xX]\x+\>/
syn match   capnpFloat      /\<-\?\d*\(\.\d*\)\?/
syn match   capnpRocket     /->/
syn match   capnpComment    /#.*$/
syn region  capnpString     start=/"/ skip=/\\"/ end=/"/

syn match   capnpList       /:List([a-zA-Z0-9()]\+)/
syn match   capnpTag        /@[a-fA-F0-9]\+/
syn match   capnpId         /@0x[a-fA-F0-9]\+/
syn match   capnpAnnotation /$[^;()]\+/

syn region  capnpFold       matchgroup=capnpBraces start="{" end="}" transparent fold

hi def link capnpTodo       Todo

hi def link capnpInclude    Include
hi def link capnpStructure  Structure
hi def link capnpInterface  Keyword

hi def link capnpType       Type
hi def link capnpTypedef    Typedef

hi def link capnpBool       Boolean
hi def link capnpInt        Number
hi def link capnpFloat      Float
hi def link capnpRocket     Keyword
hi def link capnpComment    Comment
hi def link capnpString     String

hi def link capnpList       Type
hi def link capnpTag        Identifier
hi def link capnpId         Identifier
hi def link capnpAnnotation Identifier

let b:current_syntax = "capnp"
