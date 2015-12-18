open Printf

let _ =
let lexbuf = Lexing.from_channel stdin in
let program = Parser.program Scanner.token lexbuf in
let pycode = Compile_new.translate program in
print_endline pycode;;



