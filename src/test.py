import Tkinter as tk
root = tk.Tk()
root.title("Geo")
msg = tk.Listbox(root, width=50, height=10)
msg.grid(row=0, column=0)
def printa(a, b):
 msg.insert(tk.END,"startwhile")
 while (a > 0):
  while (b > 0):
   msg.insert(tk.END,b)
   b = b - 1
  msg.insert(tk.END,a)
  a = a - 1
 msg.insert(tk.END,"endwhile")
 if a > 0:
  a = a + 1
 else:
  a = a - 1
 msg.insert(tk.END,a)
 for i in "hello":
  msg.insert(tk.END,i)
msg.insert(tk.END,"hello world")
msg.insert(tk.END,'s')
msg.insert(tk.END,1 + 1)
printa(4, 4)
root.mainloop()
