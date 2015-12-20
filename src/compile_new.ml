open Ast
open Sys
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
(*
env := {vars = StringMap.empty; funcs = StringMap.add "list:append" "void" env.contents.funcs; get_call = ""; func_opt = StringMap.add "list:append" ["any"] env.contents.func_opt};;
env := {vars = StringMap.empty; funcs = StringMap.add "list:pop" "void" env.contents.funcs; get_call = ""; func_opt = StringMap.add "list:pop" [] env.contents.func_opt};;

env := {vars = StringMap.empty; funcs = StringMap.add "dot:distance" "float" env.contents.funcs; get_call = ""; func_opt = StringMap.add "dot:distance" ["dot"] env.contents.func_opt};;
env := {vars = StringMap.empty; funcs = StringMap.add "dot:getX" "float" env.contents.funcs; get_call = ""; func_opt = StringMap.add "dot:getX" [] env.contents.func_opt};;
env := {vars = StringMap.empty; funcs = StringMap.add "dot:getY" "float" env.contents.funcs; get_call = ""; func_opt = StringMap.add "dot:getY" [] env.contents.func_opt};;
env := {vars = StringMap.empty; funcs = StringMap.add "dot:setRunstep" "void" env.contents.funcs; get_call = ""; func_opt = StringMap.add "dot:setRunstep" ["float"; "char"] env.contents.func_opt};;
env := {vars = StringMap.empty; funcs = StringMap.add "dot:getRunstep" "float" env.contents.funcs; get_call = ""; func_opt = StringMap.add "dot:getRunstep" ["char"] env.contents.func_opt};;
*)

env := {vars = StringMap.empty; funcs = StringMap.add "len" "int" env.contents.funcs; get_call = ""; func_opt = StringMap.add "len" ["list"] env.contents.func_opt};;
env := {vars = StringMap.empty; funcs = StringMap.add "sin" "float" env.contents.funcs; get_call = ""; func_opt = StringMap.add "sin" ["float"] env.contents.func_opt};;
env := {vars = StringMap.empty; funcs = StringMap.add "cos" "float" env.contents.funcs; get_call = ""; func_opt = StringMap.add "cos" ["float"] env.contents.func_opt};;
env := {vars = StringMap.empty; funcs = StringMap.add "tan" "float" env.contents.funcs; get_call = ""; func_opt = StringMap.add "tan" ["float"] env.contents.func_opt};;
env := {vars = StringMap.empty; funcs = StringMap.add "cot" "float" env.contents.funcs; get_call = ""; func_opt = StringMap.add "cot" ["float"] env.contents.func_opt};;
env := {vars = StringMap.empty; funcs = StringMap.add "dot:getX" "float" env.contents.funcs; get_call = ""; func_opt = StringMap.add "dot:getX" [""] env.contents.func_opt};;
env := {vars = StringMap.empty; funcs = StringMap.add "dot:getY" "float" env.contents.funcs; get_call = ""; func_opt = StringMap.add "dot:getY" [""] env.contents.func_opt};;
env := {vars = StringMap.empty; funcs = StringMap.add "dot:distance" "float" env.contents.funcs; get_call = ""; func_opt = StringMap.add "dot:distance" ["dot"] env.contents.func_opt};;
env := {vars = StringMap.empty; funcs = StringMap.add "dot:getRunstep" "float" env.contents.funcs; get_call = ""; func_opt = StringMap.add "dot:getRunstep" ["char"] env.contents.func_opt};;
env := {vars = StringMap.empty; funcs = StringMap.add "dot:setRunstep" "void" env.contents.funcs; get_call = ""; func_opt = StringMap.add "dot:setRunstep" ["char";"float"] env.contents.func_opt};;
env := {vars = StringMap.empty; funcs = StringMap.add "line:getPara" "float" env.contents.funcs; get_call = ""; func_opt = StringMap.add "line:getPara" ["char"] env.contents.func_opt};;
env := {vars = StringMap.empty; funcs = StringMap.add "line:setPara" "void" env.contents.funcs; get_call = ""; func_opt = StringMap.add "line:setPara" ["char";"float"] env.contents.func_opt};;
env := {vars = StringMap.empty; funcs = StringMap.add "line:setparaYline" "void" env.contents.funcs; get_call = ""; func_opt = StringMap.add "line:setparaYline" ["dot"] env.contents.func_opt};;
env := {vars = StringMap.empty; funcs = StringMap.add "line:setparaYsegm" "void" env.contents.funcs; get_call = ""; func_opt = StringMap.add "line:setparaYsegm" ["dot";"dot"] env.contents.func_opt};;
env := {vars = StringMap.empty; funcs = StringMap.add "line:getRunstep" "float" env.contents.funcs; get_call = ""; func_opt = StringMap.add "line:getRunstep" ["char"] env.contents.func_opt};;
env := {vars = StringMap.empty; funcs = StringMap.add "line:setRunstep" "void" env.contents.funcs; get_call = ""; func_opt = StringMap.add "line:setRunstep" ["char";"float"] env.contents.func_opt};;
env := {vars = StringMap.empty; funcs = StringMap.add "line:getY" "float" env.contents.funcs; get_call = ""; func_opt = StringMap.add "line:getY" ["float"] env.contents.func_opt};;
env := {vars = StringMap.empty; funcs = StringMap.add "line:getX" "float" env.contents.funcs; get_call = ""; func_opt = StringMap.add "line:getX" ["float"] env.contents.func_opt};;
env := {vars = StringMap.empty; funcs = StringMap.add "line:contains" "bool" env.contents.funcs; get_call = ""; func_opt = StringMap.add "line:contains" ["dot"] env.contents.func_opt};;
env := {vars = StringMap.empty; funcs = StringMap.add "line:getMidpoint" "dot" env.contents.funcs; get_call = ""; func_opt = StringMap.add "line:getMidpoint" [""] env.contents.func_opt};;
env := {vars = StringMap.empty; funcs = StringMap.add "line:length" "float" env.contents.funcs; get_call = ""; func_opt = StringMap.add "line:length" [""] env.contents.func_opt};;
env := {vars = StringMap.empty; funcs = StringMap.add "line:pointAway" "dot" env.contents.funcs; get_call = ""; func_opt = StringMap.add "line:pointAway" ["dot";"float"] env.contents.func_opt};;
env := {vars = StringMap.empty; funcs = StringMap.add "line:isParallel" "bool" env.contents.funcs; get_call = ""; func_opt = StringMap.add "line:isParallel" ["line"] env.contents.func_opt};;
env := {vars = StringMap.empty; funcs = StringMap.add "line:intersect" "list" env.contents.funcs; get_call = ""; func_opt = StringMap.add "line:intersect" ["shape"] env.contents.func_opt};;
env := {vars = StringMap.empty; funcs = StringMap.add "circle:getCenter" "dot" env.contents.funcs; get_call = ""; func_opt = StringMap.add "circle:getCenter" [""] env.contents.func_opt};;
env := {vars = StringMap.empty; funcs = StringMap.add "circle:getRadius" "float" env.contents.funcs; get_call = ""; func_opt = StringMap.add "circle:getRadius" [""] env.contents.func_opt};;
env := {vars = StringMap.empty; funcs = StringMap.add "circle:setCenter" "void" env.contents.funcs; get_call = ""; func_opt = StringMap.add "circle:setCenter" ["dot"] env.contents.func_opt};;
env := {vars = StringMap.empty; funcs = StringMap.add "circle:setRadius" "void" env.contents.funcs; get_call = ""; func_opt = StringMap.add "circle:setRadius" ["float"] env.contents.func_opt};;
env := {vars = StringMap.empty; funcs = StringMap.add "circle:getRunstep" "float" env.contents.funcs; get_call = ""; func_opt = StringMap.add "circle:getRunstep" ["char"] env.contents.func_opt};;
env := {vars = StringMap.empty; funcs = StringMap.add "circle:setRunstep" "void" env.contents.funcs; get_call = ""; func_opt = StringMap.add "circle:setRunstep" ["char";"float"] env.contents.func_opt};;
env := {vars = StringMap.empty; funcs = StringMap.add "circle:getPointbyarc" "dot" env.contents.funcs; get_call = ""; func_opt = StringMap.add "circle:getPointbyarc" ["float"] env.contents.func_opt};;
env := {vars = StringMap.empty; funcs = StringMap.add "circle:intersect" "list" env.contents.funcs; get_call = ""; func_opt = StringMap.add "circle:intersect" ["shape"] env.contents.func_opt};;
env := {vars = StringMap.empty; funcs = StringMap.add "runset:addPara" "bool" env.contents.funcs; get_call = ""; func_opt = StringMap.add "runset:addPara" ["shape";"char"] env.contents.func_opt};;
env := {vars = StringMap.empty; funcs = StringMap.add "runset:renew" "void" env.contents.funcs; get_call = ""; func_opt = StringMap.add "runset:renew" [""] env.contents.func_opt};;
env := {vars = StringMap.empty; funcs = StringMap.add "runset:enableRun" "void" env.contents.funcs; get_call = ""; func_opt = StringMap.add "runset:enableRun" [""] env.contents.func_opt};;
env := {vars = StringMap.empty; funcs = StringMap.add "runset:disableRun" "Void" env.contents.funcs; get_call = ""; func_opt = StringMap.add "runset:disableRun" [""] env.contents.func_opt};;
env := {vars = StringMap.empty; funcs = StringMap.add "runset:removePara" "bool" env.contents.funcs; get_call = ""; func_opt = StringMap.add "runset:removePara" ["shape";"char"] env.contents.func_opt};;


let translate (declarations, statements) = 
	let rec string_of_expr = function
	    Int(l) -> (string_of_int l, "int")
	  | Float(l) -> (string_of_float l, "float")
	  | String(s) -> ("\"" ^ s ^ "\"", "string")
	  | Char(l) -> ("\'" ^ (String.make 1 l) ^ "\'", "char")
	  | Bool(l) -> let tran_bool x = if (x=true) then "True" else "False" in (tran_bool l, "bool")
	  | Id(s) ->  (s, try StringMap.find s env.contents.vars with Not_found -> raise(Failure("Undeclared Variable " ^ env.contents.get_call ^ ":"^s))) 
	  | Binop(e1, o, e2) ->
	  	  let result1 = string_of_expr e1 and result2 = string_of_expr e2 in
	  	  let digit_op_match op a b = if ((a="string"||a="int"||a="float")&&a=b) then (true, a) else if ((a="float" && b="int")||(a="int" && b="float")) then (true, "float") else raise(Failure("Undefined Operation: " ^ a ^ op ^ b)) in
	  	  let eq_op_match op a b = if (a=b&&(a="string"||a="int"||a="float"||a="bool")) then (true, "bool") else raise(Failure("Undefined Operation: " ^ a ^ op ^ b)) in 
	  	  let bool_op_match op a b = if (a=b && a="bool") then (true, "bool") else raise(Failure("Undefined Operation: " ^ a ^ op ^ b)) in 
	      let get_type_bi o = 
	      (match o with
		  Add -> let ck = digit_op_match "+" (snd result1) (snd result2) in (snd ck, "+") 
		| Sub -> let ck = digit_op_match "-" (snd result1) (snd result2) in (snd ck, "-") 
		| Mult -> let ck = digit_op_match "*" (snd result1) (snd result2) in (snd ck, "*") 
		| Div -> let ck = digit_op_match "/" (snd result1) (snd result2) in (snd ck, "/")
		| Mod -> let ck = digit_op_match "%" (snd result1) (snd result2) in (snd ck, "%")
		| Exp -> let ck = digit_op_match "^" (snd result1) (snd result2) in (snd ck, "**")
	    | Equal -> let ck = eq_op_match "==" (snd result1) (snd result2) in (snd ck, "==") 
	    | Neq -> let ck = eq_op_match "!=" (snd result1) (snd result2) in (snd ck, "!=")
	    | Less -> let ck = eq_op_match "<" (snd result1) (snd result2) in (snd ck, "<") 
	    | Leq -> let ck = eq_op_match "<=" (snd result1) (snd result2) in (snd ck, "<=") 
	    | Greater -> let ck = eq_op_match ">" (snd result1) (snd result2) in (snd ck, ">") 
	    | Geq -> let ck = eq_op_match ">=" (snd result1) (snd result2) in (snd ck, ">=") 
	    | And -> let ck = bool_op_match "&" (snd result1) (snd result2) in (snd ck, "and") 
	    | Or -> let ck = bool_op_match "|" (snd result1) (snd result2) in (snd ck, "or")
	    ) in
	      let result_op = get_type_bi o in 
	      ("(" ^(fst result1) ^ " " ^
	      (snd result_op)
	      ^ " " ^
	      (fst result2)^")", fst result_op)
	  | Minus(e) ->
	  	let result = string_of_expr e in
	  	let ck_minus x = if (x="int"||x="float") then x else raise(Failure("Undefined Operation: -" ^ x)) in
	  	let tp = ck_minus (snd result) in
	  	("-" ^ (fst result), tp)
	  | Not(e) -> let result = string_of_expr e in 
	  let ck_not x = if x == "bool" then x else raise(Failure("Undefined Operation: not(" ^ x^")")) in
	  ("not(" ^ fst result ^ ")", snd result)
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
	  | ListEle(x1, x2) -> 
	  		let ln_ = string_of_expr x1 and id_ = string_of_expr x2 in
	  			let ck_list ln id = if ((snd ln = "list")&&((snd id) = "int")) then ((fst ln) ^ "[" ^ (fst id) ^ "]", "list_ele") else raise(Failure("List Error: " ^ (snd ln) ^ "[" ^ (snd id) ^ "]")) in
	  			let ans = ck_list ln_ id_ in ans
	  | Call(f, el) ->
	      let gtc = env.contents.get_call in
	      let result_el = List.map string_of_expr el in
	      let returnType =  try StringMap.find (gtc ^ ":" ^ f) env.contents.funcs with Not_found -> raise(Failure("Undeclared Fuction " ^ gtc ^ ":" ^ f))
	  in  let func_opt_types = StringMap.find (gtc ^ ":" ^ f) env.contents.func_opt 
	in    let opt_match a b = if (a=b) then true else if (b="int" && a="float") then true else if (a="any"||b="list_ele") then true else false
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
	  | For(e1, e2, s) -> 
	  let r1_ck_fori = function 
	  	Id(s) -> (env := {vars = StringMap.add s "list_ele" env.contents.vars; funcs = env.contents.funcs; get_call = ""; func_opt = env.contents.func_opt}; string_of_expr e1)
	  | _ -> raise(Failure("Geo Syntax Error Forloop"))
	in 
	  let r1 = r1_ck_fori e1 and r2 = string_of_expr e2 in 
	  (env := {vars = env.contents.vars; funcs = env.contents.funcs; get_call = ""; func_opt = env.contents.func_opt};
	  	("for " ^ fst r1 ^ " in " ^ fst r2 ^ ":")
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
		| hd::tl -> let result1 = (String.concat "\n\t" (string_of_stmt hd)) and result2 = (translate_stmts tl) in (result1::result2)
	in let para_var paras_tp = env := {vars = StringMap.add  (fst paras_tp) (snd paras_tp) env.contents.vars; funcs = env.contents.funcs; get_call = env.contents.get_call; func_opt = env.contents.func_opt}
in let para_type fn paras_types = env := {vars = env.contents.vars; funcs = env.contents.funcs; get_call = env.contents.get_call; func_opt = StringMap.add fn paras_types env.contents.func_opt}
	in let string_of_func fdecl =  (env := {vars = env.contents.vars; funcs = StringMap.add (":" ^ fdecl.fname) fdecl.tp env.contents.funcs; get_call = env.contents.get_call; func_opt = env.contents.func_opt};
	                                 List.map para_var fdecl.paras;
	                                  para_type (":" ^ fdecl.fname) (List.map snd fdecl.paras);
	                                  "def " ^ fdecl.fname ^ "(" ^ (String.concat ", " (List.map fst fdecl.paras)) ^ "):\n\t" ^ (String.concat "\n\t" (translate_stmts fdecl.body)))

	in let rec translate_funcs = function
		  [] -> []
		| hd::tl -> (string_of_func hd)::(translate_funcs tl)
	in let dofunc = (String.concat "\n" (List.rev (translate_funcs (declarations)))) and dostms = (String.concat "\n" ((translate_stmts (List.rev statements))))
	in let tra = dofunc ^ "\n" ^ dostms ^ "\n"
	in (String.concat "" prestring) ^ tra ^ (String.concat "" finalstring)


