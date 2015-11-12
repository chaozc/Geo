%{ open Ast %}
%token LPAREN RPAREN LBRACE RBRACE LSQUAR RSQUAR SEMI COLON GET COMMA ASSIGN AT
%token PLUS MINUS TIMES DIVIDE PERCENT EXP
%token EQ NEQ LT LEQ GT GEQ NOT	AND OR
%token BREAK CONST ELIF ELSE END FOR FUNCTION IMPORT LIST MODEL RETURN RUN SUBMODEL WHILE IF IN
%token <string> TYPE
%token PRINT
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
%left EQ NEQ
%left LT GT LEQ GEQ
%left PLUS MINUS
%left TIMES DIVIDE

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
	FUNCTION ID LPAREN paras_opt RPAREN COLON TYPE stmt_list END 
	{{
		fname = $2;
		paras = $4;
		body = List.rev $8
		}}

paras_opt:
      /* nothing */ { [] }
  	| paras_list   { List.rev $1 }

paras_list:
   	  ID COLON TYPE              	 { [$1] }
  	| paras_list COMMA ID COLON TYPE { $3 :: $1 }

stmt_list:
      /* nothing */  { [] }
  	| stmt_list stmt { $2 :: $1 }

stmt:
	PRINT LPAREN expr RPAREN SEMI { Print($3) }


expr:
      INTEGERLIT      { Int($1) }
	| FLOATLIT         { Float($1) }
	| CHARLIT          { Char($1) }
	| BOOLLIT          { Bool($1) }
	| STRINGLIT        { String($1) }
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
