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

