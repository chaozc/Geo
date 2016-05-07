@panel panel1
a = 0;
a = 1;
b = {1,3,4};
print(b#[1]);
b#[1] = b#[2];
print(b#[1]);
c = polygon(1,2,3);
r = runset(1,3,5);
run r:
	print("h");
	print("hh");
	break;
	print("hhh");
end
@end