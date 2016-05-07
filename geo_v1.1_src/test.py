from Tkinter import *
from sysgeo import *

PI = 3.14159265359
dot1 = dot(3, 5)
line1 = line(4, 5)
line2 = line(dot(1, 2), dot(2, 3))
line3 = line(4, 5, -5, 5)
line4 = line(dot(0, -2), dot(0, 2), 0, 0)
print line1
print line2
print line3
print line4
print line2.intersect(line4)
print line3.distance(dot1)
print line4.length()
print line2.pointAway(dot(2, 3), 5)
print line4.pointAway(dot(0, 0), 1)
print line3.getEndpoints()
print line3.getMidpoint()
print line1.isParallel(line2)
print line1.getX(5)
print line4.getX(1)
print line2.getY(0)
line2.setRunstep('a', 0.5)
line3.setRunstep('b', 1.)
line3.setRunstep('x', 1.)
r1 = runset(8, 0.1)
r1.addPara(line2, 'a')
r1.addPara(line3, 'b')
r1.addPara(line3, 'x')
def runfun__(r1):
	print line2
	print line3
	print line4
	line4.rotateonPoint(dot(0, 0), (PI / 4))
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
###########################################
drawmain(r1)

