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