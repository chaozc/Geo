open Printf

let _ =
let lexbuf = Lexing.from_channel stdin in


let program = (try Parser.program Scanner.token lexbuf 
				with Parsing.Parse_error -> raise (Failure("Geo Syntax Error")))

in
let py_ast =  Compile_sc_py.translate program in
let pycode =  Compile_to_pycode.translate py_ast in
print_endline pycode;;



