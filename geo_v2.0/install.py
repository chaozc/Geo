import subprocess
inf = open("compile_semantic_check.ml", "r")
for line in inf:
	print line
	if line.find("(*translate geoAst to pyAst*)") >= 0:
		inf2 = open("geo_hardcode", "r")
		for l in inf2:
			print l
		inf2.close()
