axis equal
zID = [1, 8, 7, 5, 1, 10, 1]

A = zID(2)
B = zID(3)
C = zID(4)
D = zID(5)
E = zID(6)
F = zID(7)

r = (100 + (10*8) + 7) / 255;
g = (100 + (10*5) + 1) / 255;
b = (100 + (10*10) + 1) / 255;

plot(circle(0,0,3))
plot(minuteHand(pi/4))

function temp = circle(x,y,r)
hold on
th = 0:pi/50:2*pi;
xdem = r * cos(th) + x;
ydem = r * sin(th) + y;
temp = plot(xdem, ydem,'-','Color',[0.7333,0.5922,0.7882],'LineWidth',3.5);
ylim([-5,5])
xlim([-5,5])
hold off
end

function min = minuteHand(theta,hyp)
    xloc1 = 0
    yloc1 = 0
    xloc2 = cos(-theta) * hyp
    yloc2 = sins(-theta) * hyp
    xloc = [xloc1,xloc2]
    yloc = [yloc1,yloc2]
    min = plot(xloc,yloc)

end
