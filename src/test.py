from sysgeo import *
import Tkinter as tk
root = tk.Tk()
root.title("Geo")
msg = tk.Listbox(root, width=50, height=10)
msg.grid(row=0, column=0)
def good(i):
	msg.insert(tk.END,1)
	msg.insert(tk.END,1)
	msg.insert(tk.END,1)
	if (i == 3):
		msg.insert(tk.END,i)
		msg.insert(tk.END,1)
		msg.insert(tk.END,1)
	else:
		msg.insert(tk.END,0)
		msg.insert(tk.END,1)
		msg.insert(tk.END,1)
	if (i == 7):
		msg.insert(tk.END,i)
		msg.insert(tk.END,1)
		msg.insert(tk.END,1)
	else:
		msg.insert(tk.END,0)
		msg.insert(tk.END,1)
		msg.insert(tk.END,1)
	msg.insert(tk.END,1)
	msg.insert(tk.END,1)
	msg.insert(tk.END,1)
	msg.insert(tk.END,1)
	return i
def bad(j):
	msg.insert(tk.END,j)
i = 9
j = 10
if (j == 7):
	msg.insert(tk.END,i)
	msg.insert(tk.END,1)
	msg.insert(tk.END,1)
	msg.insert(tk.END,bad(j))
else:
	msg.insert(tk.END,0)
	msg.insert(tk.END,1)
	msg.insert(tk.END,1)
	msg.insert(tk.END,bad(i))
root.mainloop()
