@panel panel1


function test1(str:string):bool:
if(str=="PLT"):
return true;
else:
//end
return false;
end
end

function test2():void:
if(test1("PLT")):
printT("is PLT");
else:
printT("is not PLT");
end
end
test2();
@end

/*

function test1(str:string):bool:
if(str=="PLT"):
return true;
//else:
end
return false;
//end
end

function test2():void:
if(test1("PLT")):
printT("is PLT");
//else:
end
printT("is not PLT");
//end
end
test2();

*/