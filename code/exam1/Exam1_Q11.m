
zID = [1, 8, 7, 5, 1, 10, 1];

A = zID(2);
B = zID(3);
C = zID(4);
D = zID(5);
E = zID(6);
F = zID(7);
Z = [];
nonZ = [];


for i = 1.5:.1:4.5
    Apos = [1,i,3]; % [x,y,z] position of joint A
    Bpos = [2,0,0]; 
    Cpos = [1,3,0];
    Dpos = [0,0,0];
    AtoB = (Bpos-Apos)/norm(Bpos-Apos); % Unit vector from A to B
    AtoC = (Cpos-Apos)/norm(Cpos-Apos); % Unit vector from A to C
    AtoD = (Dpos-Apos)/norm(Dpos-Apos); % Unit vector from A to D
    DtoB = (Bpos-Dpos)/norm(Bpos-Dpos); % Unit vector from D to B
    DtoC = (Cpos-Dpos)/norm(Cpos-Dpos); % Unit vector from D to C
    BtoC = (Cpos-Bpos)/norm(Cpos-Bpos); % Unit vector from B to C

    FAx = -(D-A)*123;
    FAy = +(E-C)*123;
    FAz = -(F-B)*123;
    load_vals = [];
    % Order of unknowns x = [By;Bz;Cx;Cz;Dy;Dz;AB;AC;AD;BC;BD;CD];
    coeffs = [0,0,-1,0,0,0,zeros(1,6); % Frame equilibrium in x
            -1,0,0,0,-1,0,zeros(1,6); % Frame equilibrium in y
            0,-1,0,-1,0,-1,zeros(1,6); % Frame equilibrium in z
            0,0,0,-3,0,0,zeros(1,6); % Moment about D in x direction
            0,2,0,1,0,0,zeros(1,6); % Moment about D in y direction
            -2,0,3,0,0,0,zeros(1,6); % Moment about D in z direction
            zeros(1,6),AtoB(1),AtoC(1),AtoD(1),0,0,0; % summation of forces in x at A
            zeros(1,6),AtoB(2),AtoC(2),AtoD(2),0,0,0; % summation of forces in y at A
            zeros(1,6),AtoB(3),AtoC(3),AtoD(3),0,0,0; % summation of forces in z at A
            zeros(1,6),-AtoB(1),0,0,BtoC(1),-DtoB(1),0; % summation of forces in x at B
            -1,zeros(1,5),-AtoB(2),0,0,BtoC(2),-DtoB(2),0; % summation of forces in y at B
            0,0,-1,0,0,0,0,-AtoC(1),0,-BtoC(1),0,-DtoC(1)]; % summation of forces in x at C
    %         0,0,0,0,0,0,0,-AtoC(3),0,-BtoC(3),0,-DtoC(3)]; % summation in z direction
    constants = [-FAx;-FAy;-FAz;-1.5*FAz+3*FAy;FAz-3*FAx;-FAy+1.5*FAx;... constants for external loading
        -FAx;-FAy;-FAz;0;0;0]; % Constants from the external forces
    det(coeffs) % confirming that independent set of equations exist
    solution = coeffs\constants
    Z = [Z, solution(7:9,1)]; %used min functions made in question 1
    nonZ = [nonZ, solution(10:12,1)];
end

plot(1.5:.1:4.5,Z)%
legend("AB","AC","AD");
title("links with Z conponent");
figure()
plot(1.5:.1:4.5,nonZ);
legend("BC","BD","CD");
title("links with no Z conponent");
