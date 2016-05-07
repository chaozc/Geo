from sys import argv
inf = open(argv[1], 'r')
for line in inf:
	if line.find("drawmain") >= 0:
		inf1 = open("draw_demo.py", "r")
		for l in inf1:
			print l[:-1]
		inf1.close()
	print line[:-1]
