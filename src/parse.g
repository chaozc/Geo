@panel panel1

function good(i:int):int:
print(1);print(1);print(1);
if (i == 3):
print(i);print(1);print(1);
else:
print(0);print(1);print(1);
end
if (i == 7):
print(i);print(1);print(1);
else:
print(0);print(1);print(1);
end
print(1);
print(1);print(1);print(1);
return (i);
end

function bad(j:int):int:
print(j);
end
i = 9;
j = 10;
if (j == 7):
print(i);print(1);print(1); print(bad(j));
else:
print(0);print(1);print(1); print(bad(i));
end
@end