@panel qsort
function qsort(a:list, l:int, r:int):list:
	i = l;
	j = r;
	mid = (l+r)/2;
	
	while (i <= j):
		while (i <= j & a#[i] < a#[mid]):
			i = i+1;
		end
		while (i <= j & a#[j]> a#[mid]):
			j = j-1;
		end
		
		if (i <= j):
			k = a#[i];
			a#[i] = a#[j];
			a#[j] = k;
			i = i+1;
			j = j-1;
		end
		
	end


	if (l < j):
		a = qsort(a, l, j);
	end
	if (i < r):
		a = qsort(a, i, r);
	end
	return(a);
end
b = {3,7,8,32,1,4,7,9,2,5};
b = qsort(b, 0, len(b)-1);
print(b);
@end