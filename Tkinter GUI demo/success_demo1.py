from Tkinter import *
from sysgeo import *

PI = 3.14159265359
dot1 = dot(3, 5)
circle1 = circle(dot(3, 5), 5)
circle2 = circle(dot(0, 0), 5)
print circle1
print circle2
print circle2.intersect(circle1)
print circle2.intersect(line(dot(0, 2), dot(1, 2)))
print circle2.intersect(line(dot(0, 2), dot(1, 2), -1, 1))
print circle2.intersect(line(dot(0, -2), dot(0, 2)))
print circle2.intersect(line(dot(0, -2), dot(0, 2), 0, 0))
print circle1.getRadius()
print circle2.getCenter()
circle1.setCenter(dot(2, 2))
print circle1
circle2.setRadius(3)
print circle2
print circle2.getPointbyarc((PI / 4))
r1 = runset(50, 0.2)
circle1.setRunstep('x', 0.2)
circle1.setRunstep('y', -0.2)
circle2.setRunstep('r', 0.2)
print circle1.getRunstep('x')
r1.addPara(circle1, 'x')
r1.addPara(circle1, 'y')
r1.addPara(circle2, 'r')
##########################################
def runfun__():
	print circle1
	print circle2
##########################################
global w
global argv
global runsets

def transaxis(p):
	tx = float(p.x)*25+250
	ty = -float(p.y)*25+250
	tx = int(tx)
	ty = int(ty)
	return Point(tx,ty)

def draw(args):
	global w
	i = 0
	if(isinstance(args,line)):
		if(args.isLine):
			if(args.a != float("inf")):
				d1=transaxis(Point(-10,getY(-10)))
				d2=transaxis(Point(10,getY(10)))
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
		d = transaxis(dot)
		w.create_oval(d.x-2, d.y-2, d.x+2, d.y+2, fill="black")
	#if(isinstance(args,polygon)):
	#	for()
	# try:
	# 	while args[i]:
	# 		# global w
	# 		if (args[i] == 'line'):
	# 		    w.create_line(0, int(args[i+2]), -int(args[i+2])/int(args[i+1]), 0) # slope and intercept
	# 		    i += 3
	# 		elif (args[i] == 'segment'):
	# 		    # w.create_line(int(args[i+1]), int(args[i+2]), int(args[i+3]), int(args[i+4])) # endpoint 1 and 2
	# 		    w.create_line(0, 0, 200, 100)
	# 		    i += 5
	# 		elif (args[i] == 'dot'):
	# 		    # w.create_point(int(args[i+1]), int(args[i+2])) # x and y
	# 		    w.create_oval(int(args[i+1])-1, int(args[i+2])-1, int(args[i+1])+1, int(args[i+2])+1, fill="black")
	# 		    i += 3
	# 		elif (args[i] == 'circle'):
	# 		    w.create_oval(int(args[i+1]) - int(args[i+3]), int(args[i+2]) - int(args[i+3]), int(args[i+1]) + int(args[i+3]), int(args[i+2]) + int(args[i+3])) # center and radius
	# 		    # w.after(1000 * i, w.delete(thiscircle))
	# 		    # w.create_oval(150,150,250,250)
	# 		    i += 4
	# 		elif (args[i] == 'polygon'):
	# 		    i += 1
	# 		    vertices = []
	# 		    try:
	# 		        while (args[i] and args[i].isdigit()):
	# 		            vertices.append((int(args[i]), int(args[i+1])))
	# 		            i += 2
	# 		    except IndexError:
	# 		        pass

	# 		    w.create_polygon(vertices)
	# 		else:
	# 		    print "??????????????????"

	# except IndexError:
	# 	return True

def delete():
	global w
	global runsets
	w.delete("all")
	# print "start sleep"
	# sleep(1)
	for argv in runsets.objlist:
		print "argv:"
		print argv
		draw(argv)
	runfun__()
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
		print "draw1"
		print argv
		draw(argv)

	w.after(1000, delete)

	mainloop()
	return True
############################################
drawmain(r1)
	