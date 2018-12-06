" Vim syntax file
" Language: capnp
" Maintainer: Andreas Misje

if exists("b:current_syntax")
  finish
endif

syn case    match

syn keyword capnpTodo         contained TODO FIXME XXX
syn cluster capnpCommentGroup contains=capnpTodo

" Keywords
syn keyword capnpDeclaration  struct union enum interface const annotation
syn keyword capnpKeyword      using extends
syn match   capnpArrow        display "->"

" Imports
syn region  capnpImport       start=/\$?import\s*"/ skip=/\\"/ end=/"/

" Types
syn cluster capnpTypeGroup    contains=capnpTypeBrand,capnpBuiltinType,capnpImport
syn keyword capnpBuiltinType  contained Void Bool Text Data List union group
syn keyword capnpBuiltinType  contained Int8 Int16 Int32 Int64
syn keyword capnpBuiltinType  contained UInt8 UInt16 UInt32 UInt64
syn keyword capnpBuiltinType  contained Float32 Float64
" FIXME: Incorrectly colours multi-line contents in parentheses:
syn region  capnpType         start=/:\s*\zs/ end=/[^\sa-zA-Z0-9_\.]/ contains=@capnpTypeGroup
syn region  capnpTypeBrand    transparent contained start=/(/ end=/)/

" Literals
syn region  capnpString       start=/"/ skip=/\\"/ end=/"/
syn match   capnpNumbers      display transparent /\<\d\|\.\d/ contains=capnpNumber,capnpFloat
syn match   capnpNumber       display contained /\d\+\>/
syn match   capnpNumber       display contained /0x\x\+\>/
syn match   capnpFloat        display contained /\d\+\.\d*\([eE][-+]\=\d\+\)\=/
syn match   capnpFloat        display contained /\.\d\+\([eE][-+]\=\d\+\)\=\>/
syn match   capnpFloat        display contained /\d\+[eE][-+]\=\d\+\>/
syn keyword capnpBoolean      true false
syn keyword capnpFloat        inf

" Comments
syn match   capnpComment      "#.*$" contains=@Spell,@capnpCommentGroup

" Ordinals
syn match   capnpOrdinal      display "@[a-fA-F0-9]\+"

" File IDs
syn match   capnpFileId       display "@0x[a-fA-F0-9]\+"

" Annotations
syn region  capnpAnnotation   start=/\$/ end=/[;()\n]/re=s-1,he=s-1 oneline contains=capnpImport

" Braces
syn region  capnpFold         matchgroup=capnpBraces start="{" end="}" transparent fold

" Highlighting
hi link capnpComment          Comment
hi link capnpDeclaration      Structure
hi link capnpKeyword          Keyword
hi link capnpImport           Include
hi link capnpString           String
hi link capnpNumber           Number
hi link capnpFloat            Float
hi link capnpBoolean          Boolean
hi link capnpType             Type
hi link capnpBuiltinType      Type
hi link capnpOrdinal          Identifier
hi link capnpFileId           Identifier
hi link capnpAnnotation       Statement
hi link capnpTodo             Todo
hi link capnpArrow            Operator

let b:current_syntax = "capnp"
