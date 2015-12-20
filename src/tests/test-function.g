@panel panel1
function test1(str:string):bool:
if(str=="PLT"):
return true;
end
return false;
end

function test2():void:
if(test1("PLT")):
printT("is PLT");
end
printT("is not PLT");
end
test2();
@end