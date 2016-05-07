from Tkinter import *
from sysgeo import *
def test1(str):
	if (str == "PLT"):
		return True
	else:
		return False
def test2():
	if test1("PLT"):
		print "is PLT"
	else:
		print "is not PLT"
PI = 3.14159265359
test2()

