zID = [1, 8, 7, 5, 1, 10, 1];

R = zID(2);
S = zID(3);

U = zID(5);

W = zID(7);

SU =  S/sqrt(S^2+U^2);
US =  U/sqrt(S^2+U^2);
RU =  R/sqrt(R^2+U^2);
UR =  U/sqrt(R^2+U^2);

changeTC2 = [];
zArrT = [];
zArrC = [];


for T = 1:1:10
    bVecPlotT = [];
    bVecPlotC = [];
    changeTC = [];
    for V = 1:1:10
        
        % Getting the denominators through the hypotenuse calculations
        TW =  T/sqrt(T^2+W^2);
        WT =  W/sqrt(T^2+W^2);
        TV =  T/sqrt(T^2+V^2);
        VT =  V/sqrt(T^2+V^2);
        TU =  T/sqrt(T^2+U^2);
        UT =  U/sqrt(T^2+U^2);
        
        % Unknown order: x =
        %   [Ax;Ay;Fy; AB; AI; BC; BI; CD; CH; CI; DE; DH; EF; EG; EH; FG;GH;HI]
        augSys = [1,0,0,TW,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0; %Fx@a
        0,1,0,WT,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0; %Fy@a
        0,0,0,-TW,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,40; %Fx@b
        0,0,0,-WT,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0; %Fy@b
        0,0,0,0,0,0,-TV,0,0,-1,-TU,0,0,0,0,0,0,0,30; %Fx@c
        0,0,0,0,0,0,-VT,0,0,0,UT,0,0,0,0,0,0,0,0; %Fy@c
        0,0,0,0,0,0,0,0,0,0,TU,0,-1,0,0,0,0,0,0; %Fx@d
        0,0,0,0,0,0,0,0,0,0,-UT,-1,0,0,0,0,0,0,50; %Fy@d
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
            
            delT = max(bVec) - minVec(bVec);
            bVecPlotT = [bVecPlotT; delT];
            
            delC = minusminVec(bVec) - min(bVec);
            bVecPlotC = [bVecPlotC; delC];
            changeTC = [changeTC,bVec(4:end,1)];
            
    end
    changeTC2 = [changeTC2,changeTC];
    zArrT = [zArrT, bVecPlotT];
    zArrC = [zArrC, bVecPlotC];
end
        
x = 1:1:10;
y = 1:1:10;

zArrT

surf(x,y,zArrT);
figure();
surf(x,y,zArrC);
ylabel('V');
zlabel('Force in kN');
xlabel('T');

for i = 1:1:15
    minimum = min(changeTC2(i,1:end));
    maximum = max(changeTC2(i,1:end));
    if minimum < 0 && maximum > 0
        i
    end
end

function [minv, minvInd] = minVec(vec)
    minv = max(vec);
    i = 1;
    while i < height(vec)
        if minv > vec(i,1) && vec(i,1) > 0
            minv = vec(i,1);
            minvInd = i;
        end
        i = i + 1;
    end  
end

function [minv, minvInd] = minusminVec(vec)
    minv = min(vec);
    i = 1;
    while i < height(vec)
        if minv < vec(i,1) && vec(i,1) < 0
            minv = vec(i,1);
            minvInd = i;
        end
        i = i + 1;
    end  
end





