@panel panel1
li={[0,0],[5,0],[5,3],[0,3]};
l2={[0,0],[2,2],[0,4],[-2,2]};
p1=polygon(li);
p2=polygon(l2);
print(p1);
print(p1.getPoints());
print(p1.getArea());
print(p1.getAngle());
print(p1.getParimeter());
print(p1.getCentroid());
print(p1.getSides());
print(p1.intersect([5,6]));
print(p1.intersect(line([0,0],[2,2])));
print(p1.intersect(circle([0,0],3)));
@end

/*
r1=runset(5,0.1);
circle1.addRunstep('x',1);
circle1.addRunstep('y',-1);
circle2.addRunstep('r',1);
printT(circle1.getRunstep());
r1.addPara(circle1,'x');
r1.addPara(circle1,'y');
r1.addPara(circle2,'r');
run r1:
printT(circle1);
printT(circle2);
end
*/