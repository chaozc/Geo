@panel panel1
c1 = circle([0, 0], 2);
c2 = circle([2, 0], 2);
l1 = line([2,-4],[2,4],0,0);
l2 = line([-2,0],[6,0],-2,6);
r1=runset(360,0.05);
r1.addPara(c1,'r');
r1.addPara(c2,'r');
r1.addPara(l1,'b');
r1.addPara(l2,'b');

run r1:
	p1 = c1.getPointbyarc(r1.getRuncount()*PI/(-36));
	print(p1);
	l1.rotateonPoint(p1,PI/36);
	l2.rotateonPoint(p1,PI/36);
	c2.setCenter(p1);
	t1=l1.getEndpoints();
	r1.mark(t1#[0]);
	r1.mark(t1#[1]);
	t1=l2.getEndpoints();
	r1.mark(t1#[0]);
	r1.mark(t1#[1]);
end
@end