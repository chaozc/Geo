from Tkinter import *
from sysgeo import *

PI = 3.14159265359
li = [dot(0, 0), dot(5, 0), dot(5, 3), dot(0, 3)]
l2 = [dot(0, 0), dot(2, 2), dot(0, 4), dot(-2, 2)]
p1 = polygon(li)
p2 = polygon(l2)
print p1
print p1.getPoints()
print p1.getArea()
print p1.getAngle()
print p1.getParimeter()
print p1.getCentroid()
print p1.getSides()
print p1.intersect(dot(5, 6))
print p1.intersect(line(dot(0, 0), dot(2, 2)))
print p1.intersect(circle(dot(0, 0), 3))
print p1.intersect(p2)

