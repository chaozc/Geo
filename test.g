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

@end