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

let rec string_of_expr = function
    Int(l) -> string_of_int l
  | Float(l) -> string_of_float l
  | String(s) -> "\"" ^ s ^ "\""
  | Char(l) -> "\'" ^ (String.make 1 l) ^ "\'"
  | Bool(l) -> string_of_bool l
  | Id(s) -> s
  | Binop(e1, o, e2) ->
      string_of_expr e1 ^ " " ^
      (match o with
	Add -> "+" | Sub -> "-" | Mult -> "*" | Div -> "/"
      | Equal -> "==" | Neq -> "!="
      | Less -> "<" | Leq -> "<=" | Greater -> ">" | Geq -> ">=") ^ " " ^
      string_of_expr e2
  | Assign(v, e) -> v ^ " = " ^ string_of_expr e
  | Call(f, el) ->
      f ^ "(" ^ String.concat ", " (List.map string_of_expr el) ^ ")"
  | Noexpr -> ""