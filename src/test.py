import Tkinter as tk
from sympy.geometry import *
root = tk.Tk()
root.title("Geo")
msg = tk.Listbox(root, width=50, height=10)
msg.grid(row=0, column=0)
def aaa(a):
	msg.insert(tk.END,1)
	msg.insert(tk.END,2)
	msg.insert(tk.END,2)
	msg.insert(tk.END,4)
	return (a - 4)
def distanc(a, b):
	msg.insert(tk.END,"hahaha")
	msg.insert(tk.END,(a - b))
	msg.insert(tk.END,"AAAAAA")
distanc(1, 2)
distanc(1, 2)
c = 0
msg.insert(tk.END,c)
msg.insert(tk.END,aaa(1))
z = [1, 1012, 47, [999]]
msg.insert(tk.END,z[3])
a = ((1 + 2) * (3 ** 5))
msg.insert(tk.END,a)
for i in [1, 2, 3]:
		msg.insert(tk.END,101)
root.mainloop()
