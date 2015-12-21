@panel gcd
function gcd(a:int, b:int):int:
	if (a<b):
		return (gcd(b,a));
	else:
		if (a == b):
			return (a);
		else:
			return(gcd(a-b, b));
		end
	end
end
print(gcd(70,28));
@end