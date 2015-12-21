from Tkinter import *
from sysgeo import *
def qsort(a, l, r):
	i = l
	j = r
	mid = ((l + r) / 2)
	while ((i <= j)):
		while (((i <= j) and (a[i] < a[mid]))):
			i = (i + 1)
		while (((i <= j) and (a[j] > a[mid]))):
			j = (j - 1)
		if (i <= j):
			k = a[i]
			a[i] = a[j]
			a[j] = k
			i = (i + 1)
			j = (j - 1)
	if (l < j):
		a = qsort(a, l, j)
	if (i < r):
		a = qsort(a, i, r)
	return a
PI = 3.14159265359
b = [3, 7, 8, 32, 1, 4, 7, 9, 2, 5]
b = qsort(b, 0, (len(b) - 1))
print b

