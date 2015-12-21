type op = Add | Sub | Mult | Div | Equal | Neq | Less | Leq | Greater | Geq | And | Or | Mod | Exp

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
  	| Call of string * expr list
  	| Dot of expr * expr
  	| Get_Call of expr * expr
  	| Line of expr list
  	| Circle of expr list
  	| List of expr list
  	| Not of expr
  	| Minus of expr
  	| ListEle of string * expr
  	| Runset of expr list


type stmt = 
	| Expr of expr
	| Return of expr
	| If of expr * stmt list * stmt list
	| For of expr * expr * stmt list
	| While of expr * stmt list
	| Print of expr
	| PrintT of expr
	| Run of expr * stmt list
	| Assign of string * expr * expr


type fdecl = {
    fname : string;
    paras : (string * string) list;
    body : stmt list;
    tp : string;

	}

type program = fdecl list * stmt list

