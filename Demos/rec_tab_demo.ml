(*  Increase tab in Python 
	Here we define Int -> tab number keeps unchanged | Float -> tab number +1 | Char -> tab number -1
	11/12/2015 Ziyi
*)

type token = Int of int | Float of float | Char of char

let expr = [Int(5);Float(3.5);Float(5.5);Float(7.5);Char('r');Int(7);]

let _ = 
	let a = Array.make 1 "" in
	let prefix_operation num = match num with
	  1 -> a.(0) <- "\t"^a.(0); a.(0)
	| -1 -> (match String.length a.(0) with
		  0 -> a.(0)
		| _ -> a.(0) <- String.sub a.(0) 0 ((String.length a.(0))-1); a.(0))
	| _ -> a.(0)
	in
	let rec output = function
	  Int(l) -> (prefix_operation 0)^(string_of_int l)
	| Float(l) -> (prefix_operation 1)^(string_of_float l)
	| Char(l) ->  (prefix_operation (-1))^(String.make 1 l)
	in
	let rec string_of_stmt = function
		  [] -> ""
		| hd::tl -> let t1 = output hd and t2 = string_of_stmt tl in t1^"\n"^t2
	in print_string (string_of_stmt expr)