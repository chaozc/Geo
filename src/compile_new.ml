open Ast

let prestring = ["import Tkinter as tk\n" ;
				 "from sympy.geometry import *\n"; 
				 "root = tk.Tk()\n";
				 "root.title(\"Geo\")\n";
				 "msg = tk.Listbox(root, width=50, height=10)\n";
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
	  | Dot(x, y) -> "Point(" ^ (string_of_expr x) ^ "," ^ (string_of_expr y) ^ ")" 
	  | Get_Call(x, y) -> (string_of_expr x) ^ "." ^ (string_of_expr y)
	  | Line(x) -> "Line(" ^ String.concat ", " (List.map string_of_expr x) ^ ")"
	  | Circle(x) ->  "Circle(" ^ String.concat ", " (List.map string_of_expr x) ^ ")"

	  
	in let addTab s = "\t" ^ s 
	in let rec string_of_stmt = function
		Expr(e) -> (string_of_expr e)  :: []
	  | PrintT(expr) -> ("print " ^ (string_of_expr expr)) :: []
	  | Print(expr) -> ("msg.insert(tk.END," ^ (string_of_expr expr) ^ ")") :: []
	  | While(e, s) -> ("while (" ^ (string_of_expr e) ^ "):") ::
	  	(List.map addTab (List.concat (List.rev (List.map string_of_stmt s))))
	  | For(e1, e2, s) -> ("for " ^ (string_of_expr e1) ^ " in " ^ (string_of_expr e2) ^ ":")
	  		:: (List.map addTab (List.concat (List.rev (List.map string_of_stmt s))))
	  | Return(e) -> ("return " ^ (string_of_expr e)) :: []
	  | If(e1, s1, s2) ->  
	  		match s2 with
	  		[] -> ("if " ^ (string_of_expr e1) ^ ":") :: 
	  			(List.map addTab (List.concat (List.rev (List.map string_of_stmt s1))))
	  		|_ -> (("if " ^ (string_of_expr e1) ^ ":") :: 
	  			(List.map addTab (List.concat (List.rev (List.map string_of_stmt s1))))) @ 
	  		 	("else:" :: (List.map addTab (List.concat (List.rev (List.map string_of_stmt s2)))))
	
	in let rec translate_stmts = function
		  [] -> []
		| hd::tl -> (String.concat "\n\t" (string_of_stmt hd)) :: (translate_stmts tl)

	in let string_of_func fdecl =  "def " ^ fdecl.fname ^ "(" ^ (String.concat ", " fdecl.paras) 
			^ "):\n\t" ^ (String.concat "\n\t" (translate_stmts fdecl.body)) 

	in let rec translate_funcs = function
		  [] -> ""
		| hd::tl -> (string_of_func hd) ^ "\n" ^ (translate_funcs tl)
	in let tra = translate_funcs (List.rev declarations) ^ (String.concat "\n" (translate_stmts (List.rev statements))) ^ "\n"
	in (String.concat "" prestring) ^ tra ^ (String.concat "" finalstring)

