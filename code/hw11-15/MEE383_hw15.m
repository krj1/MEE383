zID = [1, 8, 7, 5, 1, 10, 1];
clc;
A = zID(2);
B = zID(3);
C = zID(4);
D = zID(5);
E = zID(6);
F = zID(7);

zIdVec = [1;8;7;5;1;0;1];
mat = [1,1,1,1,1,1,1;
    0,1,1,1,1,1,1;
    0,0,1,1,1,1,1;
    0,0,0,1,1,1,1;
    0,0,0,0,1,1,1;
    0,0,0,0,0,1,1;
    0,0,0,0,0,0,1;
    ];

edge = inv(mat) * zIdVec
dif = diff(zIdVec)

disp('the the only jump of more then 4.5 is between 1 and A in my zid')

vab = [1;-1.5;-3]./3.5; vac = [0;1.5;-3]./3.3541; vad = [-1;-1.5;-3]./3.5; % New base vectors
% instead of [1;0;0], [0;1;0], and [0;0;1];

Cb = [vab, vac, vad]; % Putting set into matrix
force = [123*-1*(D-A);123*(E-C);-123*(F-B)];

xReaction = [1;0;0]; %Cx
yReaction = [0;1;0]; %Dy and By
zReaction = [0;0;1]; %Bz, Cz, and dz


force_base_transformation = inv(Cb)*force % path in new base
disp('the vectors from the base transformation are the tension/compresion forces on each member')

xBaseTransform = inv(Cb)*xReaction
yBaseTransform = inv(Cb)*yReaction
zBaseTransform = inv(Cb)*zReaction



disp('Cx is the most alligned of all the reactions, and its alligned with the AC axis')