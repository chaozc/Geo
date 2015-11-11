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
  | ELIF
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
# 62 "parser.ml"
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
  286 (* ELIF *);
  287 (* ELSE *);
  288 (* END *);
  289 (* FOR *);
  290 (* FUNCTION *);
  291 (* IMPORT *);
  292 (* LIST *);
  293 (* MODEL *);
  294 (* RETURN *);
  295 (* RUN *);
  296 (* SUBMODEL *);
  297 (* WHILE *);
  298 (* IF *);
  299 (* IN *);
  301 (* PRINT *);
  302 (* ENDOFPROGRAM *);
    0 (* EOF *);
    0|]

let yytransl_block = [|
  300 (* TYPE *);
  303 (* INTEGERLIT *);
  304 (* FLOATLIT *);
  305 (* CHARLIT *);
  306 (* BOOLLIT *);
  307 (* STRINGLIT *);
  308 (* ID *);
  309 (* PRESET *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\003\000\003\000\003\000\004\000\006\000\007\000\
\007\000\009\000\009\000\008\000\008\000\005\000\010\000\010\000\
\010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
\010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
\010\000\011\000\011\000\012\000\012\000\000\000"

let yylen = "\002\000\
\004\000\002\000\000\000\002\000\002\000\001\000\009\000\000\000\
\001\000\003\000\005\000\000\000\002\000\005\000\001\000\001\000\
\001\000\001\000\001\000\001\000\003\000\003\000\003\000\003\000\
\003\000\003\000\003\000\003\000\003\000\003\000\003\000\004\000\
\003\000\000\000\001\000\001\000\003\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\038\000\003\000\002\000\000\000\000\000\
\000\000\000\000\004\000\005\000\006\000\000\000\000\000\001\000\
\000\000\000\000\015\000\016\000\017\000\018\000\019\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\033\000\000\000\000\000\
\000\000\000\000\014\000\000\000\000\000\023\000\024\000\000\000\
\000\000\000\000\000\000\000\000\000\000\010\000\000\000\000\000\
\032\000\000\000\012\000\000\000\000\000\000\000\011\000\007\000\
\013\000"

let yydgoto = "\002\000\
\004\000\005\000\007\000\011\000\012\000\013\000\027\000\070\000\
\028\000\025\000\048\000\049\000"

let yysindex = "\002\000\
\209\254\000\000\238\254\000\000\000\000\000\000\009\255\246\254\
\060\255\044\000\000\000\000\000\000\000\069\255\255\254\000\000\
\024\255\255\254\000\000\000\000\000\000\000\000\000\000\001\255\
\016\255\076\255\083\255\078\255\058\255\255\254\255\254\082\255\
\255\254\255\254\255\254\255\254\255\254\255\254\255\254\255\254\
\255\254\255\254\047\255\091\255\048\255\000\000\176\255\101\255\
\094\255\176\255\000\000\053\255\053\255\000\000\000\000\164\255\
\164\255\251\254\251\254\251\254\251\254\000\000\062\255\106\255\
\000\000\255\254\000\000\071\255\176\255\225\254\000\000\000\000\
\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\114\255\000\000\000\000\000\000\000\000\000\000\000\000\043\255\
\000\000\000\000\000\000\115\255\000\000\116\255\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\003\255\000\000\
\117\255\005\255\000\000\073\255\088\255\000\000\000\000\163\255\
\174\255\103\255\118\255\133\255\148\255\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\031\255\000\000\000\000\000\000\
\000\000"

let yygindex = "\000\000\
\000\000\000\000\000\000\000\000\051\000\000\000\000\000\000\000\
\000\000\242\255\000\000\000\000"

let yytablesize = 200
let yytable = "\018\000\
\072\000\030\000\001\000\029\000\036\000\003\000\031\000\033\000\
\034\000\035\000\036\000\031\000\036\000\009\000\031\000\047\000\
\050\000\032\000\052\000\053\000\054\000\055\000\056\000\057\000\
\058\000\059\000\060\000\061\000\033\000\034\000\035\000\036\000\
\037\000\006\000\037\000\038\000\039\000\040\000\041\000\042\000\
\037\000\014\000\008\000\016\000\020\000\019\000\020\000\021\000\
\022\000\023\000\024\000\069\000\020\000\009\000\010\000\020\000\
\020\000\020\000\020\000\046\000\015\000\020\000\020\000\020\000\
\020\000\020\000\020\000\035\000\036\000\017\000\033\000\034\000\
\035\000\036\000\021\000\026\000\037\000\038\000\039\000\040\000\
\041\000\042\000\021\000\043\000\044\000\021\000\021\000\045\000\
\051\000\022\000\062\000\021\000\021\000\021\000\021\000\021\000\
\021\000\022\000\063\000\064\000\022\000\022\000\065\000\066\000\
\027\000\067\000\022\000\022\000\022\000\022\000\022\000\022\000\
\027\000\068\000\071\000\008\000\009\000\034\000\035\000\028\000\
\073\000\027\000\027\000\027\000\027\000\027\000\027\000\028\000\
\000\000\000\000\000\000\000\000\000\000\000\000\029\000\000\000\
\028\000\028\000\028\000\028\000\028\000\028\000\029\000\000\000\
\000\000\000\000\000\000\000\000\000\000\030\000\000\000\029\000\
\029\000\029\000\029\000\029\000\029\000\030\000\000\000\000\000\
\000\000\000\000\000\000\000\000\025\000\000\000\030\000\030\000\
\030\000\030\000\030\000\030\000\025\000\000\000\000\000\026\000\
\033\000\034\000\035\000\036\000\000\000\025\000\025\000\026\000\
\039\000\040\000\041\000\042\000\033\000\034\000\035\000\036\000\
\026\000\026\000\037\000\038\000\039\000\040\000\041\000\042\000"

let yycheck = "\001\001\
\032\001\001\001\001\000\018\000\002\001\053\001\002\001\013\001\
\014\001\015\001\016\001\011\001\010\001\045\001\010\001\030\000\
\031\000\002\001\033\000\034\000\035\000\036\000\037\000\038\000\
\039\000\040\000\041\000\042\000\013\001\014\001\015\001\016\001\
\002\001\052\001\019\001\020\001\021\001\022\001\023\001\024\001\
\010\001\052\001\034\001\000\000\002\001\047\001\048\001\049\001\
\050\001\051\001\052\001\066\000\010\001\045\001\046\001\013\001\
\014\001\015\001\016\001\002\001\001\001\019\001\020\001\021\001\
\022\001\023\001\024\001\015\001\016\001\001\001\013\001\014\001\
\015\001\016\001\002\001\052\001\019\001\020\001\021\001\022\001\
\023\001\024\001\010\001\008\001\002\001\013\001\014\001\010\001\
\007\001\002\001\044\001\019\001\020\001\021\001\022\001\023\001\
\024\001\010\001\008\001\052\001\013\001\014\001\002\001\010\001\
\002\001\044\001\019\001\020\001\021\001\022\001\023\001\024\001\
\010\001\008\001\044\001\002\001\002\001\002\001\002\001\002\001\
\070\000\019\001\020\001\021\001\022\001\023\001\024\001\010\001\
\255\255\255\255\255\255\255\255\255\255\255\255\002\001\255\255\
\019\001\020\001\021\001\022\001\023\001\024\001\010\001\255\255\
\255\255\255\255\255\255\255\255\255\255\002\001\255\255\019\001\
\020\001\021\001\022\001\023\001\024\001\010\001\255\255\255\255\
\255\255\255\255\255\255\255\255\002\001\255\255\019\001\020\001\
\021\001\022\001\023\001\024\001\010\001\255\255\255\255\002\001\
\013\001\014\001\015\001\016\001\255\255\019\001\020\001\010\001\
\021\001\022\001\023\001\024\001\013\001\014\001\015\001\016\001\
\019\001\020\001\019\001\020\001\021\001\022\001\023\001\024\001"

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
  ELIF\000\
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
# 31 "parser.mly"
                                ( _2 )
# 304 "parser.ml"
               : Ast.program))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 34 "parser.mly"
           ( Preset(_1, _2) )
# 312 "parser.ml"
               : 'preset))
; (fun __caml_parser_env ->
    Obj.repr(
# 37 "parser.mly"
                  ( [], [] )
# 318 "parser.ml"
               : 'bodies))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'bodies) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'decl) in
    Obj.repr(
# 38 "parser.mly"
                ( (_2 :: fst _1), snd _1 )
# 326 "parser.ml"
               : 'bodies))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'bodies) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 39 "parser.mly"
                ( fst _1, (_2 :: snd _1) )
# 334 "parser.ml"
               : 'bodies))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'fdecl) in
    Obj.repr(
# 42 "parser.mly"
       ( _1 )
# 341 "parser.ml"
               : 'decl))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 7 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 5 : 'paras_opt) in
    let _7 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _8 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 46 "parser.mly"
 ({
		fname = _2;
		paras = _4;
		body = List.rev _8
		})
# 355 "parser.ml"
               : 'fdecl))
; (fun __caml_parser_env ->
    Obj.repr(
# 53 "parser.mly"
                    ( [] )
# 361 "parser.ml"
               : 'paras_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'paras_list) in
    Obj.repr(
# 54 "parser.mly"
                  ( List.rev _1 )
# 368 "parser.ml"
               : 'paras_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 57 "parser.mly"
                                   ( [_1] )
# 376 "parser.ml"
               : 'paras_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 4 : 'paras_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 58 "parser.mly"
                                    ( _3 :: _1 )
# 385 "parser.ml"
               : 'paras_list))
; (fun __caml_parser_env ->
    Obj.repr(
# 61 "parser.mly"
                     ( [] )
# 391 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 62 "parser.mly"
                    ( _2 :: _1 )
# 399 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    Obj.repr(
# 65 "parser.mly"
                               ( Print(_3) )
# 406 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 69 "parser.mly"
                      ( Int(_1) )
# 413 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : float) in
    Obj.repr(
# 70 "parser.mly"
                    ( Float(_1) )
# 420 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : char) in
    Obj.repr(
# 71 "parser.mly"
                    ( Char(_1) )
# 427 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : bool) in
    Obj.repr(
# 72 "parser.mly"
                    ( Bool(_1) )
# 434 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 73 "parser.mly"
                    ( String(_1) )
# 441 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 74 "parser.mly"
                      ( Id(_1) )
# 448 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 75 "parser.mly"
                      ( Binop(_1, Add,   _3) )
# 456 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 76 "parser.mly"
                    ( Binop(_1, Sub,   _3) )
# 464 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 77 "parser.mly"
                      ( Binop(_1, Mult,  _3) )
# 472 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 78 "parser.mly"
                      ( Binop(_1, Div,   _3) )
# 480 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 79 "parser.mly"
                      ( Binop(_1, Equal, _3) )
# 488 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 80 "parser.mly"
                      ( Binop(_1, Neq,   _3) )
# 496 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 81 "parser.mly"
                      ( Binop(_1, Less,  _3) )
# 504 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 82 "parser.mly"
                      ( Binop(_1, Leq,   _3) )
# 512 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 83 "parser.mly"
                      ( Binop(_1, Greater,  _3) )
# 520 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 84 "parser.mly"
                      ( Binop(_1, Geq,   _3) )
# 528 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 85 "parser.mly"
                      ( Assign(_1, _3) )
# 536 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'actuals_opt) in
    Obj.repr(
# 86 "parser.mly"
                                  ( Call(_1, _3) )
# 544 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 87 "parser.mly"
                        ( _2 )
# 551 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 90 "parser.mly"
                  ( [] )
# 557 "parser.ml"
               : 'actuals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'actuals_list) in
    Obj.repr(
# 91 "parser.mly"
                   ( List.rev _1 )
# 564 "parser.ml"
               : 'actuals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 94 "parser.mly"
                            ( [_1] )
# 571 "parser.ml"
               : 'actuals_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'actuals_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 95 "parser.mly"
                             ( _3 :: _1 )
# 579 "parser.ml"
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
