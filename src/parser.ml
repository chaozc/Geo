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
  | LINE
  | CIRCLE
  | TYPE of (string)
  | PRINT
  | PRINTT
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
# 64 "parser.ml"
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
  299 (* LINE *);
  300 (* CIRCLE *);
  302 (* PRINT *);
  303 (* PRINTT *);
  304 (* ENDOFPROGRAM *);
    0 (* EOF *);
    0|]

let yytransl_block = [|
  301 (* TYPE *);
  305 (* INTEGERLIT *);
  306 (* FLOATLIT *);
  307 (* CHARLIT *);
  308 (* BOOLLIT *);
  309 (* STRINGLIT *);
  310 (* ID *);
  311 (* PRESET *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\003\000\003\000\003\000\004\000\006\000\007\000\
\007\000\009\000\009\000\008\000\008\000\005\000\005\000\005\000\
\005\000\005\000\005\000\005\000\005\000\011\000\011\000\012\000\
\012\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
\010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
\010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
\013\000\013\000\014\000\014\000\000\000"

let yylen = "\002\000\
\004\000\002\000\000\000\002\000\002\000\001\000\010\000\000\000\
\001\000\003\000\005\000\000\000\002\000\002\000\003\000\007\000\
\010\000\007\000\005\000\005\000\007\000\000\000\001\000\001\000\
\001\000\001\000\001\000\001\000\001\000\001\000\001\000\003\000\
\003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
\003\000\003\000\004\000\003\000\005\000\003\000\004\000\004\000\
\000\000\001\000\001\000\003\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\053\000\003\000\002\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\026\000\027\000\028\000\029\000\030\000\
\000\000\004\000\005\000\006\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\001\000\000\000\000\000\014\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\044\000\
\000\000\000\000\000\000\015\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\046\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\047\000\000\000\048\000\000\000\000\000\043\000\045\000\012\000\
\000\000\000\000\000\000\012\000\012\000\000\000\019\000\020\000\
\000\000\010\000\000\000\000\000\000\000\000\000\021\000\013\000\
\000\000\000\000\018\000\000\000\016\000\012\000\011\000\012\000\
\000\000\000\000\007\000\017\000"

let yydgoto = "\002\000\
\004\000\005\000\007\000\026\000\112\000\028\000\085\000\105\000\
\086\000\029\000\000\000\000\000\064\000\065\000"

let yysindex = "\006\000\
\219\254\000\000\221\254\000\000\000\000\000\000\019\255\180\255\
\180\255\180\255\223\254\180\255\021\255\022\255\032\255\035\255\
\052\255\054\255\057\000\000\000\000\000\000\000\000\000\000\000\
\004\255\000\000\000\000\000\000\035\001\183\000\086\001\167\000\
\060\255\053\001\180\255\180\255\180\255\180\255\180\255\180\255\
\000\000\180\255\180\255\000\000\180\255\180\255\180\255\180\255\
\180\255\180\255\180\255\180\255\180\255\180\255\180\255\000\000\
\180\255\180\255\010\255\000\000\206\000\222\000\102\001\073\255\
\066\255\075\255\238\000\254\000\084\255\102\001\000\000\104\255\
\104\255\079\255\079\255\118\001\118\001\065\255\065\255\065\255\
\065\255\017\001\070\001\081\255\090\255\085\255\093\255\100\255\
\000\000\180\255\000\000\091\255\102\255\000\000\000\000\000\000\
\067\255\106\255\056\255\000\000\000\000\102\001\000\000\000\000\
\086\255\000\000\071\255\113\255\110\255\053\255\000\000\000\000\
\114\255\080\255\000\000\116\255\000\000\000\000\000\000\000\000\
\143\255\167\255\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\233\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\126\255\126\255\000\000\000\000\
\000\000\126\255\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\129\255\000\000\000\000\000\000\001\255\000\000\
\132\255\000\000\000\000\000\000\000\000\163\255\000\000\049\000\
\073\000\001\000\025\000\006\255\159\000\097\000\104\000\128\000\
\135\000\000\000\000\000\000\000\000\000\141\255\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\007\255\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\000\000\000\000\000\000\138\000\000\000\000\000\220\000\
\000\000\248\255\000\000\000\000\224\255\000\000"

let yytablesize = 654
let yytable = "\030\000\
\031\000\032\000\051\000\034\000\042\000\066\000\001\000\036\000\
\052\000\069\000\051\000\036\000\036\000\036\000\043\000\036\000\
\052\000\003\000\006\000\008\000\033\000\035\000\036\000\009\000\
\036\000\036\000\061\000\062\000\063\000\063\000\067\000\068\000\
\037\000\063\000\070\000\038\000\071\000\072\000\073\000\074\000\
\075\000\076\000\077\000\078\000\079\000\080\000\081\000\036\000\
\082\000\083\000\010\000\011\000\039\000\008\000\040\000\012\000\
\041\000\009\000\013\000\014\000\059\000\015\000\016\000\084\000\
\017\000\018\000\019\000\020\000\021\000\022\000\023\000\024\000\
\025\000\045\000\089\000\090\000\091\000\046\000\047\000\048\000\
\049\000\102\000\116\000\117\000\010\000\094\000\008\000\045\000\
\097\000\012\000\009\000\098\000\013\000\014\000\099\000\015\000\
\016\000\103\000\017\000\018\000\100\000\020\000\021\000\022\000\
\023\000\024\000\025\000\101\000\104\000\108\000\008\000\106\000\
\045\000\107\000\009\000\113\000\111\000\010\000\048\000\049\000\
\114\000\118\000\012\000\120\000\119\000\013\000\014\000\049\000\
\015\000\016\000\008\000\017\000\018\000\050\000\020\000\021\000\
\022\000\023\000\024\000\025\000\115\000\010\000\009\000\008\000\
\027\000\000\000\012\000\009\000\000\000\013\000\014\000\000\000\
\015\000\016\000\000\000\017\000\018\000\000\000\020\000\021\000\
\022\000\023\000\024\000\025\000\042\000\000\000\000\000\008\000\
\042\000\042\000\042\000\009\000\042\000\123\000\010\000\000\000\
\000\000\000\000\000\000\012\000\008\000\000\000\013\000\014\000\
\009\000\015\000\016\000\000\000\017\000\018\000\000\000\020\000\
\021\000\022\000\023\000\024\000\025\000\124\000\010\000\000\000\
\000\000\000\000\000\000\012\000\042\000\000\000\013\000\014\000\
\000\000\015\000\016\000\000\000\017\000\018\000\000\000\020\000\
\021\000\022\000\023\000\024\000\025\000\000\000\015\000\016\000\
\000\000\000\000\000\000\000\000\020\000\021\000\022\000\023\000\
\024\000\025\000\031\000\000\000\000\000\000\000\031\000\031\000\
\031\000\031\000\031\000\000\000\000\000\031\000\031\000\031\000\
\031\000\000\000\000\000\031\000\031\000\031\000\031\000\031\000\
\031\000\000\000\034\000\000\000\000\000\000\000\034\000\034\000\
\034\000\000\000\034\000\000\000\000\000\034\000\034\000\034\000\
\034\000\000\000\031\000\034\000\034\000\034\000\034\000\034\000\
\034\000\000\000\035\000\000\000\000\000\000\000\035\000\035\000\
\035\000\000\000\035\000\000\000\000\000\035\000\035\000\035\000\
\035\000\000\000\034\000\035\000\035\000\035\000\035\000\035\000\
\035\000\000\000\032\000\000\000\000\000\000\000\032\000\032\000\
\032\000\000\000\032\000\000\000\000\000\032\000\032\000\109\000\
\110\000\000\000\035\000\032\000\032\000\032\000\032\000\032\000\
\032\000\000\000\033\000\000\000\000\000\000\000\033\000\033\000\
\033\000\121\000\033\000\122\000\000\000\033\000\033\000\000\000\
\000\000\000\000\032\000\033\000\033\000\033\000\033\000\033\000\
\033\000\000\000\038\000\000\000\000\000\000\000\038\000\038\000\
\038\000\039\000\038\000\000\000\000\000\039\000\039\000\039\000\
\000\000\039\000\033\000\038\000\038\000\038\000\038\000\038\000\
\038\000\000\000\039\000\039\000\039\000\039\000\039\000\039\000\
\000\000\040\000\000\000\000\000\000\000\040\000\040\000\040\000\
\041\000\040\000\038\000\000\000\041\000\041\000\041\000\000\000\
\041\000\039\000\040\000\040\000\040\000\040\000\040\000\040\000\
\000\000\041\000\041\000\041\000\041\000\041\000\041\000\000\000\
\037\000\000\000\000\000\000\000\037\000\037\000\037\000\000\000\
\037\000\040\000\000\000\000\000\000\000\000\000\000\000\045\000\
\041\000\037\000\037\000\046\000\047\000\048\000\049\000\000\000\
\056\000\050\000\051\000\052\000\053\000\054\000\055\000\045\000\
\000\000\000\000\000\000\046\000\047\000\048\000\049\000\000\000\
\037\000\050\000\051\000\052\000\053\000\054\000\055\000\087\000\
\058\000\000\000\000\000\000\000\000\000\000\000\045\000\000\000\
\000\000\000\000\046\000\047\000\048\000\049\000\000\000\088\000\
\050\000\051\000\052\000\053\000\054\000\055\000\045\000\000\000\
\000\000\000\000\046\000\047\000\048\000\049\000\000\000\092\000\
\050\000\051\000\052\000\053\000\054\000\055\000\045\000\000\000\
\000\000\000\000\046\000\047\000\048\000\049\000\000\000\093\000\
\050\000\051\000\052\000\053\000\054\000\055\000\045\000\000\000\
\000\000\000\000\046\000\047\000\048\000\049\000\000\000\000\000\
\050\000\051\000\052\000\053\000\054\000\055\000\095\000\000\000\
\000\000\045\000\000\000\000\000\000\000\046\000\047\000\048\000\
\049\000\000\000\000\000\050\000\051\000\052\000\053\000\054\000\
\055\000\044\000\000\000\045\000\000\000\000\000\000\000\046\000\
\047\000\048\000\049\000\000\000\000\000\050\000\051\000\052\000\
\053\000\054\000\055\000\060\000\000\000\045\000\000\000\000\000\
\000\000\046\000\047\000\048\000\049\000\000\000\000\000\050\000\
\051\000\052\000\053\000\054\000\055\000\096\000\045\000\000\000\
\000\000\000\000\046\000\047\000\048\000\049\000\000\000\000\000\
\050\000\051\000\052\000\053\000\054\000\055\000\045\000\057\000\
\000\000\000\000\046\000\047\000\048\000\049\000\000\000\000\000\
\050\000\051\000\052\000\053\000\054\000\055\000\045\000\000\000\
\000\000\000\000\046\000\047\000\048\000\049\000\000\000\000\000\
\050\000\051\000\052\000\053\000\054\000\055\000\045\000\000\000\
\000\000\000\000\046\000\047\000\048\000\049\000\000\000\000\000\
\000\000\000\000\052\000\053\000\054\000\055\000"

let yycheck = "\008\000\
\009\000\010\000\002\001\012\000\001\001\038\000\001\000\002\001\
\002\001\042\000\010\001\006\001\007\001\008\001\011\001\010\001\
\010\001\055\001\054\001\001\001\054\001\001\001\001\001\005\001\
\019\001\020\001\035\000\036\000\037\000\038\000\039\000\040\000\
\001\001\042\000\043\000\001\001\045\000\046\000\047\000\048\000\
\049\000\050\000\051\000\052\000\053\000\054\000\055\000\042\001\
\057\000\058\000\032\001\033\001\001\001\001\001\001\001\037\001\
\000\000\005\001\040\001\041\001\001\001\043\001\044\001\054\001\
\046\001\047\001\048\001\049\001\050\001\051\001\052\001\053\001\
\054\001\009\001\002\001\010\001\002\001\013\001\014\001\015\001\
\016\001\090\000\030\001\031\001\032\001\002\001\001\001\009\001\
\008\001\037\001\005\001\002\001\040\001\041\001\010\001\043\001\
\044\001\007\001\046\001\047\001\008\001\049\001\050\001\051\001\
\052\001\053\001\054\001\008\001\007\001\054\001\001\001\045\001\
\009\001\008\001\005\001\045\001\031\001\032\001\015\001\016\001\
\008\001\008\001\037\001\008\001\045\001\040\001\041\001\002\001\
\043\001\044\001\002\001\046\001\047\001\002\001\049\001\050\001\
\051\001\052\001\053\001\054\001\031\001\032\001\002\001\001\001\
\007\000\255\255\037\001\005\001\255\255\040\001\041\001\255\255\
\043\001\044\001\255\255\046\001\047\001\255\255\049\001\050\001\
\051\001\052\001\053\001\054\001\002\001\255\255\255\255\001\001\
\006\001\007\001\008\001\005\001\010\001\031\001\032\001\255\255\
\255\255\255\255\255\255\037\001\001\001\255\255\040\001\041\001\
\005\001\043\001\044\001\255\255\046\001\047\001\255\255\049\001\
\050\001\051\001\052\001\053\001\054\001\031\001\032\001\255\255\
\255\255\255\255\255\255\037\001\042\001\255\255\040\001\041\001\
\255\255\043\001\044\001\255\255\046\001\047\001\255\255\049\001\
\050\001\051\001\052\001\053\001\054\001\255\255\043\001\044\001\
\255\255\255\255\255\255\255\255\049\001\050\001\051\001\052\001\
\053\001\054\001\002\001\255\255\255\255\255\255\006\001\007\001\
\008\001\009\001\010\001\255\255\255\255\013\001\014\001\015\001\
\016\001\255\255\255\255\019\001\020\001\021\001\022\001\023\001\
\024\001\255\255\002\001\255\255\255\255\255\255\006\001\007\001\
\008\001\255\255\010\001\255\255\255\255\013\001\014\001\015\001\
\016\001\255\255\042\001\019\001\020\001\021\001\022\001\023\001\
\024\001\255\255\002\001\255\255\255\255\255\255\006\001\007\001\
\008\001\255\255\010\001\255\255\255\255\013\001\014\001\015\001\
\016\001\255\255\042\001\019\001\020\001\021\001\022\001\023\001\
\024\001\255\255\002\001\255\255\255\255\255\255\006\001\007\001\
\008\001\255\255\010\001\255\255\255\255\013\001\014\001\100\000\
\101\000\255\255\042\001\019\001\020\001\021\001\022\001\023\001\
\024\001\255\255\002\001\255\255\255\255\255\255\006\001\007\001\
\008\001\118\000\010\001\120\000\255\255\013\001\014\001\255\255\
\255\255\255\255\042\001\019\001\020\001\021\001\022\001\023\001\
\024\001\255\255\002\001\255\255\255\255\255\255\006\001\007\001\
\008\001\002\001\010\001\255\255\255\255\006\001\007\001\008\001\
\255\255\010\001\042\001\019\001\020\001\021\001\022\001\023\001\
\024\001\255\255\019\001\020\001\021\001\022\001\023\001\024\001\
\255\255\002\001\255\255\255\255\255\255\006\001\007\001\008\001\
\002\001\010\001\042\001\255\255\006\001\007\001\008\001\255\255\
\010\001\042\001\019\001\020\001\021\001\022\001\023\001\024\001\
\255\255\019\001\020\001\021\001\022\001\023\001\024\001\255\255\
\002\001\255\255\255\255\255\255\006\001\007\001\008\001\255\255\
\010\001\042\001\255\255\255\255\255\255\255\255\255\255\009\001\
\042\001\019\001\020\001\013\001\014\001\015\001\016\001\255\255\
\002\001\019\001\020\001\021\001\022\001\023\001\024\001\009\001\
\255\255\255\255\255\255\013\001\014\001\015\001\016\001\255\255\
\042\001\019\001\020\001\021\001\022\001\023\001\024\001\002\001\
\042\001\255\255\255\255\255\255\255\255\255\255\009\001\255\255\
\255\255\255\255\013\001\014\001\015\001\016\001\255\255\002\001\
\019\001\020\001\021\001\022\001\023\001\024\001\009\001\255\255\
\255\255\255\255\013\001\014\001\015\001\016\001\255\255\002\001\
\019\001\020\001\021\001\022\001\023\001\024\001\009\001\255\255\
\255\255\255\255\013\001\014\001\015\001\016\001\255\255\002\001\
\019\001\020\001\021\001\022\001\023\001\024\001\009\001\255\255\
\255\255\255\255\013\001\014\001\015\001\016\001\255\255\255\255\
\019\001\020\001\021\001\022\001\023\001\024\001\006\001\255\255\
\255\255\009\001\255\255\255\255\255\255\013\001\014\001\015\001\
\016\001\255\255\255\255\019\001\020\001\021\001\022\001\023\001\
\024\001\007\001\255\255\009\001\255\255\255\255\255\255\013\001\
\014\001\015\001\016\001\255\255\255\255\019\001\020\001\021\001\
\022\001\023\001\024\001\007\001\255\255\009\001\255\255\255\255\
\255\255\013\001\014\001\015\001\016\001\255\255\255\255\019\001\
\020\001\021\001\022\001\023\001\024\001\008\001\009\001\255\255\
\255\255\255\255\013\001\014\001\015\001\016\001\255\255\255\255\
\019\001\020\001\021\001\022\001\023\001\024\001\009\001\010\001\
\255\255\255\255\013\001\014\001\015\001\016\001\255\255\255\255\
\019\001\020\001\021\001\022\001\023\001\024\001\009\001\255\255\
\255\255\255\255\013\001\014\001\015\001\016\001\255\255\255\255\
\019\001\020\001\021\001\022\001\023\001\024\001\009\001\255\255\
\255\255\255\255\013\001\014\001\015\001\016\001\255\255\255\255\
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
  LINE\000\
  CIRCLE\000\
  PRINT\000\
  PRINTT\000\
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
# 446 "parser.ml"
               : Ast.program))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 34 "parser.mly"
           ( Preset(_1, _2) )
# 454 "parser.ml"
               : 'preset))
; (fun __caml_parser_env ->
    Obj.repr(
# 37 "parser.mly"
                  ( [], [] )
# 460 "parser.ml"
               : 'bodies))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'bodies) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'decl) in
    Obj.repr(
# 38 "parser.mly"
                ( (_2 :: fst _1), snd _1 )
# 468 "parser.ml"
               : 'bodies))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'bodies) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 39 "parser.mly"
                ( fst _1, (_2 :: snd _1) )
# 476 "parser.ml"
               : 'bodies))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'fdecl) in
    Obj.repr(
# 42 "parser.mly"
       ( _1 )
# 483 "parser.ml"
               : 'decl))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 8 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 6 : 'paras_opt) in
    let _7 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _9 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 46 "parser.mly"
 ({
		fname = _2;
		paras = _4;
		body = List.rev _9
	})
# 497 "parser.ml"
               : 'fdecl))
; (fun __caml_parser_env ->
    Obj.repr(
# 53 "parser.mly"
                    ( [] )
# 503 "parser.ml"
               : 'paras_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'paras_list) in
    Obj.repr(
# 54 "parser.mly"
                  ( List.rev _1 )
# 510 "parser.ml"
               : 'paras_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 57 "parser.mly"
                                   ( [_1] )
# 518 "parser.ml"
               : 'paras_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 4 : 'paras_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 58 "parser.mly"
                                    ( _3 :: _1 )
# 527 "parser.ml"
               : 'paras_list))
; (fun __caml_parser_env ->
    Obj.repr(
# 61 "parser.mly"
                     ( [] )
# 533 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 62 "parser.mly"
                    ( _2 :: _1 )
# 541 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 65 "parser.mly"
                ( Expr(_1) )
# 548 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 66 "parser.mly"
                       ( Return(_2) )
# 555 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _6 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 68 "parser.mly"
      ( If(_3, _6, []) )
# 563 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 7 : 'expr) in
    let _6 = (Parsing.peek_val __caml_parser_env 4 : 'stmt_list) in
    let _9 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 70 "parser.mly"
      ( If(_3, _6, _9) )
# 572 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _6 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 71 "parser.mly"
                                                   ( While(_3, _6) )
# 580 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    Obj.repr(
# 72 "parser.mly"
                                    ( Print(_3) )
# 587 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    Obj.repr(
# 73 "parser.mly"
                                     ( PrintT(_3) )
# 594 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 5 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 3 : 'expr) in
    let _6 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 74 "parser.mly"
                                           ( For(_2, _4, _6) )
# 603 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    Obj.repr(
# 77 "parser.mly"
                  ( Noexpr )
# 609 "parser.ml"
               : 'expr_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 78 "parser.mly"
           ( _1 )
# 616 "parser.ml"
               : 'expr_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 81 "parser.mly"
                       ( Int(_1) )
# 623 "parser.ml"
               : 'digit))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : float) in
    Obj.repr(
# 82 "parser.mly"
                       ( Float(_1) )
# 630 "parser.ml"
               : 'digit))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 85 "parser.mly"
                       ( Int(_1) )
# 637 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : float) in
    Obj.repr(
# 86 "parser.mly"
                      ( Float(_1) )
# 644 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : char) in
    Obj.repr(
# 87 "parser.mly"
                      ( Char(_1) )
# 651 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : bool) in
    Obj.repr(
# 88 "parser.mly"
                      ( Bool(_1) )
# 658 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 89 "parser.mly"
                      ( String(_1) )
# 665 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 90 "parser.mly"
                      ( Id(_1) )
# 672 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 91 "parser.mly"
                      ( Binop(_1, Add,   _3) )
# 680 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 92 "parser.mly"
                      ( Binop(_1, Sub,   _3) )
# 688 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 93 "parser.mly"
                      ( Binop(_1, Mult,  _3) )
# 696 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 94 "parser.mly"
                      ( Binop(_1, Div,   _3) )
# 704 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 95 "parser.mly"
                      ( Binop(_1, Equal, _3) )
# 712 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 96 "parser.mly"
                      ( Binop(_1, Neq,   _3) )
# 720 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 97 "parser.mly"
                      ( Binop(_1, Less,  _3) )
# 728 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 98 "parser.mly"
                      ( Binop(_1, Leq,   _3) )
# 736 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 99 "parser.mly"
                      ( Binop(_1, Greater,  _3) )
# 744 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 100 "parser.mly"
                      ( Binop(_1, Geq,   _3) )
# 752 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 101 "parser.mly"
                      ( Assign(_1, _3) )
# 760 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'actuals_opt) in
    Obj.repr(
# 102 "parser.mly"
                                  ( Call(_1, _3) )
# 768 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 103 "parser.mly"
                        ( _2 )
# 775 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 104 "parser.mly"
                                    ( Dot(_2, _4) )
# 783 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 105 "parser.mly"
                    ( Get_Call(_1, _3) )
# 791 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'actuals_opt) in
    Obj.repr(
# 106 "parser.mly"
                                     ( Line(_3) )
# 798 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'actuals_opt) in
    Obj.repr(
# 107 "parser.mly"
                                       ( Circle(_3) )
# 805 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 112 "parser.mly"
                  ( [] )
# 811 "parser.ml"
               : 'actuals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'actuals_list) in
    Obj.repr(
# 113 "parser.mly"
                   ( List.rev _1 )
# 818 "parser.ml"
               : 'actuals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 116 "parser.mly"
                            ( [_1] )
# 825 "parser.ml"
               : 'actuals_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'actuals_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 117 "parser.mly"
                             ( _3 :: _1 )
# 833 "parser.ml"
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
