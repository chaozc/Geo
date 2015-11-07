
@Panel panelDemo /* Define panel */
@Mode Console /* Mode choices: Console & Figure */
//@Co Cart /* Default: Cartesian coordinate system */

/* Dot definition */
dot1 = [2,3];
dot2 = [3,4];

/* Line definition */
1ine1 = Line(3,4); //Line(a,b) denotes the function y=ax+b
line2 = Line([0,0],[5,10]); //


/* Rectangle definition */
rect1 = Rect([2,5],3,5);

/* Circle definition */
circle1 = Circle([3,5],5);

/* Dot.Distance(Dot):Float or Dot.Distance(Line):Float */
/* Line.Intersect(Circle):Float */
/* Line.Expression:String Circle.Expression:String */

/* Console mode ONLY */
/* Println(String/Float/Int/Dot)*/
Println("Helloworld!");
Println(line1.Expression);
Println(circle1.Expression);
Println(dot1.Distance(dot2));

/* Panel Mode ONLY*/
Info.add("Distance1",dot1.Distance(circle1.Center),static);
Info.add("Length1",Length(line2,circle1),dynamic);


t1 = Timer(0.5);
t2 = Timer(1);

line1.AddTimer(t1,a);//y=ax+b
circle.AddTimer(t2,r);//(x-a)^2+(y-b)^2=r^2

/* Run line1 & circle1 20 times. Note that line1 & circle must both have a timer */
Run(20,line1,t1,circle1,t2): 
Println(line1.Expression);
Println(circle1.Expression);
/* Println function allows different data type in one function, divided by comma. The following example prints a string and float*/
Println("Intersection length: ",line1.IntersectLength(circle1));
End

If(line1.Intersect(circle1) > 0):
Println("Intersection");
Elif(line1.Intersect(circle1) == 0):
Println("Tangent");
Else:
Println("Neither intersection nor tangent");
End

@End Panel