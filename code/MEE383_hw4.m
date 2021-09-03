zID = [1, 5, 3, 8, 10, 7, 8]

A = zID(2)
B = zID(3)
C = zID(4)
D = zID(5)
E = zID(6)
F = zID(7)

xInc = 0:.05:100 %I know that this is too many steps through the 
% derivative approximation gets really bad for large step sizes

Gt = -F*exp(-abs((xInc/E)-C)).*cos(((2*pi)/E)*(xInc-(B/10)))-A
GtPrime = diff(Gt)
GtPrime2 = diff(GtPrime)

i = 1
yMax = 0


while i < length(Gt)
i = i+1
    if Gt(i) > yMax
        yMax = Gt(i)
    end
end
iAmTooLazy = yMax * 0.44 - A

I = find(GtPrime2 >= 0 ) 

plot(xInc,Gt,'b')
hold on
plot(xInc(I),Gt(I),'kd','Markersize',6,'MarkerFaceColor','k')
hold off