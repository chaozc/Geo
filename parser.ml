type token =
  | LPAREN
  | RPAREN
  | LBRACE
  | RBRACE
  | LSQUAR
  | RSQUAR
  | SEMI
  | COLON
  | GET
  | COMMA
  | ASSIGN
  | AT
  | PLUS
  | MINUS
  | TIMES
  | DIVIDE
  | PERCENT
  | EXP
  | EQ
  | NEQ
  | LT
  | LEQ
  | GT
  | GEQ
  | NOT
  | AND
  | OR
  | BREAK
  | CONST
  | ELSE
  | END
  | FOR
  | FUNCTION
  | IMPORT
  | LIST
  | MODEL
  | RETURN
  | RUN
  | SUBMODEL
  | WHILE
  | IF
  | IN
  | TYPE of (string)
  | PRINT
  | ENDOFPROGRAM
  | EOF
  | INTEGERLIT of (int)
  | FLOATLIT of (float)
  | CHARLIT of (char)
  | BOOLLIT of (bool)
  | STRINGLIT of (string)
  | ID of (string)
  | PRESET of (string)

open Parsing;;
let _ = parse_error;;
# 1 "parser.mly"
 open Ast 
# 61 "parser.ml"
let yytransl_const = [|
  257 (* LPAREN *);
  258 (* RPAREN *);
  259 (* LBRACE *);
  260 (* RBRACE *);
  261 (* LSQUAR *);
  262 (* RSQUAR *);
  263 (* SEMI *);
  264 (* COLON *);
  265 (* GET *);
  266 (* COMMA *);
  267 (* ASSIGN *);
  268 (* AT *);
  269 (* PLUS *);
  270 (* MINUS *);
  271 (* TIMES *);
  272 (* DIVIDE *);
  273 (* PERCENT *);
  274 (* EXP *);
  275 (* EQ *);
  276 (* NEQ *);
  277 (* LT *);
  278 (* LEQ *);
  279 (* GT *);
  280 (* GEQ *);
  281 (* NOT *);
  282 (* AND *);
  283 (* OR *);
  284 (* BREAK *);
  285 (* CONST *);
  286 (* ELSE *);
  287 (* END *);
  288 (* FOR *);
  289 (* FUNCTION *);
  290 (* IMPORT *);
  291 (* LIST *);
  292 (* MODEL *);
  293 (* RETURN *);
  294 (* RUN *);
  295 (* SUBMODEL *);
  296 (* WHILE *);
  297 (* IF *);
  298 (* IN *);
  300 (* PRINT *);
  301 (* ENDOFPROGRAM *);
    0 (* EOF *);
    0|]

let yytransl_block = [|
  299 (* TYPE *);
  302 (* INTEGERLIT *);
  303 (* FLOATLIT *);
  304 (* CHARLIT *);
  305 (* BOOLLIT *);
  306 (* STRINGLIT *);
  307 (* ID *);
  308 (* PRESET *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\003\000\003\000\003\000\004\000\006\000\007\000\
\007\000\009\000\009\000\008\000\008\000\005\000\005\000\005\000\
\005\000\005\000\005\000\005\000\011\000\011\000\010\000\010\000\
\010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
\010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
\010\000\012\000\012\000\013\000\013\000\000\000"

let yylen = "\002\000\
\004\000\002\000\000\000\002\000\002\000\001\000\010\000\000\000\
\001\000\003\000\005\000\000\000\002\000\002\000\003\000\007\000\
\010\000\007\000\005\000\007\000\000\000\001\000\001\000\001\000\
\001\000\001\000\001\000\001\000\003\000\003\000\003\000\003\000\
\003\000\003\000\003\000\003\000\003\000\003\000\003\000\004\000\
\003\000\000\000\001\000\001\000\003\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\046\000\003\000\002\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\023\000\
\024\000\025\000\026\000\027\000\000\000\004\000\005\000\006\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\001\000\000\000\000\000\014\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\041\000\000\000\
\000\000\015\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\031\000\032\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\040\000\000\000\012\000\000\000\000\000\000\000\
\012\000\012\000\019\000\000\000\000\000\010\000\000\000\000\000\
\000\000\000\000\020\000\013\000\000\000\000\000\018\000\000\000\
\016\000\012\000\011\000\012\000\000\000\000\000\007\000\017\000"

let yydgoto = "\002\000\
\004\000\005\000\007\000\022\000\092\000\024\000\070\000\085\000\
\071\000\025\000\000\000\055\000\056\000"

let yysindex = "\001\000\
\215\254\000\000\223\254\000\000\000\000\000\000\009\255\137\255\
\137\255\224\254\137\255\019\255\020\255\024\255\028\000\000\000\
\000\000\000\000\000\000\000\000\003\255\000\000\000\000\000\000\
\167\000\104\000\074\000\038\255\185\000\137\255\137\255\137\255\
\000\000\137\255\137\255\000\000\137\255\137\255\137\255\137\255\
\137\255\137\255\137\255\137\255\137\255\137\255\000\000\137\255\
\253\254\000\000\119\000\134\000\149\000\089\000\049\255\052\255\
\089\000\246\254\246\254\000\000\000\000\214\000\214\000\062\255\
\062\255\062\255\062\255\202\000\044\255\064\255\055\255\059\255\
\061\255\073\255\000\000\137\255\000\000\027\255\076\255\030\255\
\000\000\000\000\000\000\089\000\063\255\000\000\028\255\079\255\
\084\255\042\255\000\000\000\000\088\255\054\255\000\000\090\255\
\000\000\000\000\000\000\000\000\105\255\126\255\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\187\255\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\097\255\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\099\255\000\000\000\000\000\000\000\000\006\255\000\000\100\255\
\005\255\211\255\235\255\000\000\000\000\065\000\072\000\003\000\
\010\000\034\000\041\000\000\000\000\000\000\000\103\255\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\007\255\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\000\000\000\000\000\000\101\000\000\000\000\000\219\255\
\000\000\248\255\000\000\000\000\000\000"

let yytablesize = 494
let yytable = "\026\000\
\027\000\001\000\029\000\034\000\039\000\040\000\039\000\044\000\
\045\000\008\000\003\000\039\000\039\000\035\000\039\000\044\000\
\045\000\006\000\028\000\030\000\031\000\051\000\052\000\053\000\
\032\000\054\000\057\000\033\000\058\000\059\000\060\000\061\000\
\062\000\063\000\064\000\065\000\066\000\067\000\049\000\068\000\
\009\000\010\000\008\000\089\000\090\000\011\000\039\000\069\000\
\012\000\013\000\075\000\078\000\014\000\015\000\016\000\017\000\
\018\000\019\000\020\000\021\000\101\000\076\000\102\000\008\000\
\080\000\079\000\081\000\084\000\082\000\086\000\093\000\096\000\
\097\000\009\000\037\000\038\000\039\000\040\000\011\000\083\000\
\088\000\012\000\013\000\087\000\008\000\014\000\094\000\016\000\
\017\000\018\000\019\000\020\000\021\000\091\000\009\000\098\000\
\099\000\100\000\042\000\011\000\008\000\043\000\012\000\013\000\
\009\000\008\000\014\000\023\000\016\000\017\000\018\000\019\000\
\020\000\021\000\095\000\009\000\000\000\000\000\000\000\000\000\
\011\000\000\000\000\000\012\000\013\000\000\000\008\000\014\000\
\000\000\016\000\017\000\018\000\019\000\020\000\021\000\103\000\
\009\000\008\000\000\000\000\000\000\000\011\000\000\000\000\000\
\012\000\013\000\000\000\000\000\014\000\000\000\016\000\017\000\
\018\000\019\000\020\000\021\000\104\000\009\000\000\000\000\000\
\000\000\000\000\011\000\000\000\000\000\012\000\013\000\000\000\
\000\000\014\000\000\000\016\000\017\000\018\000\019\000\020\000\
\021\000\000\000\000\000\000\000\000\000\000\000\016\000\017\000\
\018\000\019\000\020\000\021\000\028\000\000\000\000\000\000\000\
\000\000\028\000\028\000\000\000\028\000\000\000\000\000\028\000\
\028\000\028\000\028\000\000\000\000\000\028\000\028\000\028\000\
\028\000\028\000\028\000\000\000\029\000\000\000\000\000\000\000\
\000\000\029\000\029\000\000\000\029\000\000\000\000\000\029\000\
\029\000\000\000\000\000\000\000\028\000\029\000\029\000\029\000\
\029\000\029\000\029\000\000\000\030\000\000\000\000\000\000\000\
\000\000\030\000\030\000\000\000\030\000\000\000\000\000\030\000\
\030\000\000\000\000\000\000\000\029\000\030\000\030\000\030\000\
\030\000\030\000\030\000\000\000\035\000\000\000\000\000\000\000\
\000\000\035\000\035\000\036\000\035\000\000\000\000\000\000\000\
\036\000\036\000\000\000\036\000\030\000\035\000\035\000\035\000\
\035\000\035\000\035\000\000\000\036\000\036\000\036\000\036\000\
\036\000\036\000\000\000\037\000\000\000\000\000\000\000\000\000\
\037\000\037\000\038\000\037\000\035\000\000\000\000\000\038\000\
\038\000\000\000\038\000\036\000\037\000\037\000\037\000\037\000\
\037\000\037\000\000\000\038\000\038\000\038\000\038\000\038\000\
\038\000\000\000\033\000\000\000\000\000\000\000\000\000\033\000\
\033\000\034\000\033\000\037\000\000\000\000\000\034\000\034\000\
\000\000\034\000\038\000\033\000\033\000\000\000\037\000\038\000\
\039\000\040\000\034\000\034\000\041\000\042\000\043\000\044\000\
\045\000\046\000\000\000\000\000\000\000\037\000\038\000\039\000\
\040\000\047\000\033\000\041\000\042\000\043\000\044\000\045\000\
\046\000\034\000\000\000\048\000\037\000\038\000\039\000\040\000\
\072\000\000\000\041\000\042\000\043\000\044\000\045\000\046\000\
\000\000\000\000\000\000\037\000\038\000\039\000\040\000\073\000\
\000\000\041\000\042\000\043\000\044\000\045\000\046\000\000\000\
\000\000\000\000\037\000\038\000\039\000\040\000\074\000\000\000\
\041\000\042\000\043\000\044\000\045\000\046\000\000\000\000\000\
\000\000\037\000\038\000\039\000\040\000\000\000\000\000\041\000\
\042\000\043\000\044\000\045\000\046\000\036\000\000\000\000\000\
\000\000\000\000\000\000\037\000\038\000\039\000\040\000\000\000\
\000\000\041\000\042\000\043\000\044\000\045\000\046\000\050\000\
\000\000\000\000\000\000\000\000\000\000\037\000\038\000\039\000\
\040\000\000\000\000\000\041\000\042\000\043\000\044\000\045\000\
\046\000\077\000\000\000\000\000\000\000\000\000\037\000\038\000\
\039\000\040\000\000\000\000\000\041\000\042\000\043\000\044\000\
\045\000\046\000\037\000\038\000\039\000\040\000\000\000\000\000\
\000\000\000\000\043\000\044\000\045\000\046\000"

let yycheck = "\008\000\
\009\000\001\000\011\000\001\001\015\001\016\001\002\001\002\001\
\002\001\001\001\052\001\007\001\008\001\011\001\010\001\010\001\
\010\001\051\001\051\001\001\001\001\001\030\000\031\000\032\000\
\001\001\034\000\035\000\000\000\037\000\038\000\039\000\040\000\
\041\000\042\000\043\000\044\000\045\000\046\000\001\001\048\000\
\032\001\033\001\001\001\081\000\082\000\037\001\042\001\051\001\
\040\001\041\001\002\001\008\001\044\001\045\001\046\001\047\001\
\048\001\049\001\050\001\051\001\098\000\010\001\100\000\001\001\
\010\001\002\001\008\001\076\000\008\001\043\001\043\001\030\001\
\031\001\032\001\013\001\014\001\015\001\016\001\037\001\007\001\
\051\001\040\001\041\001\008\001\001\001\044\001\008\001\046\001\
\047\001\048\001\049\001\050\001\051\001\031\001\032\001\008\001\
\043\001\008\001\002\001\037\001\002\001\002\001\040\001\041\001\
\002\001\001\001\044\001\007\000\046\001\047\001\048\001\049\001\
\050\001\051\001\031\001\032\001\255\255\255\255\255\255\255\255\
\037\001\255\255\255\255\040\001\041\001\255\255\001\001\044\001\
\255\255\046\001\047\001\048\001\049\001\050\001\051\001\031\001\
\032\001\001\001\255\255\255\255\255\255\037\001\255\255\255\255\
\040\001\041\001\255\255\255\255\044\001\255\255\046\001\047\001\
\048\001\049\001\050\001\051\001\031\001\032\001\255\255\255\255\
\255\255\255\255\037\001\255\255\255\255\040\001\041\001\255\255\
\255\255\044\001\255\255\046\001\047\001\048\001\049\001\050\001\
\051\001\255\255\255\255\255\255\255\255\255\255\046\001\047\001\
\048\001\049\001\050\001\051\001\002\001\255\255\255\255\255\255\
\255\255\007\001\008\001\255\255\010\001\255\255\255\255\013\001\
\014\001\015\001\016\001\255\255\255\255\019\001\020\001\021\001\
\022\001\023\001\024\001\255\255\002\001\255\255\255\255\255\255\
\255\255\007\001\008\001\255\255\010\001\255\255\255\255\013\001\
\014\001\255\255\255\255\255\255\042\001\019\001\020\001\021\001\
\022\001\023\001\024\001\255\255\002\001\255\255\255\255\255\255\
\255\255\007\001\008\001\255\255\010\001\255\255\255\255\013\001\
\014\001\255\255\255\255\255\255\042\001\019\001\020\001\021\001\
\022\001\023\001\024\001\255\255\002\001\255\255\255\255\255\255\
\255\255\007\001\008\001\002\001\010\001\255\255\255\255\255\255\
\007\001\008\001\255\255\010\001\042\001\019\001\020\001\021\001\
\022\001\023\001\024\001\255\255\019\001\020\001\021\001\022\001\
\023\001\024\001\255\255\002\001\255\255\255\255\255\255\255\255\
\007\001\008\001\002\001\010\001\042\001\255\255\255\255\007\001\
\008\001\255\255\010\001\042\001\019\001\020\001\021\001\022\001\
\023\001\024\001\255\255\019\001\020\001\021\001\022\001\023\001\
\024\001\255\255\002\001\255\255\255\255\255\255\255\255\007\001\
\008\001\002\001\010\001\042\001\255\255\255\255\007\001\008\001\
\255\255\010\001\042\001\019\001\020\001\255\255\013\001\014\001\
\015\001\016\001\019\001\020\001\019\001\020\001\021\001\022\001\
\023\001\024\001\255\255\255\255\255\255\013\001\014\001\015\001\
\016\001\002\001\042\001\019\001\020\001\021\001\022\001\023\001\
\024\001\042\001\255\255\042\001\013\001\014\001\015\001\016\001\
\002\001\255\255\019\001\020\001\021\001\022\001\023\001\024\001\
\255\255\255\255\255\255\013\001\014\001\015\001\016\001\002\001\
\255\255\019\001\020\001\021\001\022\001\023\001\024\001\255\255\
\255\255\255\255\013\001\014\001\015\001\016\001\002\001\255\255\
\019\001\020\001\021\001\022\001\023\001\024\001\255\255\255\255\
\255\255\013\001\014\001\015\001\016\001\255\255\255\255\019\001\
\020\001\021\001\022\001\023\001\024\001\007\001\255\255\255\255\
\255\255\255\255\255\255\013\001\014\001\015\001\016\001\255\255\
\255\255\019\001\020\001\021\001\022\001\023\001\024\001\007\001\
\255\255\255\255\255\255\255\255\255\255\013\001\014\001\015\001\
\016\001\255\255\255\255\019\001\020\001\021\001\022\001\023\001\
\024\001\008\001\255\255\255\255\255\255\255\255\013\001\014\001\
\015\001\016\001\255\255\255\255\019\001\020\001\021\001\022\001\
\023\001\024\001\013\001\014\001\015\001\016\001\255\255\255\255\
\255\255\255\255\021\001\022\001\023\001\024\001"

let yynames_const = "\
  LPAREN\000\
  RPAREN\000\
  LBRACE\000\
  RBRACE\000\
  LSQUAR\000\
  RSQUAR\000\
  SEMI\000\
  COLON\000\
  GET\000\
  COMMA\000\
  ASSIGN\000\
  AT\000\
  PLUS\000\
  MINUS\000\
  TIMES\000\
  DIVIDE\000\
  PERCENT\000\
  EXP\000\
  EQ\000\
  NEQ\000\
  LT\000\
  LEQ\000\
  GT\000\
  GEQ\000\
  NOT\000\
  AND\000\
  OR\000\
  BREAK\000\
  CONST\000\
  ELSE\000\
  END\000\
  FOR\000\
  FUNCTION\000\
  IMPORT\000\
  LIST\000\
  MODEL\000\
  RETURN\000\
  RUN\000\
  SUBMODEL\000\
  WHILE\000\
  IF\000\
  IN\000\
  PRINT\000\
  ENDOFPROGRAM\000\
  EOF\000\
  "

let yynames_block = "\
  TYPE\000\
  INTEGERLIT\000\
  FLOATLIT\000\
  CHARLIT\000\
  BOOLLIT\000\
  STRINGLIT\000\
  ID\000\
  PRESET\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'preset) in
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'bodies) in
    Obj.repr(
# 30 "parser.mly"
                                ( _2 )
# 386 "parser.ml"
               : Ast.program))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 33 "parser.mly"
           ( Preset(_1, _2) )
# 394 "parser.ml"
               : 'preset))
; (fun __caml_parser_env ->
    Obj.repr(
# 36 "parser.mly"
                  ( [], [] )
# 400 "parser.ml"
               : 'bodies))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'bodies) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'decl) in
    Obj.repr(
# 37 "parser.mly"
                ( (_2 :: fst _1), snd _1 )
# 408 "parser.ml"
               : 'bodies))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'bodies) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 38 "parser.mly"
                ( fst _1, (_2 :: snd _1) )
# 416 "parser.ml"
               : 'bodies))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'fdecl) in
    Obj.repr(
# 41 "parser.mly"
       ( _1 )
# 423 "parser.ml"
               : 'decl))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 8 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 6 : 'paras_opt) in
    let _7 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _9 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 45 "parser.mly"
 ({
		fname = _2;
		paras = _4;
		body = List.rev _9
	})
# 437 "parser.ml"
               : 'fdecl))
; (fun __caml_parser_env ->
    Obj.repr(
# 52 "parser.mly"
                    ( [] )
# 443 "parser.ml"
               : 'paras_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'paras_list) in
    Obj.repr(
# 53 "parser.mly"
                  ( List.rev _1 )
# 450 "parser.ml"
               : 'paras_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 56 "parser.mly"
                                   ( [_1] )
# 458 "parser.ml"
               : 'paras_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 4 : 'paras_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 57 "parser.mly"
                                    ( _3 :: _1 )
# 467 "parser.ml"
               : 'paras_list))
; (fun __caml_parser_env ->
    Obj.repr(
# 60 "parser.mly"
                     ( [] )
# 473 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 61 "parser.mly"
                    ( _2 :: _1 )
# 481 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 64 "parser.mly"
                ( Expr(_1) )
# 488 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 65 "parser.mly"
                       ( Return(_2) )
# 495 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _6 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 67 "parser.mly"
      ( If(_3, _6, []) )
# 503 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 7 : 'expr) in
    let _6 = (Parsing.peek_val __caml_parser_env 4 : 'stmt_list) in
    let _9 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 69 "parser.mly"
      ( If(_3, _6, _9) )
# 512 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _6 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 70 "parser.mly"
                                                   ( While(_3, _6) )
# 520 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    Obj.repr(
# 71 "parser.mly"
                                    ( Print(_3) )
# 527 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 5 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 3 : 'expr) in
    let _6 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 72 "parser.mly"
                                           ( For(_2, _4, _6) )
# 536 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    Obj.repr(
# 75 "parser.mly"
                  ( Noexpr )
# 542 "parser.ml"
               : 'expr_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 76 "parser.mly"
           ( _1 )
# 549 "parser.ml"
               : 'expr_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 79 "parser.mly"
                       ( Int(_1) )
# 556 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : float) in
    Obj.repr(
# 80 "parser.mly"
                      ( Float(_1) )
# 563 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : char) in
    Obj.repr(
# 81 "parser.mly"
                      ( Char(_1) )
# 570 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : bool) in
    Obj.repr(
# 82 "parser.mly"
                      ( Bool(_1) )
# 577 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 83 "parser.mly"
                      ( String(_1) )
# 584 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 84 "parser.mly"
                      ( Id(_1) )
# 591 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 85 "parser.mly"
                      ( Binop(_1, Add,   _3) )
# 599 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 86 "parser.mly"
                      ( Binop(_1, Sub,   _3) )
# 607 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 87 "parser.mly"
                      ( Binop(_1, Mult,  _3) )
# 615 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 88 "parser.mly"
                      ( Binop(_1, Div,   _3) )
# 623 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 89 "parser.mly"
                      ( Binop(_1, Equal, _3) )
# 631 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 90 "parser.mly"
                      ( Binop(_1, Neq,   _3) )
# 639 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 91 "parser.mly"
                      ( Binop(_1, Less,  _3) )
# 647 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 92 "parser.mly"
                      ( Binop(_1, Leq,   _3) )
# 655 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 93 "parser.mly"
                      ( Binop(_1, Greater,  _3) )
# 663 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 94 "parser.mly"
                      ( Binop(_1, Geq,   _3) )
# 671 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 95 "parser.mly"
                      ( Assign(_1, _3) )
# 679 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'actuals_opt) in
    Obj.repr(
# 96 "parser.mly"
                                  ( Call(_1, _3) )
# 687 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 97 "parser.mly"
                        ( _2 )
# 694 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 100 "parser.mly"
                  ( [] )
# 700 "parser.ml"
               : 'actuals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'actuals_list) in
    Obj.repr(
# 101 "parser.mly"
                   ( List.rev _1 )
# 707 "parser.ml"
               : 'actuals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 104 "parser.mly"
                            ( [_1] )
# 714 "parser.ml"
               : 'actuals_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'actuals_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 105 "parser.mly"
                             ( _3 :: _1 )
# 722 "parser.ml"
               : 'actuals_list))
(* Entry program *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let program (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : Ast.program)
