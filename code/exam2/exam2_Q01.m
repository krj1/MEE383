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

steps  = 5;
A_small = zeros(steps*4-2,steps*4-2);
A_large = zeros((12-steps*2)*4, (12-steps*2)*4);
A = zeros(45,45);



A_small(1,1:2)= [slant_uv(1),slant_uv(1)]; %x A
A_small(2,1:2)= [slant_uv(2),-slant_uv(2)]; %y A

A_small(3,1:4)= [-slant_uv(1),0,0,slant_uv(1),]; %x B
A_small(4,1:4)= [-slant_uv(2),0,-1,slant_uv(2),]; %y B

p = [];
k = [];

for i = 1:steps
    if i > 1 && mod(i,2) == 1
        unit_delta_bar_left = [-1*((12+D)/12)/(sqrt(((12+D)/12)+((12+D)/12)*(2*i-3)*tand((16+F)/2))),-1*(((12+D)/12)*(2*i-3)*tand((16+F)/2))/(sqrt(((12+D)/12)+((12+D)/12)*(2*i-3)*tand((16+F)/2)))];
        
        unit_delta_bar_right = [((12+D)/12)/(sqrt(((12+D)/12)+((12+D)/12)*(2*i-1)*tand((16+F)/2))),-1*(((12+D)/12)*(2*i-1)*tand((16+F)/2))/(sqrt(((12+D)/12)+((12+D)/12)*(2*i-1)*tand((16+F)/2)))];
        inc = (((i-1)/2)-1)*8;
        
        
        A_small(7+inc,4+inc:9+inc) = [unit_delta_bar_left(1),-slant_uv(1),0,0,unit_delta_bar_right(1),slant_uv(1)]; %x D
        A_small(8+inc,4+inc:9+inc) = [unit_delta_bar_left(2),-slant_uv(2),0,-1,unit_delta_bar_right(2),slant_uv(2)]; %x D
        
        
        A_small(9+inc,6+inc:10+inc) = [-slant_uv(1),0,0,0,slant_uv(1)];
        A_small(10+inc,6+inc:10+inc) = [slant_uv(2),1,0,0,-slant_uv(2)];
        
    elseif i > 1 && mod(i,2) == 0
        unit_delta_bar_left = [-1*((12+D)/12)/(sqrt(((12+D)/12)+((12+D)/12)*(2*i-3)*tand((16+F)/2))),-1*(((12+D)/12)*(2*i-3)*tand((16+F)/2))/(sqrt(((12+D)/12)+((12+D)/12)*(2*i-3)*tand((16+F)/2)))];
        inc = ((i/2)-1)*8;
        unit_delta_bar_right = [((12+D)/12)/(sqrt(((12+D)/12)+((12+D)/12)*(2*i-1)*tand((16+F)/2))),-1*(((12+D)/12)*(2*i-1)*tand((16+F)/2))/(sqrt(((12+D)/12)+((12+D)/12)*(2*i-1)*tand((16+F)/2)))];
        
        A_small(3+inc,1+inc:5+inc)= [-slant_uv(1),0,0,0,slant_uv(1),]; %x B
        A_small(4+inc,1+inc:5+inc)= [-slant_uv(2),0,-1,0,-slant_uv(2),]; %y B
        
        A_small(5+inc,1+inc:6+inc)= [0,-slant_uv(1) 0, unit_delta_bar_right(1), 0, slant_uv(1)]; %x C
        A_small(6+inc,1+inc:6+inc)= [0,slant_uv(2), 1, unit_delta_bar_right(2), 0, -slant_uv(2)]; %y C
        
        
        
    end
    
end





for i = 1:1:2*steps
    if i > 1 && mod(i,2) == 1
        unit_delta_bar_left = [-1*((12+D)/12)/(sqrt(((12+D)/12)+((12+D)/12)*(2*steps-3)*tand((16+F)/2))),-1*(((12+D)/12)*(2*steps-3)*tand((16+F)/2))/(sqrt(((12+D)/12)+((12+D)/12)*(2*steps-3)*tand((16+F)/2)))];
        
        unit_delta_bar_right = [((12+D)/12)/(sqrt(((12+D)/12)+((12+D)/12)*(2*steps-1)*tand((16+F)/2))),-1*(((12+D)/12)*(2*steps-1)*tand((16+F)/2))/(sqrt(((12+D)/12)+((12+D)/12)*(2*steps-1)*tand((16+F)/2)))];
        
        A_large(9+((((i-1)/2)-1)*8),7+((((i-1)/2)-1)*8):12+((((i-1)/2)-1)*8)) = [unit_delta_bar_left(1),-1,0,0,unit_delta_bar_right(1),1]; %x
        A_large(10+((((i-1)/2)-1)*8),7+((((i-1)/2)-1)*8):12+((((i-1)/2)-1)*8)) = [-unit_delta_bar_left(2),0,1,0,-unit_delta_bar_right(2),0]; %y
        
        A_large(11+((((i-1)/2)-1)*8),6+((((i-1)/2)-1)*8):10+((((i-1)/2)-1)*8)) = [-1,0,0,0,1]; %x
        A_large(12+((((i-1)/2)-1)*8),6+((((i-1)/2)-1)*8):10+((((i-1)/2)-1)*8)) = [0,0,0,-1,0]; %y

    elseif i > 1 && mod(i,2) == 0
        unit_delta_bar_left = [-1*((12+D)/12)/(sqrt(((12+D)/12)+((12+D)/12)*(2*steps-3)*tand((16+F)/2))),-1*(((12+D)/12)*(2*steps-3)*tand((16+F)/2))/(sqrt(((12+D)/12)+((12+D)/12)*(2*steps-3)*tand((16+F)/2)))];
        
        unit_delta_bar_right = [((12+D)/12)/(sqrt(((12+D)/12)+((12+D)/12)*(2*steps-1)*tand((16+F)/2))),-1*(((12+D)/12)*(2*steps-1)*tand((16+F)/2))/(sqrt(((12+D)/12)+((12+D)/12)*(2*steps-1)*tand((16+F)/2)))];
          
        A_large(5+(((i/2)-1)*8),2+(((i/2)-1)*8):7+(((i/2)-1)*8)) = [-1,unit_delta_bar_left(1),0,0,1,unit_delta_bar_right(1)]; %x
        A_large(6+(((i/2)-1)*8),2+(((i/2)-1)*8):7+(((i/2)-1)*8)) = [0,unit_delta_bar_left(2),0,-1,0,unit_delta_bar_right(2)]; %y
        
        A_large(7+(((i/2)-1)*8),4+(((i/2)-1)*8):8+(((i/2)-1)*8)) = [-1,0,0,0,1]; %x
        A_large(8+(((i/2)-1)*8),4+(((i/2)-1)*8):8+(((i/2)-1)*8)) = [0,1,0,0,0]; %y
        
    end
    
end






for n = 0:12
    if n < steps
        i = n;
    elseif n > (12 - steps)
        i = 12 - n;
    else
        i = steps;
    end
    
    if i > 1 && mod(n,2) == 1
        unit_delta_bar = [((12+D)/12)/(sqrt(((12+D)/12)+((12+D)/12)*(2*i-1)*tand((16+F)/2))),(((12+D)/12)*(2*i-1)*tand((16+F)/2))/(sqrt(((12+D)/12)+((12+D)/12)*(2*i-1)*tand((16+F)/2)))];
        
        
        
    elseif i > 1 && mod(n,2) == 0
        slant_uv = [((12+D)/12)/(sqrt(((12+D)/12)+((12+D)/12)*tand((16+F)/2))),-1*(((12+D)/12)*tand((16+F)/2))/(sqrt(((12+D)/12)+((12+D)/12)*tand((16+F)/2)))];
         
    end
    
    
    
    
    p = [p,i];
    
    
    
end

x = 1:1:13;
%scatter(x,p)
%hold on
%scatter(x,-p)
%xlim([0,20])
%ylim([0,20])

%hold off