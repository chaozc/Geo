@panel panel1
dot1=[3,5];
circle1=circle([3,5],5);
circle2=circle([0,0],5);
printT(circle1);
printT(circle2);
printT(circle2.intersect(circle1));
printT(circle2.intersect(line([0,2],[1,2])));
printT(circle2.intersect(line([0,2],[1,2],-1,1)));
printT(circle2.intersect(line([0,-2],[0,2])));
printT(circle2.intersect(line([0,-2],[0,2],0,0)));
printT(circle1.getRadius());
printT(circle2.getCenter());
circle1.setCenter([2,2]);
printT(circle1);
circle2.setRadius(3);
printT(circle2);
printT(circle2.getPointbyarc(PI/4));
// r1=runset(5,0.1);
// circle1.setRunstep('x',1);
// circle1.setRunstep('y',-1);
// circle2.setRunstep('r',1);
// printT(circle1.getRunstep('x'));
// r1.addPara(circle1,'x');
// r1.addPara(circle1,'y');
// r1.addPara(circle2,'r');
// run r1:
// printT(circle1);
// printT(circle2);
//end
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