zID = [1, 8, 7, 5, 1, 10, 1]

A = zID(2)
B = zID(3)
C = zID(4)
D = zID(5)
E = zID(6)
F = zID(7)

sol = []
sol2 = []
xInc = 0:.5:20
for index = [0:.5:20];
    d = sqrt(index^2+(1.75^2))
    sys = [-sin(20),1,0,-index/d,0,0,0;
        1.5*sind(20)-.75*cosd(20),0,0,(1+index)*1.75/d,0,0,5*(1+index);
        cosd(20),0,1,-1.75/d,0,0,5;
        1.5*sind(20)-.75*cosd(20),0,0,0,1.75,0,0;
        0,0,0,index/d,-1,0,0;
        0,0,0,1.75/d,0,-1,-5]
    sys = rref(sys)
    temp = sys(1,7)
    sol = [sol;temp]
end

plot(xInc,sol)
hold on

hold off