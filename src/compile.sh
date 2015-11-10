ocamllex scanner.mll # create scanner.ml
echo "ocamllex scanner.mll finished"
ocamlyacc parser.mly # create parser.ml and parser.mli
echo "ocamlyacc parser.mly finished"
ocamlc -c ast.ml # compile AST types
echo "ocamlc -c ast.ml finished"
ocamlc -c parser.mli # compile parser types
echo "ocamlc -c parser.mli finished"
ocamlc -c scanner.ml # compile the scanner
echo "ocamlc -c scanner.ml finished"
ocamlc -c parser.ml # compile the parser
echo "ocamlc -c parser.ml finished"