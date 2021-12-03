clc; clear all;

zID = [1, 8, 7, 5, 1, 10, 1];

A = zID(2);
B = zID(3);
C = zID(4);
D = zID(5);
E = zID(6);
F = zID(7);

%making unit vectors----------

slant_uv = [((12+D)/12)/(sqrt(((12+D)/12)+((12+D)/12)*tand((16+F)/2))),(((12+D)/12)*tand((16+F)/2))/(sqrt(((12+D)/12)+((12+D)/12)*tand((16+F)/2)))];

unit_step = ((12+D)/12)*tand((16+F)/2);


%-----------------------------

A = zeros(45,45)
steps  = 1;
p = [];

for n = 0:12
    if n < steps
        i = n;
    elseif n > (12 - steps)
        i = 12 - n;
    else
        i = steps;
    end
    
    
    
    
    p = [p,i];
    
    
    
end

x = 1:1:13
plot(x,p)
hold on
plot(x,-p)
xlim([0,20])
ylim([0,20])

hold off