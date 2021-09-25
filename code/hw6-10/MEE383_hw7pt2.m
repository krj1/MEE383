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
for index = (0:.5:20);
    d = sqrt(F^2+index^2+index^2)
    sys = [1,-1500,0,0,0;1,0,cosd(120),-F/d,0;0,0,cosd(135),index/d,0;0,0,cosd(60),index/d,300*9.81]
    sys = rref(sys)/200
    temp = sys(1,5)
    sol = [sol;temp]
end

for index = (0:.5:20);
    d = sqrt(F^2+index^2+(index*(1+5/E))^2)
    sys = [1,-1500,0,0,0;1,0,cosd(120),-F/d,0;0,0,cosd(135),index/d,0;0,0,cosd(60),(index*(1+5/E))/d,300*9.81]
    sys = rref(sys)
    temp = sys(1,5)/200
    sol2 = [sol2;temp]
end

plot(xInc,sol)
hold on
xlabel('mass(kg)')
ylabel('displacement of spring')
plot(xInc, sol2)
txt = {'Thus the first scenario has a larger effect'};

text(4,2,txt,'FontSize',14)
hold off
