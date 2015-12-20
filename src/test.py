from sysgeo import *
import Tkinter as tk
from sympy.geometry import *
root = tk.Tk()
root.title("Geo")
msg = tk.Listbox(root, width=50, height=10)
msg.grid(row=0, column=0)

msg.insert(tk.END,1)
msg.insert(tk.END,2)
msg.insert(tk.END,3)
msg.insert(tk.END,4)
for i in [5, 6, 7]:
	for j in [10, 20, 30]:
		msg.insert(tk.END,(i * j))
while ((i < 10)):
	i = (i + 1)
	msg.insert(tk.END,i)
if (i > 1):
	msg.insert(tk.END,(i + 1))
else:
	msg.insert(tk.END,"aaaaa")
	a = dot(1, 3)
	b = line(1, 3)
	c = circle(1, 4)
	d = runset(1, 3)
	while (d.run()):
		msg.insert(tk.END,"hahah")
		msg.insert(tk.END,"ddd")
root.mainloop()
