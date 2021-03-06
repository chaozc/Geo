%{ open Ast %}
%token LPAREN RPAREN LBRACE RBRACE LSQUAR RSQUAR SEMI COLON GET COMMA ASSIGN DOLL
%token PLUS MINUS TIMES DIVIDE PERCENT EXP
%token EQ NEQ LT LEQ GT GEQ NOT	AND OR
%token BREAK ELSE END FOR FUNCTION RETURN RUN WHILE IF IN LINE CIRCLE RUNSET POLYGON
%token <string> TYPE
%token PRINT PRINTT
%token ENDOFPROGRAM
%token EOF

%token <int> INTEGERLIT
%token <float> FLOATLIT
%token <char> CHARLIT
%token <bool> BOOLLIT
%token <string> STRINGLIT
%token <string> ID
%token <string> PRESET

%right ASSIGN
%left AND OR
%left EQ NEQ
%right NOT
%left LT GT LEQ GEQ
%left PLUS MINUS
%left TIMES DIVIDE PERCENT
%left EXP
%left GET

%start program
%type <Ast.program> program
%%

program:
	preset bodies ENDOFPROGRAM EOF { $2 }

preset:
	PRESET ID { Preset($1, $2) }

bodies:
   	/* nothing */ { [], [] }
 	| bodies decl { ($2 :: fst $1), snd $1 }
 	| bodies stmt { fst $1, ($2 :: snd $1) }

decl:
	fdecl { $1 }

fdecl:
	FUNCTION ID LPAREN paras_opt RPAREN COLON TYPE COLON stmt_list END 
	{{
    tp = $7;
		fname = $2;
		paras = $4;
		body = List.rev $9
    
	}}

paras_opt:
      /* nothing */ { [] }
  	| paras_list   { List.rev $1 }

paras_list:
   	  ID COLON TYPE              	 { [($1, $3)] }
  	| paras_list COMMA ID COLON TYPE { ($3, $5) :: $1 }

stmt_list:
      /* nothing */  { [] }
  	| stmt_list stmt { $2 :: $1 }

stmt:
      expr SEMI { Expr($1) }
    | RETURN expr SEMI { Return($2) }
    | IF LPAREN expr RPAREN COLON stmt_list END
      { If($3, $6, []) }
    | IF LPAREN expr RPAREN COLON stmt_list ELSE COLON stmt_list END 
      { If($3, $6, $9) }
    | WHILE LPAREN expr RPAREN COLON stmt_list END { While($3, $6) }
    | PRINT LPAREN expr RPAREN SEMI { Print($3) }
    | PRINTT LPAREN expr RPAREN SEMI { PrintT($3) }
    | FOR expr IN expr COLON stmt_list END { For($2, $4, $6) }
    | RUN expr COLON stmt_list END { Run($2, $4) }
    | ID ASSIGN expr SEMI  { Assign($1, $3, Noexpr) }
    | ID DOLL LSQUAR expr RSQUAR ASSIGN expr SEMI { Assign($1, $7, $4) }
    | BREAK SEMI{ Break }

expr_opt:
    /* nothing */ { Noexpr }
    | expr { $1 }

digit:
      INTEGERLIT       { Int($1) }
    | FLOATLIT         { Float($1) }

expr:
      INTEGERLIT       { Int($1) }
  	| FLOATLIT         { Float($1) }
  	| CHARLIT          { Char($1) }
  	| BOOLLIT          { Bool($1) }
  	| STRINGLIT        { String($1) }
  	| ID               { Id($1) }
    | MINUS expr       { Minus($2)}
  	| expr PLUS   expr { Binop($1, Add,   $3) }
	  | expr MINUS  expr { Binop($1, Sub,   $3) }
  	| expr TIMES  expr { Binop($1, Mult,  $3) }
  	| expr DIVIDE expr { Binop($1, Div,   $3) }
  	| expr EQ     expr { Binop($1, Equal, $3) }
  	| expr NEQ    expr { Binop($1, Neq,   $3) }
  	| expr LT     expr { Binop($1, Less,  $3) }
  	| expr LEQ    expr { Binop($1, Leq,   $3) }
  	| expr GT     expr { Binop($1, Greater,  $3) }
  	| expr GEQ    expr { Binop($1, Geq,   $3) }
    | expr AND    expr { Binop($1, And,   $3) }
    | expr OR     expr { Binop($1, Or,   $3) }
    | expr PERCENT expr { Binop($1, Mod,   $3)}
    | expr EXP    expr { Binop($1, Exp,   $3) }
    | NOT expr         { Not($2) }
  	| ID LPAREN actuals_opt RPAREN { Call($1, $3) }
  	| LPAREN expr RPAREN { $2 }
    | LSQUAR expr COMMA expr RSQUAR { Dot($2, $4) }
    | expr GET expr { Get_Call($1, $3) }
    | LINE LPAREN actuals_opt RPAREN { Line($3) }
    | POLYGON LPAREN actuals_opt RPAREN { Polygon($3) }
    | CIRCLE LPAREN actuals_opt RPAREN { Circle($3) }
    | RUNSET LPAREN actuals_opt RPAREN { Runset($3) }
    | LBRACE actuals_opt RBRACE { List($2) }
    | ID DOLL LSQUAR expr RSQUAR { ListEle($1, $4) }



actuals_opt:
    /* nothing */ { [] }
  	| actuals_list  { List.rev $1 }

actuals_list:
    expr                    { [$1] }
  	| actuals_list COMMA expr { $3 :: $1 }
