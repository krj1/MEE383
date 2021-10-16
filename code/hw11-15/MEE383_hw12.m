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


arr = [TW,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
WT,1,0,0,0,0,0,0,0,0,0,0,0,0,0,
-TW,0,-1,0,0,0,0,0,0,0,0,0,0,0,0;
-WT,0,0,0,1,0,0,0,0,0,0,0,0,0,0;
0,0,0,-TV,0,0,-1,-TU,0,0,0,0,0,0,0;
0,0,0,-VT,-1,0,0,UT,0,0,0,0,0,0,0;
0,0,0,0,0,0,0,TU,0,-1,0,0,0,0,0;
0,0,0,0,0,0,0,-UT,-1,0,0,0,0,0,0;
0,0,0,0,0,0,0,0,0,1,0,SU,0,-RU,0;
0,0,0,0,0,0,0,0,0,0,0,-US,-1,-UR,0;
0,0,0,0,0,0,0,0,0,0,0,0,0,RU,1;
0,0,0,0,0,0,0,0,0,0,0,0,0,UR,0;
0,0,0,0,0,0,0,0,0,0,1,0,0,0,-1;
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0;
0,0,0,0,0,0,1,0,0,0,-1,SU,0,0,0;
    ]
    
arr = det(arr)


arr2 = [TW,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
WT,1,0,0,0,0,0,0,0,0,0,0,0,0,0;
-TW,0,-1,0,0,0,0,0,0,0,0,0,0,0,0;
-WT,0,0,0,1,0,0,0,0,0,0,0,0,0,0;
0,0,0,-TV,0,0,-1,-TU,0,0,0,0,0,0,0;
0,0,0,-VT,-1,0,0,UT,0,0,0,0,0,0,0;
0,0,0,0,0,0,0,TU,0,-1,0,0,0,0,0;
0,0,0,0,0,0,0,-UT,-1,0,0,0,0,0,0;
0,0,0,0,0,0,0,0,0,1,0,SU,0,-RU,0;
0,0,0,0,0,0,0,0,0,0,0,-US,-1,-UR,0;
00,0,0,0,0,-1,0,0,1,0,0,US,0,0,0;
0,0,0,0,0,0,0,0,0,0,0,0,0,UR,0;
0,0,0,0,0,0,0,0,0,0,1,0,0,0,-1;
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0;
0,0,0,0,0,0,1,0,0,0,-1,SU,0,0,0
    ]

arr2 = det(arr2)
arr