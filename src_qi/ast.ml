type op = Add | Sub | Mult | Div | Equal | Neq | Less | Leq | Greater | Geq

type preset =
	 Preset of string * string 
type expr =
	  Int of int
	| Float of float
	| Bool of  bool
	| String of string
	| Char of char
	| Id of string
	| Binop of expr * op * expr
	| Assign of string * expr
  	| Call of string * expr list
  	| Noexpr

type stmt = 
	  Print of expr

type fdecl = {
    fname : string;
    paras : string list;
    body : stmt list;
	}

type program = fdecl list * stmt list

