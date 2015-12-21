from sysgeo import *
import Tkinter as tk
root = tk.Tk()
root.title("Geo")
msg = tk.Listbox(root, width=50, height=10)
msg.grid(row=0, column=0)

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
r1 = runset(5, 0.1)
circle1.setRunstep('x', 1)
circle1.setRunstep('y', -1)
circle2.setRunstep('r', 1)
print circle1.getRunstep('x')
r1.addPara(circle1, 'x')
r1.addPara(circle1, 'y')
r1.addPara(circle2, 'r')
while (r1.run()):
	print circle1
	print circle2
root.mainloop()
