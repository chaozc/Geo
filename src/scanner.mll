(*
scanner.mll - updated 11:25AM 11/09/2015
NOTE FROM ZIYI TO ZICHEN & QI 11/09/2015: 
REMOVE '@' AS A TOKEN
ADD
| "@end" {ENDOFPROGRAM}
| '@'(['a' - 'z' 'A' - 'Z']+ as pre) {PRESET(pre)}
TO RECOGNIZE A PRESET
THEREFORE WE NEED TO ADD
%token <string> PRESET
%token ENDOFPROGRAM
in parser.mly
IN PARSER, THE PROCESSING SUGGESTION IS:
PRESET ID {Preset($1,$2)}
*)

{ open Parser } (* Get the token types *)
rule token = parse
(* Whitespace *)
[' ' '\t' '\r' '\n'] { token lexbuf } 

(* Comments *)
| "/*" 	{ comment lexbuf }  | "//"	{ comment2 lexbuf}

(* Basic tokens *)
| '(' { LPAREN } | ')' { RPAREN } (* Parentheses *)
| '{' { LBRACE } | '}' { RBRACE } (* Braces *)
| '[' { LSQUAR } | ']' { RSQUAR } (* Square brackets *)
| ';' { SEMI }   | ':' { COLON } 
| '.' {GET}		 | ',' { COMMA }
| '=' { ASSIGN } (* | '@' { AT } *)

(* Arithmetic operators *)
| '+' { PLUS }   | '-' { MINUS }
| '*' { TIMES }  | '/' { DIVIDE }
| '%' { PERCENT } | '^' {EXP}

(* Logic operators *)
| "==" { EQ }
| "!=" { NEQ }   | '<' { LT }
| "<=" { LEQ }   | '>' { GT }
| ">=" { GEQ }	 | '!' {NOT}	
| '&' {AND}		 | '|' {OR}

(* Keywords (totally 23) *) 		
| "else" { ELSE } 		| "end" { END }
| "for" { FOR }			| "elif" { ELIF }
| "function" {FUNCTION}	| "if" { IF }
| "import" { IMPORT } 	| "in" { IN }
| "list" { LIST }		| "break" { BREAK }
| "model" {MODEL}		| "return" { RETURN }
| "run" {RUN}			| "const" { CONST }
| "submodel" {SUBMODEL}	
| "while" { WHILE }

|("int"|"float"|"dot"|"void"|"bool"|"char"|"string") as tp {TYPE(tp)} (* Type *)

| "print" {PRINT}
| eof { EOF } (* End of file *)

(* Integers *)
| ['0' - '9']+ as lxm { INTEGERLIT(int_of_string lxm) } 

(* Float *)
| ['-' '+']?['0'-'9']*'.'['0'-'9']+ ('e'['+' '-']?['0'-'9']+)? as flo {FLOATLIT(float_of_string flo)}
| ['-' '+']?['0'-'9']+'.'['0'-'9']* ('e'['+' '-']?['0'-'9']+)? as flo {FLOATLIT(float_of_string flo)}
| ['-' '+']?['0'-'9']+ ('e'['+' '-']?['0'-'9']+) as flo {FLOATLIT(float_of_string flo)}

(* Char *)
| '''(['\000' - '\127'] as chr)''' {CHARLIT(chr)}

(* Bool *)
| ["true" "false"] as bl {BOOLLIT(bool_of_string bl)}

(* String *)
| '"'(['\000' - '\127']* as str)'"' {STRINGLIT(str)}

(* ID *)
| ['a' - 'z' 'A' - 'Z']['a' - 'z' 'A' - 'Z' '0' - '9' '_']* as lxm { ID(lxm) }
| _ as char { raise (Failure("illegal character " ^ Char.escaped char)) }

(* Preset *)
| "@end" {ENDOFPROGRAM}
| '@'(['a' - 'z' 'A' - 'Z']+ as pre) {PRESET(pre)}

and comment = parse
	"*/" { token lexbuf } (* Endofcomment*)
| _ { comment lexbuf } (* Eat everything else *)

and comment2 = parse
	'\n' {token lexbuf}
| _ {comment2 lexbuf}