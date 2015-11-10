%{ open Ast %}
%token LPAREN RPAREN LBRACE RBRACE LSQUAR RSQUAR SEMI COLON GET COMMA ASSIGN AT
%token PLUS MINUS TIMES DIVIDE PERCENT EXP
%token EQ NEQ LT LEQ GT GEQ NOT	AND OR
%token BREAK CONST ELIF ELSE END FOR FUNCTION IMPORT LIST MODEL RETURN RUN SUBMODEL WHILE
%token <string> TYPE
%token PRINT
%token ENDOFPROGRAM
%token EOF
%token <int> INTERGERLIT
%token <float> FLOATLIT
%token <char> CHARLIT
%token <bool> BOOLLIT
%token <string> STRINGLIT
%token <string> ID
%token <string> PRESET

%start program
%type <Ast.program> program
%%

program:
	PRESET bodies ENDOFPROGRAM EOF { $2 }

bodies:
   	/* nothing */ { [], [] }
 	| bodies decl { ($2 :: fst $1), snd $1 }
 	| bodies stmt { fst $1, ($2 :: snd $1) }

decl:
	fdecl { $1 }

fdecl:
	FUNCTION ID LPAREN paras_opt RPAREN COLON TYPE stmt_list END
	{{
		fname = $2;
		paras = $4;
		body = List.rev $8;
		}}

stmt:
	PRINT LPAREN expr RPAREN SEMI { Print($3) }


expr:
      INTERGERLIT      { INTERGERLIT($1) }
	| FLOATLIT         { FLOATLIT($1) }
	| CHARLIT          { CHARLIT($1) }
	| BOOLLIT          { BOOLLIT($1) }
	| STRINGLIT         { STRINGLIT($1) }
  	| ID               { Id($1) }
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
  	| ID ASSIGN expr   { Assign($1, $3) }
  	| ID LPAREN actuals_opt RPAREN { Call($1, $3) }
  	| LPAREN expr RPAREN { $2 }

actuals_opt:
    /* nothing */ { [] }
  	| actuals_list  { List.rev $1 }

actuals_list:
    expr                    { [$1] }
  	| actuals_list COMMA expr { $3 :: $1 }
