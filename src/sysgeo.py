from sympy.geometry import *
from math import sqrt,pi

PI = pi

class dot(Point):
	def __init__(self,x,y=None):
		if(isinstance(x,Point) and (y is None)):
			Point.__init__(self,x.x,x.y)
		else:
			Point.__init__(self,x,y)
		self.runStep = [0,0]
	def __str__(self):
		retstr = '['+str(self.x)+','+str(self.y)+']'
		return retstr
	__repr__ = __str__
	def getX(self):
		return self.x
	def getY(self):
		return self.y
	def setRunstep(self,pos,val):
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
	def distance(self,adot):
		return float(Point.distance(self,adot))

class line(object):
	def __init__(self,a,b,end_point_1=None,end_point_2=None):
		if(end_point_1 is None):
			if(isinstance(a,Point)):
				self.a = float(b.y - a.y)/(b.x-a.x)
				self.b = float(a.y) - self.a * a.x
				self.line_=Line(a,b)
			else:
				self.a = float(a)
				self.b = float(b)
				self.line_=Line(Point(0,self.b), Point(1, self.a+self.b))
			self.isLine = True
		else:
			if(isinstance(a,Point)):
				self.a = float(b.y - a.y) / (b.x - a.x)
				self.b = float(a.y) - self.a * a.x
			else:
				self.a = float(a)
				self.b = float(b)
			self.line_=Segment(Point(end_point_1, self.a * end_point_1 + self.b), Point(end_point_2, self.a * end_point_2 + self.b)) 
			self.isLine = False
			self.end_point_1=min(end_point_1,end_point_2)
			self.end_point_2=max(end_point_1,end_point_2)
		self.runStep = [0,0,0]
	def __str__(self):
		if(self.isLine):
			retstr = 'line y='+str(self.a)+'x+'+str(self.b)
		else:
			retstr = 'Segment y='+str(self.a)+'x+'+str(self.b)+' with x in ['+str(self.end_point_1)+','+str(self.end_point_2)+']'
		return retstr
	__repr__ = __str__
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
		elif(pos == 'x'):
			self.runStep[2]=val
	def getRunstep(self,pos):
		if(pos == 'a'):
			return self.runStep[0]
		elif(pos == 'b'):
			return self.runStep[1]
		elif(pos == 'x'):
			return self.runStep[2]
	def renew(self,pos):
		if(pos == 'a'):
			self.a = self.a + self.runStep[0]
		elif(pos == 'b'):
			self.b = self.b + self.runStep[1]
		elif(pos == 'x'):
			self.b = self.b - self.runStep[2]*self.a #!!!!!! 
		if(self.isLine):
			self.line_=Line(Point(0,self.b), Point(1, self.a+self.b))
		else:
			if(pos == 'a'):
				dotM = self.getMidpoint()
				templine = line(self.a, self.b)
				self.end_point_1 = float(templine.pointAway(dotM,-self.line_.length/2).x)
				self.end_point_2 = float(templine.pointAway(dotM, self.line_.length/2).x)
			if(pose == 'x'):
				self.end_point_1 = self.end_point_1 + self.runStep[2]
				self.end_point_2 = self.end_point_2 + self.runStep[2]
			self.line_=Segment(Point(self.end_point_1, self.a * self.end_point_1 + self.b), Point(self.end_point_2, self.a * self.end_point_2 + self.b)) 
	def getY(self,x):
		if(self.isLine or self.line_.contains(Point(x,x*self.x+self.y))):
			return self.a*x+self.b
		else:
			return None
	def getX(self,y):
		if(self.isLine or self.line_.contains(Point((y-self.b)/self.a,y))):
			return (y-self.b)/self.a
		else:
			return None
	def contains(self,p):
		return self.line_.contains(p)
	def getMidpoint(self):	# Segment ONLY
		if(self.isLine):
			return dot(0,0)
		else:
			return dot(self.line_.midpoint)
	def length(self):	# Segment ONLY
		if(self.isLine):
			return 0
		else:
			return float(self.line_.length)
	def distance(self,p):
		if(isinstance(p,Point)):
			return float(self.line_.distance(p))
		else:
			return None
	def pointAway(self,p,dis):
		deltax = sqrt((dis**2)/(self.a**2+1))
		if(dis < 0):
			deltax=-deltax
		finalx=p.x+deltax
		finaly=self.getY(finalx)
		if(self.isLine or self.line_.contains(Point(finalx,finaly))):
			return dot(finalx,finaly)
		else:
			return None
	def isParallel(self,aline):
		if(isinstance(a,Line)):
			return Line.is_parallel(self.line_, aline)
		elif(isinstance(a,line)):
			return Line.is_parallel(self.line_, aline.line_)
		return None
	def intersect(self, geo_object):
		if(isinstance(a,line.LinearEntity) or isinstance(a,Point)):
			return self.line_.intersection(geo_object)
		elif(isinstance(a,line)):
			return self.line_.intersection(geo_object.line_)
		return None

class circle(object):
	def __init__(self,a,b):
		if(isinstance(a,Point)):
			self.center = a
			self.radius = float(b)
			self.circle_=Circle(a,float(b))
		self.runStep=[0,0,0]
	def __str__(self):
		retstr = 'circle '+str(self.radius)+'^2=(x-'+str(self.center.x)+')^2+(y-'+str(self.center.y)+')^2'
		return retstr
	__repr__ = __str__
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
	def renew(self,pos):
		if(pos == 'x'):
			x = self.center.x + self.runStep[0]
			self.center = dot(x,self.center.y)
		elif(pos == 'y'):
			y = self.center.y + self.runStep[1]
			self.center = dot(x,self.center.y)
		elif(pos == 'r'):
			self.radius = self.radius + self.runStep[2]
		self.circle_ = Circle(self.center,self.radius)

class runset:
	def __init__(self,runtime):
		self.objlist = []
		self.paralist = []
		self.runtime = runtime
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
		runenable=True
	def disableRun(self):
		runenable=False
	def run(self):
		if(self.runenable and (self.runtime != 0)):
			self.renew()
			self.runtime=self.runtime-1
			return True
		else:
			return False
