import Tkinter as tk
from sysgeo import *
def test1(str):
	if (str == "PLT"):
		return True
	return False
def test2():
	if test1("PLT"):
		print "is PLT"
	print "is not PLT"
PI = 3.14159265359
test2()

