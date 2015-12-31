ocamllex scanner.mll # create scanner.ml
echo "ocamllex scanner.mll finished"
ocamlyacc parser.mly # create parser.ml and parser.mli
echo "ocamlyacc parser.mly finished"
ocamlc -c ast.ml # compile AST types
echo "ocamlc -c ast.ml finished"
ocamlc -c pyast.ml # compile AST types
echo "ocamlc -c pyast.ml finished"
ocamlc -c parser.mli # compile parser types
echo "ocamlc -c parser.mli finished"
ocamlc -c scanner.ml # compile the scanner
echo "ocamlc -c scanner.ml finished"
ocamlc -c parser.ml # compile the parser
echo "ocamlc -c parser.ml finished"
ocamlc -c compile_sc_py.ml # compile the compiler
echo "ocamlc -c compile_sc_py.ml finished"
ocamlc -c compile_to_pycode.ml # compile the compiler
echo "ocamlc -c compile_to_pycode.ml finished"
ocamlc -c geo_sc_py.ml # compile geo
echo "ocamlc -c geo_sc_py.ml finished"
ocamlc -o geo parser.cmo scanner.cmo compile_sc_py.cmo compile_to_pycode.cmo geo_sc_py.cmo
echo "ocamlc -o geo parser.cmo scanner.cmo compile_sc_py.cmo compile_to_pycode.cmo geo_sc_py.cmo finished"