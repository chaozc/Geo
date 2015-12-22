from Tkinter import *
from sysgeo import *
def gcd(a, b):
	if (a < b):
		return gcd(b, a)
	else:
		if (a == b):
			return a
		else:
			return gcd((a - b), b)
PI = 3.14159265359
print gcd(70, 28)
print gcd(147, 21)

