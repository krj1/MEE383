zID = [1, 9, 10, 9, 10, 10, 7]

A = zID(2)
B = zID(3)
C = zID(4)
D = zID(5)
E = zID(6)
F = zID(7)

xInc = -50:.01:50 %I know that this is too many steps through the 
% derivative approximation gets really bad for large step sizes

%Gt = A + (B*exp(-(abs(xInc/C)-D))) .* cos(((2*pi)/C)*(xInc-(E/10)))
-F*exp(-abs((xInc/E)-C)).*cos(((2*pi)/E)*(xInc-(B/10)))-A
GtPrime = diff(Gt)
GtPrime2 = diff(GtPrime)

i = 1
yMax = -A


while i < length(Gt)
i = i+1
    if Gt(i) > yMax
        yMax = Gt(i)
    end
end
maxAmp = max(Gt)
deltaY = yMax + A
maxVal = deltaY * .44 - A
minVal =  -A - deltaY * .44

I = find(GtPrime2 >= 0 & Gt(1:end-2) > maxVal) 
G = find(GtPrime2 >= 0 & Gt(1:end-2) < minVal)
plot(xInc,Gt,'b')
hold on
plot(xInc(I),Gt(I),'kd','Markersize',6,'MarkerFaceColor','k')
plot(xInc(G),Gt(G),'kd','Markersize',6,'MarkerFaceColor','k')
hold off