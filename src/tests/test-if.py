from sysgeo import *
import Tkinter as tk
root = tk.Tk()
root.title("Geo")
msg = tk.Listbox(root, width=50, height=10)
msg.grid(row=0, column=0)

if (5 == 3):
	print "5==3"
else:
	print "5>3"
root.mainloop()
