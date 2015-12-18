@panel panel1
print("hello world");
print('s');
print(1+1);

function printa(a:int, b:int):void:

 print("startwhile");
 while (a>0):
  while (b>0):
   print(b);
   b = b-1;
  end
  print(a);
  a = a-1;
 end
 print("endwhile");

 if(a>0):
  a = a + 1;
 else:
  a = a - 1;
 end
 
 print(a);

 for i in "hello":
  print(i);
 end

end

printa(4,4);
printT ("!23");

pt = [1.1, 2.1];
pt = [2.4+1, 2];
pt = [0, 2.3];
pt = [3.3, 2];
print (pt.x);
l = line(pt, [10,10]);
cc = circle(pt, 10);
a = {1, {3, 5}};
i = 5; j = 3;
while (!(i == 0 | j == 0)):
i = i-1; j= j-1;
print (i+j);
end
@end