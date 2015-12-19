from sympy.geometry import *

class dot(Point):
	def __init__(self,p):
		if(isinstance(p,Point)):
			Point.__init__(self,p.x,p.y)
		self.runStep = [0,0]
	def __init__(self,x,y):
		Point.__init__(self,x,y)
		self.runStep = [0,0]
	def getX(self):
		return self.x
	def getY(self):
		return self.y
	def setRunstep(self,val,pos):
		if(pos == 'x'):
			self.runStep[0]=val
		elif(pos == 'y'):
			self.runStep[1]=val
	def getRunstep(self,pos):
		if(pos == 'x'):
			return self.runStep[0]
		elif(pos == 'y'):
			return self.runStep[1]
	def renew(self,pos):
		if(pos == 'x'):
			self.x = self.x + self.runStep[0]
		elif(pos == 'y'):
			self.y = self.y + self.runStep[1]

class line(object):
	def __init__(self,a,b):
		if(isinstance(a,Point)):
			self.a = float(b.y - a.y)/(b.x-a.x)
			self.b = float(a.y) - self.a * a.x
			self.line_=Line(self,a,b)
		else:
			self.a = float(a)
			self.b = float(b)
			self.line_=Line((self,Point(0,b), Point(1, a+b)))
		self.isLine = True
		self.runStep = [0,0]
	def __init__(self,a,b,end_point_1,end_point_2):
		if(isinstance(a,Point)):
			self.a = float(b.y - a.y) / (b.x - a.x)
			self.b = float(a.y) - self.a * a.x
		else:
			self.a = float(a)
			self.b = float(b)
		self.line_=Segment(Point(end_point_1, self.a * end_point_1 + self.b), Point(end_point_2, self.a * end_point_2 + self.b)) 
		self.isLine=False
		self.runStep = [0,0]
	def getPara(self,pos):
		if (pos == 'a'):
			return self.a
		elif (pos == 'b'):
			return self.b
	def setRunstep(self,pos,val):
		if(pos == 'a'):
			self.runStep[0]=val
		elif(pos == 'b'):
			self.runStep[1]=val
	def getRunstep(self,pos):
		if(pos == 'a'):
			return self.runStep[0]
		elif(pos == 'b'):
			return self.runStep[1]
	def renew(self,pos):
		if(pos == 'a'):
			self.a = self.a + self.runStep[0]
			self.b = self.b
		elif(pos == 'b'):
			self.a = self.a
			self.b = self.b + self.runStep[1]
		if(isLine):
			self.line_=Line(self,a,b)
		else:
			dotM = self.line_.getMidpoint()
			templine = Line(self,a,b)
			end_point_1 = templine.pointAway(dotM,-self.line_.length/2)
			end_point_2 = templine.pointAway(dotM, self.line_.length/2)
			self.line_=Segment(Point(end_point_1, self.a * end_point_1 + self.b), Point(end_point_2, self.a * end_point_2 + self.b)) 
	def getY(self,x):
		if(isLine or self.line_.contains(Point(x,x*self.x+self.y))):
			return self.a*x+self.b
		else:
			return None
	def getX(self,y):
		if(isLine or self.line_.contains(Point((y-self.b)/self.a,y))):
			return (y-self.b)/self.a
		else:
			return None
	def contains(self,p):
		return self.line_.contains(p)
	def getMidpoint(self):	# Segment ONLY
		if(isLine):
			return dot(0,0)
		else:
			return dot(self.line_.midpoint)
	def length(self):	# Segment ONLY
		if(isLine):
			return 0
		else:
			return float(self.line_.length)
	def distance(self,p):
		if(isinstance(p,Point)):
			return self.line_.distance(p)
		else:
			return None
	def pointAway(self,p,dis):
		deltax = sqrt((dis**2)/(self.a**2+1))
		if(dis < 0):
			deltax=-deltax
		finalx=p.x+deltax
		finaly=getY(self,finalx)
		if(isLine or self.line_.contains(Point(finalx,finaly))):
			return dot(finalx,finaly)
		else:
			return None

class circle(object):
	def __init__(self,a,b):
		if(isinstance(a,Point)):
			self.center = a
			self.radius = float(b)
			self.circle_=Circle(self,a,float(b))
		self.runStep=[0,0,0]
	def getCenter(self):
		return self.center
	def getRadius(self):
		return self.radius
	def setRunstep(self,pos,val):
		if(pos == 'x'):
			self.runStep[0]=val
		elif(pos == 'y'):
			self.runStep[1]=val
		elif(pos == 'r'):
			self.runStep[2]=val
	def getRunstep(self,pos):
		if(pos == 'x'):
			return self.runStep[0]
		elif(pos == 'y'):
			return self.runStep[1]
		elif(pos == 'r'):
			return self.runStep[2]



class runset:
	def __init__(self,runtime):
		self.objlist = []
		self.paralist = []
		self.runs = runtime
		self.runenable = False
	def addpara(self,obj,para):
		self.objlist.append(obj)
		self.paralist.append(para)
	def renew(self):
		index=0
		for obj in self.objlist:
			obj.renew(self.paralist[index])
			index = index + 1
	def enableRun(self):
		enableRun=True
	def disableRun(self):
		enableRun=False
	def run():
		if(runenable and (runtime != 0)):
			renew()
			return True
		else:
			return False
