@panel fib
function fib(x:int):int:
	if (x == 1):
		return(1);
	else:
		if (x == 2):
			return(1);
		else:
			return(fib(x-1)+fib(x-2));
		end
	end
end
i = 1;
while (i < 10):
	print(fib(i));
	i = i+1;
end
@end