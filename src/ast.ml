type op = Add | Sub | Mult | Div | Equal | Neq | Less | Leq | Greater | Geq | And | Or 

type preset =
	 Preset of string * string 


type expr =
	  Noexpr
	| Int of int
	| Float of float
	| Bool of  bool
	| String of string
	| Char of char
	| Id of string
	| Binop of expr * op * expr
	| Assign of string * expr
  	| Call of string * expr list
  	| Dot of expr * expr
  	| Get_Call of expr * expr
  	| Line of expr list
  	| Circle of expr list
  	| List of expr list
  	| Not of expr


type stmt = 
	| Expr of expr
	| Return of expr
	| If of expr * stmt list * stmt list
	| For of expr * expr * stmt list
	| While of expr * stmt list
	| Print of expr
	| PrintT of expr

type fdecl = {
    fname : string;
    paras : string list;
    body : stmt list;
	}

type program = fdecl list * stmt list

