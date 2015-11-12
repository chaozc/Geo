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

val program :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Ast.program