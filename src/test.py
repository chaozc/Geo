import Tkinter as tk
from sympy.geometry import *
root = tk.Tk()
root.title("Geo")
msg = tk.Listbox(root, width=50, height=10)
msg.grid(row=0, column=0)

a = 1. + 1.
msg.insert(tk.END,a)
a = -a - a - a - a
msg.insert(tk.END,-1.1 + 2. - 1. * a)
msg.insert(tk.END,not(True))
root.mainloop()
