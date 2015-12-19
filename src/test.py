import Tkinter as tk
from sympy.geometry import *
root = tk.Tk()
root.title("Geo")
msg = tk.Listbox(root, width=50, height=10)
msg.grid(row=0, column=0)
def printa(a, b):
	msg.insert(tk.END,"hahaha")
	msg.insert(tk.END,a)
	msg.insert(tk.END,b)
	msg.insert(tk.END,"AAAAAA")
def printb(a, b):
	msg.insert(tk.END,"hahaha")
	msg.insert(tk.END,b)
	msg.insert(tk.END,a)
	msg.insert(tk.END,"AAAAAA")
msg.insert(tk.END,"hello world")
msg.insert(tk.END,'s')
msg.insert(tk.END,1 + 1)
i = 1
msg.insert(tk.END,i)
printa(1, 2)
printb(4, 3)
printa(1.2, i)
root.mainloop()
