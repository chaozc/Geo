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
  | DOLL
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
  | ELSE
  | END
  | FOR
  | FUNCTION
  | RETURN
  | RUN
  | WHILE
  | IF
  | IN
  | LINE
  | CIRCLE
  | RUNSET
  | POLYGON
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

val program :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Ast.program
