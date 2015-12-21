from sysgeo import *
import Tkinter as tk
root = tk.Tk()
root.title("Geo")
msg = tk.Listbox(root, width=50, height=10)
msg.grid(row=0, column=0)

a = 0
a = 1
b = [1, 3, 4]
msg.insert(tk.END,b[1])
b[1] = b[2]
msg.insert(tk.END,b[1])
c = polygon(1, 2, 3)
r = runset(1, 3, 5)
def runfun__():
	msg.insert(tk.END,"h")
	msg.insert(tk.END,"hh")
	break
	msg.insert(tk.END,"hhh")
drawmain(r)
root.mainloop()
