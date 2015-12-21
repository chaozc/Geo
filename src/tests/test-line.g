@panel panel1
dot1=[3,5];
line1=line(4,5);
line2=line([1,2],[2,3]);
line3=line(4,5,-5,5);
line4=line([0,-2],[0,2],0,0);
printT(line1);
printT(line2);
printT(line3);
printT(line4);
printT(line2.intersect(line4));
printT(line3.distance(dot1));
printT(line4.length());
printT(line2.pointAway([2,3],5));
printT(line4.pointAway([0,0],1));
printT(line3.getEndpoints());
printT(line3.getMidpoint());
printT(line1.isParallel(line2));
printT(line1.getX(5));
printT(line4.getX(1));
printT(line2.getY(0));
line2.setRunstep('a',0.5);
line3.setRunstep('b',1.0);
line3.setRunstep('x',1.0);
// r1=runset(8,0.1);
// r1.addPara(line2,'a');
// r1.addPara(line3,'b');
// r1.addPara(line3,'x');
// run r1:
// printT(line2);
// printT(line3);
// printT(line4);
// line4.rotateonPoint([0,0],PI/4);
// end
@end