open Ast
(*

module StringMap = Map.Make(String)

(* Symbol table: Information about all the names in scope *)
type env = {
    function_index : int StringMap.t; (* Index for each function *)
    global_index   : int StringMap.t; (* "Address" for global variables *)
    local_index    : int StringMap.t; (* FP offset for args, locals *)
  }

(* val enum : int -> 'a list -> (int * 'a) list *)
let rec enum stride n = function
    [] -> []
  | hd::tl -> (n, hd) :: enum stride (n+stride) tl

(* val string_map_pairs StringMap 'a -> (int * 'a) list -> StringMap 'a *)
let string_map_pairs map pairs =
  List.fold_left (fun m (i, n) -> StringMap.add n i m) map pairs
*)
let prestring = ["import Tkinter as tk\n" ; 
				 "root = tk.Tk()\n";
				 "root.title(\"Geo\")\n";
				 "msg = tk.Listbox(root, width=50, height=6)\n";
				 "msg.grid(row=0, column=0)\n"]

let finalstring = ["root.mainloop()"]

let translate (declarations, statements) =
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
	in
	let string_of_stmt = function
		Print(expr) -> "msg.insert(tk.END," ^ (string_of_expr expr) ^ ")"
	in
	let rec translate_stmts  = function
		  [] -> ""
		| hd::tl -> (string_of_stmt hd) ^ "\n" ^ (translate_stmts tl)
	in
	let tra = translate_stmts (List.rev statements) in 
	(String.concat "" prestring) ^ tra ^ (String.concat "" finalstring)



