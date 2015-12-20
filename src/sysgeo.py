from sympy.geometry import *
from sympy.geometry.line import LinearEntity
from time import sleep
from math import sqrt,pi,cos,sin,tan

PI = pi

class dot(Point):
	def __init__(self,x,y=None):
		if(isinstance(x,Point) and (y is None)):
			Point.__init__(self,x.x,x.y)
		else:
			Point.__init__(self,x,y)
		self.runStep = [0,0]
	def __str__(self):
		x = "%.5f" % float(self.x)
		y = "%.5f" % float(self.y)
		retstr = '['+x+','+y+']'
		return retstr
	__repr__ = __str__
	def getX(self):
		return self.x
	def getY(self):
		return self.y
	def getRunstep(self,pos):
		if(pos == 'x'):
			return self.runStep[0]
		elif(pos == 'y'):
			return self.runStep[1]
	def setRunstep(self,pos,val):
		if(pos == 'x'):
			self.runStep[0]=val
		elif(pos == 'y'):
			self.runStep[1]=val
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
			self.isLine = True
			if(isinstance(a,Point)):
				if(b.x!=a.x):
					self.a = float(b.y - a.y)/(b.x-a.x)
					self.b = float(a.y) - self.a * a.x
					self.line_=Line(a,b)
				else:
					self.a=float('inf')
					self.b=float('inf')
					self.line_=Line(a, b)
			else:
				self.a = float(a)
				self.b = float(b)
				if(a!=float('inf')):
					self.line_=Line(Point(0,self.b), Point(1, self.a+self.b))
				else:
					self.line_=Line(Point(0,0), Point(0,1))
		else:
			self.isLine = False
			if(isinstance(a,Point)):
				if(b.x!=a.x):
					self.a = float(b.y - a.y) / (b.x - a.x)
					self.b = float(a.y) - self.a * a.x
					self.line_=Segment(Point(end_point_1, self.a * end_point_1 + self.b), Point(end_point_2, self.a * end_point_2 + self.b)) 
				else:
					self.a = float('inf')
					self.b = float('inf')
					self.line_=Segment(Point(a.x,a.y), Point(a.x,b.y))
			else:
				self.a = float(a)
				self.b = float(b)
				self.line_=Segment(Point(end_point_1, self.a * end_point_1 + self.b), Point(end_point_2, self.a * end_point_2 + self.b)) 
			if(b.x!=a.x):
				self.end_point_1=min(end_point_1,end_point_2)
				self.end_point_2=max(end_point_1,end_point_2)
			else:
				self.end_point_1=self.end_point_2=a.x
		self.runStep = [0,0,0]
	def __str__(self):
		a = "%.5f" % self.a
		b = "%.5f" % self.b
		if(self.isLine):
			retstr = 'line y='+a+'x+'+b
		else:
			end_point_1= "%.5f" % float(self.end_point_1)
			end_point_2= "%.5f" % float(self.end_point_2)
			retstr = 'Segment y='+a+'x+'+b+' with x in ['+end_point_1+','+end_point_2+']'
		return retstr
	__repr__ = __str__
	def getPara(self,pos):
		if (pos == 'a'):
			return self.a
		elif (pos == 'b'):
			return self.b
	def setPara(self,pos,val):
		if (pos == 'a'):
			self.a = a
		elif (pos == 'b'):
			self.b = b
		elif (pos == 'left_end'):
			self.end_point_1 = val
		elif (pos == 'right_end'):
			self.end_point_2 = val
		if (self.isLine):
			self.line_=Line(Point(0,self.b), Point(1, self.a+self.b))
		else:
			self.line_=Segment(Point(self.end_point_1, self.a * self.end_point_1 + self.b), Point(self.end_point_2, self.a * self.end_point_2 + self.b))
	# def setparaYline(self,p1):
	# 	if(isinstance(p1,Point)):
	# 		self.line_=Line(Point(p1.x,0),Point(p1.x,1))
	# 		self.a=float('inf')
	# 		self.a=float('inf')
	# def setparaYsegm(self,p1,p2):
	# 	if(isinstance(p1,Point) and isinstance(p2,Point)):
	# 		self.line_=Segment(p1,p2)
	# 		self.a=float('inf')
	# 		self.a=float('inf')
	# 		self.end_point_1=min(p1.x,p2.x)
	# 		self.end_point_2=max(p1.x,p2.x)
	def rotateonPoint(self,p,arc):
		#print arc
		if(arc<0):
			arc = arc % pi - pi
		else:
			arc = arc % pi
		#arc = arc % pi
		if(abs(abs(arc)-(pi/2))<0.00001):
			if(self.a==float('inf')):
				self.a=0
			elif(self.a==0):
				self.a=float('inf')
			else:
				self.a=-1/self.a
		elif(self.a==float('inf')):
			if(arc != 0):
				#print 'mark 1'
				self.a = tan(pi/2 + arc)
		else:
			if(abs(1-self.a*tan(arc))<0.00001):
				#print 'mark 4'
				self.a = float('inf')
			else:
				#print 'mark 2'
				self.a = (self.a+tan(arc))/(1-self.a*tan(arc))
		if(abs(self.a)<0.00001):
			self.a=0
		if(self.a == float('inf')):
			self.b=float('inf')
			if(self.isLine):
				self.line_ = Line(Point(p.x,0),Point(p.x,1))
			else:
				half = float(self.line_.length/2)
				self.end_point_1=self.end_point_2=float(p.x)
				self.line_=Segment(Point(p.x,p.y+half),Point(p.x,p.y-half))
		else:
			#print 'mark 3'
			#print self.a
			self.b = p.y-float(self.a)*p.x
			#print self.b
			if(abs(self.b)<0.00001):
				self.b=0
			if(self.isLine):
				self.line_= Line(p,slope=self.a)
			else:
				templine = line(self.a,self.b)
				half = float(self.line_.length/2)
				p1=templine.pointAway(p,-half)
				p2=templine.pointAway(p,half)
				self.end_point_1=float(min(p1.x,p2.x))
				self.end_point_2=float(max(p1.x,p2.x))
				self.line_=Segment(p1,p2)
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
		if(self.a == float('inf')):
			return None
		if(self.isLine or self.line_.contains(Point(x,float(self.a*x)+self.b))):
			return self.a*x+self.b
		else:
			return None
	def getX(self,y):
		if(self.a == float('inf')):
			return line_.points[0].x
		if(self.isLine or self.line_.contains(Point((y-self.b)/self.a,y))):
			return (y-self.b)/self.a
		else:
			return None
	def contains(self,p):
		if(isinstance(p,Point)):
			return self.line_.contains(p)
		else:
			return None
	def getMidpoint(self):	# Segment ONLY
		if(self.isLine):
			return dot(0,0)
		else:
			return dot(self.line_.midpoint)
	def getEndpoints(self):
		if(isLine):
			return None
		else:
			return list(self.line_.points)
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
		finalx=p.x+float(deltax)
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
		if(isinstance(geo_object,LinearEntity) or isinstance(geo_object,Point)):
			tem = self.line_.intersection(geo_object)
			if(len(tem)>0):
				temp=[]
				for i in tem:
					if(isinstance(i,Point)):
						temp.append(dot(i))
					elif(isinstance(i,Line)):
						t = i.points
						temp.append(line(t[0],t[1]))
					elif(isinstance(i,Segment)):
						t = i.points
						temp.append(line(t[0],t[1],t[0].x,t[1].x))
				tem=temp
			return tem
		elif(isinstance(geo_object,line)):
			tem = self.line_.intersection(geo_object.line_)
			if(len(tem)>0):
				temp=[]
				for i in tem:
					if(isinstance(i,Point)):
						temp.append(dot(i))
					elif(isinstance(i,Line)):
						t = i.points
						temp.append(line(t[0],t[1]))
					elif(isinstance(i,Segment)):
						t = i.points
						temp.append(line(t[0],t[1],t[0].x,t[1].x))
				tem=temp
			return tem
		else:
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
		return self
	def setCenter(self,a):
		if(isinstance(a,Point)):
			self.center = a
			self.circle_=Circle(self.center,self.radius)
	def setRadius(self,r):
		self.radius=r
		self.circle_=Circle(self.center,self.radius)
	def setRunstep(self,pos,val):
		if(pos == 'x'):
			self.runStep[0]=val
		elif(pos == 'y'):
			self.runStep[1]=val
		elif(pos == 'r'):
			self.runStep[2]=val
	def getPointbyarc(self,arc):
		finalx = float(self.center.x + self.radius * cos(arc))
		finaly = float(self.center.y + self.radius * sin(arc))
		return dot(finalx,finaly)
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
	def intersect(self, geo_object):
		if(not (isinstance(geo_object,GeometryEntity) or isinstance(geo_object,line) or isinstance(geo_object,circle))):
			return None
		if(isinstance(geo_object,GeometryEntity)):
			tem = self.circle_.intersection(geo_object)
		elif(isinstance(geo_object,line)):
			tem = self.circle_.intersection(geo_object.line_)
		elif(isinstance(geo_object,circle)):
			tem = self.circle_.intersection(geo_object.circle_)
		if(isinstance(tem,Circle)):
			return circle(tem.center,tem.radius)
		if(len(tem)>0):
			temp=[]
			for i in tem:
				if(isinstance(i,Point)):
					temp.append(dot(i))
				elif(isinstance(i,Line)):
					t = i.points
					temp.append(line(t[0],t[1]))
				elif(isinstance(i,Segment)):
					t = i.points
					temp.append(line(t[0],t[1],t[0].x,t[1].x))
				elif(isinstance(i,Circle)):
					temp.append(circle(i.center,i.radius))
			tem=temp
		return tem

class polygon(object):
	def __init__(self, a):
		self.allpoints = a
		self.polygon_ = Polygon(*a)
		self.runStep = [0,0]
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
	def getPoints(self):
		return self.allpoints
	def getArea(self):
		return self.polygon_.area()
	def getAngle(self):
		return self.polygon_.angles()
	def getParimeter(self):
		return self.polygon_.perimeter()
	def getCentroid(self):
		return dot(self.polygon_.centroid())
	def getSides(self):
		return self.polygon_.sides()
	def intersect(self,obj):
		olist = intersection(self, obj)
		temp = []
		for o in olist:
			if(isinstance(o,Segment)):
				endpoints = o.points
				temp.append(line(endpoints[0],endpoints[1],endpoints[0].x,endpoints[1].x))
			elif(isinstance(o,Point)):
				temp.append(dot(o.x,o.y))
		return temp
	def renew(self,pos):
		if(pos == 'x'):
			for i in self.allpoints:
				i.x = i.x + self.runStep[0]
		elif(pos == 'y'):
			for i in self.allpoints:
				y = self.center.y + self.runStep[1]
		self.polygon_ = Polygon(*self.allpoints)


class runset:
	def __init__(self,runtime,sleeptime=None):
		self.objlist = []
		self.paralist = []
		self.runtime = runtime
		self.runenable = False
		if(sleeptime is None):
			self.sleeptime=0.5
		else:
			self.sleeptime = sleeptime
	def addPara(self,obj,para):
		self.objlist.append(obj)
		self.paralist.append(para)
		return True
	def removePara(self,obj,para):
		count=0
		while(count<len(objlist)):
			if(self.objlist[count] == obj and self.paralist[count] == para):
				del self.objlist[count]
				del self.paralist[count]
				return True
		return False
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
		sleep(self.sleeptime)
		if(self.runenable and (self.runtime != 0)):
			self.renew()
			self.runtime=self.runtime-1
			return True
		else:
			return False
