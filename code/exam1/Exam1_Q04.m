zID = [1, 8, 7, 5, 1, 10, 1];

R = zID(2);
S = zID(3);
T = zID(4);
U = zID(5);
V = zID(6);
W = zID(7);

TW =  T/sqrt(T^2+W^2);
WT =  W/sqrt(T^2+W^2);
TV =  T/sqrt(T^2+V^2);
VT =  V/sqrt(T^2+V^2);
TU =  T/sqrt(T^2+U^2);
SU =  S/sqrt(S^2+U^2);
US =  U/sqrt(S^2+U^2);
UT =  U/sqrt(T^2+U^2);
RU =  R/sqrt(R^2+U^2);
UR =  U/sqrt(R^2+U^2);
zArr = [];
xinc = -pi/2:pi/100:pi/2+1.3734
yinc = -1.3734:pi/100:pi


for theta1 = -pi/2:pi/100:pi/2+1.3734
    bVecPlot = [];
    for theta2 = -1.3734:pi/100:pi
    % Order of unknowns x = [Ax,Ay,Fr,AB,AI,BI,CI,BC,HI,CH,CD,DH,DE,GH,EH,EG,EF,FG];
        augSys = [1,0,0,TW,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0; %Fx@a
            0,1,0,WT,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0; %Fy@a
            0,0,0,-TW,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,40; %Fx@b
            0,0,0,-WT,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0; %Fy@b
            0,0,0,0,0,0,-TV,0,0,-1,-TU,0,0,0,0,0,0,0,30*cos(theta2); %Fx@c
            0,0,0,0,0,0,-VT,0,0,0,UT,0,0,0,0,0,0,0,30*sin(theta2); %Fy@c
            0,0,0,0,0,0,0,0,0,0,TU,0,-1,0,0,0,0,0,50*cos(theta1); %Fx@d
            0,0,0,0,0,0,0,0,0,0,-UT,-1,0,0,0,0,0,0,50*sin(theta1); %Fy@d
            0,0,0,0,0,0,0,0,0,0,0,0,1,0,SU,0,-RU,0,0; %Fx@e
            0,0,0,0,0,0,0,0,0,0,0,0,0,0,-US,-1,-UR,0,40; %Fy@e
            0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,RU,1,0; %Fx@f
            0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,UR,0,0; %Fy@f
            0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,-1,0; %Fx@g
            0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0; %Fy@g
            0,0,0,0,0,0,0,0,0,1,0,0,0,-1,SU,0,0,0,0; %Fx@h
            0,0,0,0,0,0,0,0,-1,0,0,1,0,0,US,0,0,0,0; %Fy@h
            0,0,0,0,0,1,TV,0,0,0,0,0,0,0,0,0,0,0,0; %Fx@i
            0,0,0,0,-1,0,VT,0,1,0,0,0,0,0,0,0,0,0,0; %Fy@i
                    ];

            xVec = augSys(1:end,end);
            Amat = augSys(1:end,1:end-1);

            determinante = det(Amat); %det != 0 thus the system is linearly independent

            bVec = Amat\xVec;
            bVecPlot = [bVecPlot; bVec(11,1)];

    end
    zArr = [zArr, bVecPlot];
end

surf(xinc,yinc,zArr)

title('Plot of 50kN and 30kN force Vs. \theta');
ylabel('50kN force -1.3734 < \theta < \pi');
zlabel('Force in kN');
xlabel('30kN force -\pi/2 < \theta < \pi/2+1.3734');