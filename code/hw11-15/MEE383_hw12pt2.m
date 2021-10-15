zID = [1, 8, 7, 5, 1, 10, 1]

A = zID(2)
B = zID(3)
C = zID(4)
D = zID(5)
E = zID(6)
F = zID(7)

index = 4;
d = sqrt(index^2+(1.75^2))



sys = [-sind(20),1,0,-index/d,0,0; %Fax
    cosd(20),0,1,-1.75/d,0,0; %Fay 
    sind(20),-1,0,0,1,0; %Fbx
    -cosd(20),0,-1,0,0,1; %Fby
    0,0,0,index/d,-1,0; %Fex
    0,0,0,1.75/d,0,-1] %Fey
System1 = det(sys)

sys2 = [-sind(20),1,0,-index/d,0,0; %Fax
    cosd(20),0,1,-1.75/d,0,0; %Fay 
    1.5*sind(20)-.75*cosd(20),0,0,(1+index)*1.75/d,0,0;
    -cosd(20),0,-1,0,0,1; %Fby
    0,0,0,index/d,-1,0; %Fex
    0,0,0,1.75/d,0,-1] %Fey
System2 = det(sys2)


sys3 = [-sind(20),1,0,-index/d,0,0; %Fax
    cosd(20),0,1,-1.75/d,0,0; %Fay 
    1.5*sind(20)-.75*cosd(20),0,0,(1+index)*1.75/d,0,0;
    1.5*sind(20)-.75*cosd(20),0,0,0,1.75,0;
    0,0,0,index/d,-1,0; %Fex
    0,0,0,1.75/d,0,-1] %Fey
System3 = det(sys3)


