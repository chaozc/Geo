from sysgeo import *
import Tkinter as tk

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
print line4.length()
print line2.pointAway(dot(2, 3), 5)
print line4.pointAway(dot(0, 0), 1)

