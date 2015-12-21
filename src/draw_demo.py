##########################################
global w
global argv
global runsets

def transaxis(p):
	transx = float(p.x)
	transy = float(p.y)
	tx = transx*25+250
	ty = transy*25+250
	tx = int(tx)
	ty = int(ty)
	return Point(tx,ty)

def draw(args):
	global w
	i = 0
	if(isinstance(args,line)):
		if(args.isLine):
			if(args.a != float("inf")):
				d1=transaxis(Point(-10,args.getY(-10)))
				d2=transaxis(Point(10,args.getY(10)))
			else:
				tx = float(args.line_.points[0].x)
				d1=transaxis(tx,-10)
				d2=transaxis(tx,10)
		else:
			d1=transaxis(args.line_.points[0])
			d2=transaxis(args.line_.points[1])
		w.create_line(d1.x,d1.y,d2.x,d2.y)
	elif(isinstance(args,circle)):
		c = transaxis(args.getCenter())
		r = int(float(args.getRadius())*25)
		w.create_oval(c.x-r, c.y-r, c.x+r, c.y+r)
	elif(isinstance(args,dot)):
		d = transaxis(args)
		w.create_oval(d.x-2, d.y-2, d.x+2, d.y+2, fill="black")

def delete():
	global w
	global runsets
	w.delete("all")
	# print "start sleep"
	# sleep(1)
	for argv in runsets.objlist:
		draw(argv)
	for argv in runsets.marklist:
		draw(argv)
	runfun__(runsets)
	if(runsets.run()):
		#print runsets.runtime
		w.after(int(runsets.sleeptime*1000),delete)

def drawmain(runs):
	global w
	global runsets
	runsets = runs
	master = Tk()
	# index=0
	w = Canvas(master, width=500, height=500)
	w.pack()
	# print "in loop"
	# w.delete("all")
	for argv in runsets.objlist:
		draw(argv)

	w.after(100, delete)

	mainloop()
	return True
############################################