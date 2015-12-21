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

