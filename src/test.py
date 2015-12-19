import Tkinter as tk
from sympy.geometry import *
root = tk.Tk()
root.title("Geo")
msg = tk.Listbox(root, width=50, height=10)
msg.grid(row=0, column=0)

pt = dot(1,3)
pt.distance(dot(3,5))
root.mainloop()
