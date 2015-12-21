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
//printT(line3.distance(dot1));
printT(line4.length());
printT(line2.pointAway([2,3],5));
printT(line4.pointAway([0,0],1));
@end