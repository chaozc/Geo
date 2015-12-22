inf = open('geoSysFunc.lib', 'r')
for line in inf:
	line
	paras = line.split(", ")
	paras2 = paras[2][1:-2].split("+")
	for i in range(len(paras2)):
		paras2[i] = "\""+paras2[i]+"\""
	if paras2[0] == '""':
		print "env := {vars = StringMap.empty; funcs = StringMap.add \""+paras[0]+"\" "+"\""+paras[1]+"\" env.contents.funcs; get_call = \"\"; func_opt = StringMap.add \""+paras[0]+"\" [] env.contents.func_opt};;"
	else:
		print "env := {vars = StringMap.empty; funcs = StringMap.add \""+paras[0]+"\" "+"\""+paras[1]+"\" env.contents.funcs; get_call = \"\"; func_opt = StringMap.add \""+paras[0]+"\" ["+(";").join(paras2)+"] env.contents.func_opt};;"
	
