open Pyast
let prestring = ["from Tkinter import *\n";
				 "from sysgeo import *\n" ]

let finalstring = [""]


let translate (declarations, statements) = 
	let rec string_of_expr = function
	    PyInt(l) -> string_of_int l
	  | PyFloat(l) -> string_of_float l
	  | PyString(s) -> "\"" ^ s ^ "\""
	  | PyChar(l) -> "\'" ^ (String.make 1 l) ^ "\'"
	  | PyBool(l) -> let tran_bool x = if (x=true) then "True" else "False" in (tran_bool l)
	  | PyId(s) ->  s
	  | PyBinop(e1, o, e2) ->
	  	  let result1 = string_of_expr e1 and result2 = string_of_expr e2 in
	      "(" ^ result1 ^ " "^ o ^ " "^result2 ^ ")" 
	  | PyMinus(e) ->
	  	let result = string_of_expr e in "-" ^ result
	  | PyNot(e) -> let result = string_of_expr e in "not(" ^ result ^ ")"

	  | PyNoexpr -> ""

	  | PyGet_Call(x, y) -> let result1 = string_of_expr x and result2 =  string_of_expr y
							in result1 ^ "." ^ result2
	  | PyList(x) -> "[" ^  String.concat ", " (List.map string_of_expr x) ^ "]"
	  | PyListEle(x1, x2) -> 
	  		let id = string_of_expr x2 in x1 ^ "[" ^ id ^ "]"
	  | PyCall(f, el) ->
	      let result_el = List.map string_of_expr el in
	      f ^ "(" ^ String.concat ", " result_el ^ ")"

	  
	in let addTab s = "\t" ^ s 
	in let rec string_of_stmt = function
		PyExpr(e) -> (string_of_expr e)  :: []
	  | PyPrintT(expr) -> ("print " ^ (string_of_expr expr)) :: []
	  | PyPrint(expr) -> ("print " ^ (string_of_expr expr)) :: []
	  | PyWhile(e, s) -> let rb = string_of_expr e in ("while (" ^ rb ^ "):"):: (List.map addTab (List.concat ((List.map string_of_stmt s))))
	  | PyFor(e1, e2, s) -> 
	  let r1 = string_of_expr e1 and r2 = string_of_expr e2 in 
	  	("for " ^ r1 ^ " in " ^ r2 ^ ":")
	  	:: (List.map addTab (List.concat ((List.map string_of_stmt s))))
	  | PyReturn(e) -> ("return " ^ (string_of_expr e)) :: []
	  | PyAssign(v, e, id) -> 
	  let result = string_of_expr e in
	  if (id=PyNoexpr) 
	  	then ((v) ^ " = " ^ result) :: []
	  	else ((v) ^ "[" ^ (string_of_expr id) ^ "] = " ^ result) :: []
	  | PyBreak -> ["break"]
	  | PyRun(e, s) -> let str=string_of_expr e in (("def runfun__(" ^ str ^ "):") ::  (List.map addTab (List.concat ((List.map string_of_stmt s))))) @ ["drawmain(" ^ str ^ ")"]
	  | PyIf(e1, s1, s2) ->  
	  let rb = string_of_expr e1 in 
	  		match s2 with
	  		[] -> ("if " ^ rb ^ ":") :: 
	  			(List.map addTab (List.concat ((List.map string_of_stmt s1))))
	  		|_ -> (("if " ^ rb ^ ":") :: 
	  			(List.map addTab (List.concat ((List.map string_of_stmt s1))))) @ 
	  		 	("else:" :: (List.map addTab (List.concat ((List.map string_of_stmt s2)))))

	  
	
	in let rec translate_stmts = function
		  [] -> []
		| hd::tl -> let result1 = (string_of_stmt hd) and result2 = (translate_stmts tl) in (result1 @ result2)
	in let string_of_func fdecl =  "def " ^ fdecl.pyfname ^ "(" ^ (String.concat ", " fdecl.pyparas) ^ "):\n\t" ^ (String.concat "\n\t" (translate_stmts fdecl.pybody))

	in let rec translate_funcs = function
		  [] -> []
		| hd::tl -> (string_of_func hd)::(translate_funcs tl)
	in let dofunc = (String.concat "\n" ( (translate_funcs (declarations)))) and dostms = (String.concat "\n" ((translate_stmts (statements))))
	in let tra = dofunc ^ "\n" ^ dostms ^ "\n"
	in (String.concat "" prestring) ^ tra ^ (String.concat "" finalstring)


