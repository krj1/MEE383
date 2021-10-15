zID = [1, 8, 7, 5, 1, 10, 1]

A = zID(2)
B = zID(3)
C = zID(4)
D = zID(5)
E = zID(6)
F = zID(7)
arrStr = [];
F = 123*[-(D-A);(E-C);-(F-B)]

for i = -2.5:.1:2.5
    AC = [1;1.5;3]/sqrt(1+1.5^2+3^2)
    BC = [1;3;i]/sqrt(1+9+i^2)
    CD = [1;3;i]/sqrt(1+9+i^2)

    arr = [0,0,0,0,0,0,1/3.5,0,-1/3.5,0,0,0,-F(1); %sum of forces at A
        0,0,0,0,0,0,-1.5/3.5,AC(2),-1.5/3.5,0,0,0,-F(2); %sum of forces at A
        0,0,0,0,0,0,-3/3.5,-AC(3),3/3.5,0,0,0,-F(3); %sum of forces at A
        0,0,0,0,0,0,-1/3.5,0,0,-BC(1),-1,0,0;
        -1,0,0,0,0,0,1.5/3.5,AC(3),0,0,0,0,0; %Fby
        0,-1,0,0,0,0,3/3.5,0,0,0,0,0,0; %Fbz
        0,0,-1,0,0,0,0,0,0,BC(1),0,-CD(1),0;%Fcx
        0,2,0,3,0,0,0,0,0,0,0,0,F(3)-3*F(2); % sum of moments about j
        -2,0,3,0,0,0,0,0,0,0,0,0,-F(2)+1.5*F(1);% sum of moments about k
        0,0,0,0,0,0,0,-AC(2),0,-BC(2),0,-CD(2),0;
        0,0,0,0,-1,0,0,0,1.5/3.5,0,0,CD(3),0;%Fdy
        0,0,0,0,0,-1,0,0,3/3.5,0,0,0,0]%Fdz


    arr = rref(arr);
    
    arrStr = [arrStr,arr(:,13)]
end
hold on
k = 0;
for i = 1:1:12
    for j = 1:1:49
        delta1 = arrStr(i,j+1) - arrStr(i,j);
        delta2 = arrStr(i,j+2) - arrStr(i,j+1)
        delta = [delta1, delta2]
        xinc = [j-1,j]
        plot(xinc,delta,'LineWidth',3.2,'Color',[ 0, 0, 0]);
    end
end
hold off

%link AC is most affected. links BC and CD are affect but to a lesser
%degree

%extra equations 
% M i 0,0,0,-3,0,0,0,0,0,0,0,0,-1.5*F(3)-3*F(2)
% Fdx 0,0,0,0,0,0,0,0,1/3.5,0,1,CD(1),0
%0,0,0,0,0,0,-1/3.5,0,0,-BC(1),-1,0,0;
%0,0,0,-1,0,0,0,AC(3),0,0,0,0,0;
%0,0,0,0,0,0,0,0,1/3.5,0,1,CD(1),0;
