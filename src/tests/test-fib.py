from Tkinter import *
from sysgeo import *
def fib(x):
	if (x == 1):
		return 1
	else:
		if (x == 2):
			return 1
		else:
			return (fib((x - 1)) + fib((x - 2)))
PI = 3.14159265359
i = 1
while ((i < 10)):
	print fib(i)
	i = (i + 1)

