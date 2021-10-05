
zID = [1, 8, 7, 5, 1, 10, 1]

A = zID(2);
B = zID(3);
C = zID(4);
D = zID(5);
E = zID(6);
F = zID(7);

x = 0;
y = 0;
r = 3;

for k = 1:52
    figure(1);
    clf;
    
    hold on
    
    hourHand(E+(k*(6+F)/60),0.583*r,x,y)
    minuteHand(B+C+D+(k*(6+F)),0.833*r,x,y)
    circle(x,y,r)
    hours(r*1.2,x,y)
    hourNotch(r,x,y)
    minuteNotch(r,x,y)
 
    hold off
end





function min = minuteHand(min,hyp,x,y)
    axis equal
    xloc1 = x;
    yloc1 = y;
    deg = (min * 6) - 90;
    xloc2 = cosd(-deg) * hyp + x;
    yloc2 = sind(-deg) * hyp + y;
    xloc = [xloc1,xloc2];
    yloc = [yloc1,yloc2];
    min = plot(xloc,yloc,'LineWidth',3.5,'Color',[0.7843,0.0627,0.0627]);

end

function min = minuteNotch(hyp,x,y)
    axis equal
    for i = 1:60
        if mod(i,5) == 0 
        else    
            deg = (i * 6) - 90;
            xloc1 = cosd(-deg) * hyp*.95 + x;
            yloc1 = sind(-deg) * hyp*.95 + y;
            xloc2 = cosd(-deg) * hyp + x;
            yloc2 = sind(-deg) * hyp + y;
            xloc = [xloc1,xloc2];
            yloc = [yloc1,yloc2];
            min = plot(xloc,yloc,'LineWidth',2,'Color',[0,0,0]);
        end
    end
end


function hour = hourHand(hour,hyp,x,y)
    axis equal
    xloc1 = x;
    yloc1 = y;
    deg = (hour * 30) - 90;
    xloc2 = cosd(-deg) * hyp + x;
    yloc2 = sind(-deg) * hyp + y;
    xloc = [xloc1,xloc2];
    yloc = [yloc1,yloc2];
    hour = plot(xloc,yloc,'LineWidth',3.5,'Color',[ 165/255, 167/255, 168/255]);

end

function hour = hourNotch(hyp,x,y)
    axis equal
    for i = 1:12
        deg = (i * 30) - 90;
        xloc1 = cosd(-deg) * hyp*.9 + x;
        yloc1 = sind(-deg) * hyp*.9 + y;
        xloc2 = cosd(-deg) * hyp + x;
        yloc2 = sind(-deg) * hyp + y;
        xloc = [xloc1,xloc2];
        yloc = [yloc1,yloc2];
        hour = plot(xloc,yloc,'LineWidth',3.2,'Color',[ 0, 0, 0]);
    end

end


function Hours = hours(hyp,x,y)
    axis equal
    for i = 1:12
        deg = (i * 30) - 90;
        xloc = cosd(-deg) * hyp + x - .2;
        yloc = sind(-deg) * hyp + y;
        str = string(i)
        Hours = text(xloc,yloc,str,'FontSize',16);
    end
end



function temp = circle(x,y,r)
axis equal
th = 0:pi/50:2*pi;
xdem = r * cos(th) + x;
ydem = r * sin(th) + y;
temp = plot(xdem, ydem,'-','Color',[0.7333,0.5922,0.7882],'LineWidth',3.5);
ylim([-5,5])
xlim([-5,5])
end