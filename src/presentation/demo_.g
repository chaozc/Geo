@panel panel1
c1 = circle([0, 0], 2);
l1 = line([3,0],[4,1],0,5);
l2 = line([-3,-3],[-3,3],-5,5);
r1=runset(200,0.05);
r1.addPara(c1,'r');
r1.addPara(l1,'a');
r1.addPara(l2,'a');

run r1:
	li=c1.intersect(l1);
	li2=c1.intersect(l2);
	if(len(li) != 0):
		print("Get L1");
		print(li);
		print(l1);
	else:
		l1.rotateonPoint([3,0],PI/72);
	end
	if(len(li2) != 0):
		print("Get L2");
		print(li2);
		print(l1);
	else:
		l2.rotateonPoint([-3,0],PI/72);
	end
	if(len(li) != 0 & len(li2) != 0 ):
		r1.disableRun();
	end
end
@end