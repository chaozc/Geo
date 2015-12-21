from sysgeo import *
import Tkinter as tk
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
test2()

