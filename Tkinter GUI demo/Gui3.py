from Tkinter import *
#from time import sleep
from sysgeo import *

global w
global argv

def draw(args):
	global w
	i = 0
	try:
		while args[i]:
			# global w
			if (args[i] == 'line'):
			    w.create_line(0, int(args[i+2]), -int(args[i+2])/int(args[i+1]), 0) # slope and intercept
			    i += 3
			elif (args[i] == 'segment'):
			    # w.create_line(int(args[i+1]), int(args[i+2]), int(args[i+3]), int(args[i+4])) # endpoint 1 and 2
			    w.create_line(0, 0, 200, 100)
			    i += 5
			elif (args[i] == 'dot'):
			    # w.create_point(int(args[i+1]), int(args[i+2])) # x and y
			    w.create_oval(int(args[i+1])-1, int(args[i+2])-1, int(args[i+1])+1, int(args[i+2])+1, fill="black")
			    i += 3
			elif (args[i] == 'circle'):
			    w.create_oval(int(args[i+1]) - int(args[i+3]), int(args[i+2]) - int(args[i+3]), int(args[i+1]) + int(args[i+3]), int(args[i+2]) + int(args[i+3])) # center and radius
			    # w.after(1000 * i, w.delete(thiscircle))
			    # w.create_oval(150,150,250,250)
			    i += 4
			elif (args[i] == 'polygon'):
			    i += 1
			    vertices = []
			    try:
			        while (args[i] and args[i].isdigit()):
			            vertices.append((int(args[i]), int(args[i+1])))
			            i += 2
			    except IndexError:
			        pass

			    w.create_polygon(vertices)
			else:
			    print "??????????????????"

	except IndexError:
		return True

def delete():
	# w.delete("all")
	# if(index%2==0):
	# 	w.create_line(0, 100, 200, 0, fill="red", dash=(4, 4))
	# else:
	# 	w.create_rectangle(50, 25, 150, 75, fill="blue")
	# index+=1
	global w
	global argv
	w.delete("all")
	draw(argv)
	w.after(1000,delete)

def drawmain(argument):
	global w
	global argv
	argv = argument

	master = Tk()
	# index=0
	w = Canvas(master, width=400, height=300)
	w.pack()
	# print "in loop"
	# w.delete("all")
	draw(argv)
	# r1=runset(5,1)
	# c1=circle(dot(50,50),50)
	# c1.setRunstep('x',10)
	# r1.addPara(c1,'x')
	# while(r1.run()):
	# 	w.delete("all")
	# 	a=int(float(c1.getCenter().x))
	# 	b=int(float(c1.getCenter().y))
	# 	r=int(float(c1.getRadius()))
	# 	draw(['circle', a, b, r])
	w.after(1000, delete)

	# w.create_line(0, 100, 200, 0, fill="red", dash=(4, 4))

	# w.create_rectangle(50, 25, 150, 75, fill="blue")
	# w.delete("all")

	mainloop()
	return True
