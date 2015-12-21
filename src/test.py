from sysgeo import *
import Tkinter as tk
root = tk.Tk()
root.title("Geo")
msg = tk.Listbox(root, width=50, height=10)
msg.grid(row=0, column=0)
def gcd(a, b):
	if (a < b):
		return gcd(b, a)
	else:
		if (a == b):
			return a
		else:
			return gcd((a - b), b)
msg.insert(tk.END,gcd(70, 28))
root.mainloop()
