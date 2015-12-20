type pyExpr =
	  PyNoexpr
	| PyInt of int
	| PyFloat of float
	| PyBool of  bool
	| PyString of string
	| PyChar of char
	| PyId of string
	| PyBinop of pyExpr * string * pyExpr
	| PyAssign of string * pyExpr
  	| PyCall of string * pyExpr list
  	(*| PyDot of pyExpr * pyExpr*)
  	| PyGet_Call of pyExpr * pyExpr
  	(*| PyLine of pyExpr list
  	| PyCircle of pyExpr list*)
  	| PyList of pyExpr list
  	| PyNot of pyExpr
  	| PyMinus of pyExpr
  	| PyListEle of pyExpr * pyExpr

type pyStmt = 
	  PyExpr of pyExpr
	| PyReturn of pyExpr
	| PyIf of pyExpr * pyStmt list * pyStmt list
	| PyFor of pyExpr * pyExpr * pyStmt list
	| PyWhile of pyExpr * pyStmt list
	| PyPrint of pyExpr
	| PyPrintT of pyExpr

type pyFuncDecl = {
    pyfname : string;
    pyparas : string list;
    pybody : pyStmt list;
}

type pyProgram = pyFuncDecl list * pyStmt list