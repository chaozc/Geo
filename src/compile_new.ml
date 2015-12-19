open Ast

let prestring = ["import Tkinter as tk\n" ;
				 "from sympy.geometry import *\n"; 
				 "root = tk.Tk()\n";
				 "root.title(\"Geo\")\n";
				 "msg = tk.Listbox(root, width=50, height=10)\n";
				 "msg.grid(row=0, column=0)\n"]

let finalstring = ["root.mainloop()"]

module StringMap = Map.Make(String)

type envType = {
	vars : string StringMap.t;
	funcs : string StringMap.t;
};;

let env = ref {
	vars = StringMap.empty;
	funcs = StringMap.empty;
};;


env := {vars = StringMap.empty; funcs = StringMap.add "distance" "float" env.contents.funcs};;
env := {vars = StringMap.empty; funcs = StringMap.add "dot:getX" "float" env.contents.funcs};;
env := {vars = StringMap.empty; funcs = StringMap.add "dot:getY" "float" env.contents.funcs};;
env := {vars = StringMap.empty; funcs = StringMap.add "dot:setRunstep" "void" env.contents.funcs};;
env := {vars = StringMap.empty; funcs = StringMap.add "dot:getRunstep" "float" env.contents.funcs};;



let translate (declarations, statements) =
	let rec string_of_expr = function
	    Int(l) -> (string_of_int l, "int")
	  | Float(l) -> (string_of_float l, "float")
	  | String(s) -> ("\"" ^ s ^ "\"", "string")
	  | Char(l) -> ("\'" ^ (String.make 1 l) ^ "\'", "char")
	  | Bool(l) -> (string_of_bool l, "bool")
	  | Id(s) ->  (s, try StringMap.find s env.contents.vars with Not_found -> raise(Failure("Undeclared Variable " ^ s))) 
	  | Binop(e1, o, e2) ->
	  	  let result1 = string_of_expr e1 and result2 = string_of_expr e2 in
	      ((fst result1) ^ " " ^
	      (match o with
		Add -> "+" | Sub -> "-" | Mult -> "*" | Div -> "/"
	      | Equal -> "==" | Neq -> "!="
	      | Less -> "<" | Leq -> "<=" | Greater -> ">" | Geq -> ">=" | And -> "and" | Or -> "or") ^ " " ^
	      (fst result2), snd result1)

	  | Not(e) -> let result = string_of_expr e in ("not(" ^ fst result ^ ")", snd result)
	  | Assign(v, e) -> let result = string_of_expr e in (env := {vars = StringMap.add v (snd result) env.contents.vars; funcs = env.contents.funcs}; (v ^ " = " ^ fst result, snd result))
	  
	  | Noexpr -> ("", "none")
	  | Dot(x, y) -> let result1 = string_of_expr x and result2 = string_of_expr y in 
	                 ("dot(" ^ fst result1 ^ "," ^ fst result2 ^ ")", "dot") 
	  | Get_Call(x, y) -> (fst (string_of_expr x) ^ "." ^ fst (string_of_expr y), "undefined")
	  | Line(x) -> ("line(" ^ String.concat ", " (List.map fst (List.map string_of_expr x)) ^ ")", "line")
	  | Circle(x) ->  ("circle(" ^ String.concat ", " (List.map fst (List.map string_of_expr x)) ^ ")", "circle")
	  | List(x) -> ("[" ^  String.concat ", " (List.map fst (List.map string_of_expr x)) ^ "]", "list")
	  | Call(f, el) ->
	      (f ^ "(" ^ String.concat ", " (List.map fst (List.map string_of_expr el)) ^ ")", try StringMap.find f env.contents.funcs with Not_found -> raise(Failure("Undeclared Fuction " ^ f))) 

	  
	in let addTab s = "\t" ^ s 
	in let rec string_of_stmt = function
		Expr(e) -> fst (string_of_expr e)  :: []
	  | PrintT(expr) -> ("print " ^ fst (string_of_expr expr)) :: []
	  | Print(expr) -> ("msg.insert(tk.END," ^ fst (string_of_expr expr) ^ ")") :: []
	  | While(e, s) -> ("while (" ^ fst (string_of_expr e) ^ "):") ::
	  	(List.map addTab (List.concat (List.rev (List.map string_of_stmt s))))
	  | For(e1, e2, s) -> ("for " ^ fst (string_of_expr e1) ^ " in " ^ fst (string_of_expr e2) ^ ":")
	  		:: (List.map addTab (List.concat (List.rev (List.map string_of_stmt s))))
	  | Return(e) -> ("return " ^ fst (string_of_expr e)) :: []
	  | If(e1, s1, s2) ->  
	  		match s2 with
	  		[] -> ("if " ^ fst (string_of_expr e1) ^ ":") :: 
	  			(List.map addTab (List.concat (List.rev (List.map string_of_stmt s1))))
	  		|_ -> (("if " ^ fst (string_of_expr e1) ^ ":") :: 
	  			(List.map addTab (List.concat (List.rev (List.map string_of_stmt s1))))) @ 
	  		 	("else:" :: (List.map addTab (List.concat (List.rev (List.map string_of_stmt s2)))))
	
	in let rec translate_stmts = function
		  [] -> []
		| hd::tl -> (String.concat "\n\t" (string_of_stmt hd)) :: (translate_stmts tl)
	in let para_type paras_tp = env := {vars = StringMap.add  (fst paras_tp) (snd paras_tp) env.contents.vars; funcs = env.contents.funcs}
	in let string_of_func fdecl =  (env := {vars = StringMap.empty; funcs = StringMap.add fdecl.fname fdecl.tp env.contents.funcs}; List.map para_type fdecl.paras; "def " ^ fdecl.fname ^ "(" ^ (String.concat ", " (List.map fst fdecl.paras)) 
			^ "):\n\t" ^ (String.concat "\n\t" (translate_stmts fdecl.body)))

	in let rec translate_funcs = function
		  [] -> []
		| hd::tl -> (string_of_func hd)::(translate_funcs tl)
	in let dofunc = (String.concat "\n" (List.rev (translate_funcs (declarations)))) and dostms = (String.concat "\n" (List.rev (translate_stmts (statements))))
	in let tra = dofunc ^ "\n" ^ dostms ^ "\n"
	in (String.concat "" prestring) ^ tra ^ (String.concat "" finalstring)


