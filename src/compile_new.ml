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
	get_call : string;
	func_opt: string list StringMap.t;
};;

let env = ref {
	vars = StringMap.empty;
	funcs = StringMap.empty;
	get_call = "";
	func_opt = StringMap.empty;
};;


env := {vars = StringMap.empty; funcs = StringMap.add "dot:distance" "float" env.contents.funcs; get_call = ""; func_opt = StringMap.add "dot:distance" ["dot"] env.contents.func_opt};;
env := {vars = StringMap.empty; funcs = StringMap.add "dot:getX" "float" env.contents.funcs; get_call = ""; func_opt = StringMap.add "dot:getX" [] env.contents.func_opt};;
env := {vars = StringMap.empty; funcs = StringMap.add "dot:getY" "float" env.contents.funcs; get_call = ""; func_opt = StringMap.add "dot:getY" [] env.contents.func_opt};;
env := {vars = StringMap.empty; funcs = StringMap.add "dot:setRunstep" "void" env.contents.funcs; get_call = ""; func_opt = StringMap.add "dot:setRunstep" ["float"; "char"] env.contents.func_opt};;
env := {vars = StringMap.empty; funcs = StringMap.add "dot:getRunstep" "float" env.contents.funcs; get_call = ""; func_opt = StringMap.add "dot:getRunstep" ["char"] env.contents.func_opt};;



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
		  Add -> "+" 
		| Sub -> "-" 
		| Mult -> "*" 
		| Div -> "/"
	    | Equal -> "==" 
	    | Neq -> "!="
	    | Less -> "<" 
	    | Leq -> "<=" 
	    | Greater -> ">" 
	    | Geq -> ">=" 
	    | And -> "and" 
	    | Or -> "or"
	    ) 
	      ^ " " ^
	      (fst result2), snd result1)

	  | Not(e) -> let result = string_of_expr e in ("not(" ^ fst result ^ ")", snd result)
	  | Assign(v, e) -> let result = string_of_expr e in (env := {vars = StringMap.add v (snd result) env.contents.vars; funcs = env.contents.funcs; get_call = env.contents.get_call; func_opt = env.contents.func_opt}; (v ^ " = " ^ fst result, snd result))
	  
	  | Noexpr -> ("", "none")
	  | Dot(x, y) -> let result1 = string_of_expr x and result2 = string_of_expr y in 
	                 ("dot(" ^ fst result1 ^ "," ^ fst result2 ^ ")", "dot") 
	  | Get_Call(x, y) -> let result1 = string_of_expr x
							in (env := {vars = env.contents.vars; funcs = env.contents.funcs; get_call = snd result1; func_opt = env.contents.func_opt};
								let result2 =  string_of_expr y in
	  							(fst result1 ^ "." ^ fst result2, snd result2))
	  | Line(x) -> ("line(" ^ String.concat ", " (List.map fst (List.map string_of_expr x)) ^ ")", "line")
	  | Circle(x) ->  ("circle(" ^ String.concat ", " (List.map fst (List.map string_of_expr x)) ^ ")", "circle")
	  | List(x) -> ("[" ^  String.concat ", " (List.map fst (List.map string_of_expr x)) ^ "]", "list")
	  | Call(f, el) ->
	      let gtc = env.contents.get_call in
	      let result_el = List.map string_of_expr el in
	      let returnType =  try StringMap.find (gtc ^ ":" ^ f) env.contents.funcs with Not_found -> raise(Failure("Undeclared Fuction " ^ gtc ^ ":" ^ f))
	  in  let func_opt_types = StringMap.find (gtc ^ ":" ^ f) env.contents.func_opt 
	in    let opt_match a b = if (a=b) then true else if (a="int" && b="float") then true else false
in        let opts_match a b = if (List.for_all2 opt_match a b) then true else raise(Failure("Fuction Parameter Not Match\n" ^ "Required " ^ gtc ^ ":" ^ f ^ "(" ^ (String.concat "," func_opt_types) ^ ")\n" ^ "Get " ^gtc ^ ":" ^ f ^ "(" ^ (String.concat "," (List.map snd result_el)) ^ ")"))
in let mat = try opts_match func_opt_types (List.map snd result_el) with Invalid_argument "List.for_all2" -> raise(Failure("Fuction Parameter Not Match\n" ^ "Required " ^ gtc ^ ":" ^ f ^ "(" ^ (String.concat "," func_opt_types) ^ ")\n" ^ "Get " ^gtc ^ ":" ^ f ^ "(" ^ (String.concat "," (List.map snd result_el)) ^ ")")) in
	      f ^ "(" ^ String.concat ", " (List.map fst result_el) ^ ")",returnType

	  
	in let addTab s = "\t" ^ s 
	in let rec string_of_stmt = function
		Expr(e) -> (env := {vars = env.contents.vars; funcs = env.contents.funcs; get_call = ""; func_opt = env.contents.func_opt}; fst (string_of_expr e)  :: [])
	  | PrintT(expr) -> (env := {vars = env.contents.vars; funcs = env.contents.funcs; get_call = ""; func_opt = env.contents.func_opt};("print " ^ fst (string_of_expr expr)) :: [])
	  | Print(expr) -> (env := {vars = env.contents.vars; funcs = env.contents.funcs; get_call = ""; func_opt = env.contents.func_opt};("msg.insert(tk.END," ^ fst (string_of_expr expr) ^ ")") :: [])
	  | While(e, s) -> (env := {vars = env.contents.vars; funcs = env.contents.funcs; get_call = ""; func_opt = env.contents.func_opt};("while (" ^ fst (string_of_expr e) ^ "):") ::
	  	(List.map addTab (List.concat (List.rev (List.map string_of_stmt s)))))
	  | For(e1, e2, s) -> (env := {vars = env.contents.vars; funcs = env.contents.funcs; get_call = ""; func_opt = env.contents.func_opt};
	  	("for " ^ fst (string_of_expr e1) ^ " in " ^ fst (string_of_expr e2) ^ ":")
	  		:: (List.map addTab (List.concat (List.rev (List.map string_of_stmt s)))))
	  | Return(e) -> (env := {vars = env.contents.vars; funcs = env.contents.funcs; get_call = ""; func_opt = env.contents.func_opt};("return " ^ fst (string_of_expr e)) :: [])
	  | If(e1, s1, s2) ->  
	  (env := {vars = env.contents.vars; funcs = env.contents.funcs; get_call = ""; func_opt = env.contents.func_opt};
	  		match s2 with
	  		[] -> ("if " ^ fst (string_of_expr e1) ^ ":") :: 
	  			(List.map addTab (List.concat (List.rev (List.map string_of_stmt s1))))
	  		|_ -> (("if " ^ fst (string_of_expr e1) ^ ":") :: 
	  			(List.map addTab (List.concat (List.rev (List.map string_of_stmt s1))))) @ 
	  		 	("else:" :: (List.map addTab (List.concat (List.rev (List.map string_of_stmt s2))))))
	
	in let rec translate_stmts = function
		  [] -> []
		| hd::tl -> (String.concat "\n\t" (string_of_stmt hd)) :: (translate_stmts tl)
	in let para_var paras_tp = env := {vars = StringMap.add  (fst paras_tp) (snd paras_tp) env.contents.vars; funcs = env.contents.funcs; get_call = env.contents.get_call; func_opt = env.contents.func_opt}
in let para_type fn paras_types = env := {vars = env.contents.vars; funcs = env.contents.funcs; get_call = env.contents.get_call; func_opt = StringMap.add fn paras_types env.contents.func_opt}
	in let string_of_func fdecl =  (env := {vars = StringMap.empty; funcs = StringMap.add (":" ^ fdecl.fname) fdecl.tp env.contents.funcs; get_call = env.contents.get_call; func_opt = env.contents.func_opt};
	                                 List.map para_var fdecl.paras;
	                                  para_type (":" ^ fdecl.fname) (List.map snd fdecl.paras);
	                                  "def " ^ fdecl.fname ^ "(" ^ (String.concat ", " (List.map fst fdecl.paras)) ^ "):\n\t" ^ (String.concat "\n\t" (translate_stmts fdecl.body)))

	in let rec translate_funcs = function
		  [] -> []
		| hd::tl -> (string_of_func hd)::(translate_funcs tl)
	in let dofunc = (String.concat "\n" (List.rev (translate_funcs (declarations)))) and dostms = (String.concat "\n" (List.rev (translate_stmts (statements))))
	in let tra = dofunc ^ "\n" ^ dostms ^ "\n"
	in (String.concat "" prestring) ^ tra ^ (String.concat "" finalstring)


