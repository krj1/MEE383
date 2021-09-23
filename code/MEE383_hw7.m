zID = [1, 8, 7, 5, 1, 10, 1]

A = zID(2)
B = zID(3)
C = zID(4)
D = zID(5)
E = zID(6)
F = zID(7)

sol = []
xInc = 0:5:250
for index = [0:5:250];
    d = sqrt(F^2+index^2+index^2)
    sys = [-1/(d), cos(120),1,0;2/(d),cos(135),0,0;2/(d),cos(60),0,(300*9.81)]
    sys = rref(sys)
    temp = sys(1,4)/1500
    sol = [sol;temp]
end

plot(sol,xInc)
