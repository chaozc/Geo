(*
NOTE FROM ZIYI TO ZICHEN & QI 11/07/2015:
ADD:
%token <int> INTEGER
%token <float> FLOAT
%token <char> CHAR
%token <bool> BOOL
%token <string> STRING
%token <string> ID
TO parser.mly
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
| '=' { ASSIGN }

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
| "bool" { BOOL }  		| "break" { BREAK }
| "char" { CHAR }  		| "const" { CONST }
| "dot"  { DOT }   		| "elif" { ELIF }
| "else" { ELSE } 		| "end" { END }
| "float" { FLOAT }		| "for" { FOR }
| "function" {FUNCTION}	| "if" { IF }
| "import" { IMPORT } 	| "in" { IN }
| "int" { INT }  		| "list" { LIST }
| "model" {MODEL}		| "return" { RETURN }
| "run" {RUN}			| "string" { STRING }
| "submodel" {SUBMODEL}	| "void" { VOID }
| "while" { WHILE }

| eof { EOF } (* End of file *)

(* Integers *)
| ['0' - '9']+ as lxm { INTEGER(int_of_string lxm) } 

(* Float *)
| ['-' '+']?['0'-'9']*'.'['0'-'9']+ ('e'['+' '-']?['0'-'9']+)? as flo {FLOAT(float_of_string flo)}
| ['-' '+']?['0'-'9']+'.'['0'-'9']* ('e'['+' '-']?['0'-'9']+)? as flo {FLOAT(float_of_string flo)}
| ['-' '+']?['0'-'9']+ ('e'['+' '-']?['0'-'9']+) as flo {FLOAT(float_of_string flo)}

(* Char *)
| '''(['\000' - '\127'] as chr)''' {CHAR(chr)}

(* Bool *)
| ["true" "false"] as bl {BOOL(bool_of_string bl)}

(* String *)
| '"'(['\000' - '\127']* as str)'"' {STRING(str)}

(* ID *)
| ['a' - 'z' 'A' - 'Z']['a' - 'z' 'A' - 'Z' '0' - '9' '_']* as lxm { ID(lxm) }
| _ as char { raise (Failure("illegal character " ^ Char.escaped char)) }

and comment = parse
	"*/" { token lexbuf } (* Endofcomment*)
| _ { comment lexbuf } (* Eat everything else *)

and comment2 = parse
	'\n' {token lexbuf}
| _ {comment2 lexbuf}