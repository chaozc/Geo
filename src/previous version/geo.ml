open Printf

let _ =
let lexbuf = Lexing.from_channel stdin in


let program = (try Parser.program Scanner.token lexbuf 
				with Parsing.Parse_error -> raise (Failure("Geo Syntax Error")))

in
let pycode =  Compile_new.translate program in
print_endline pycode;;



