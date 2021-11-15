clc; clear all;

zID = [1, 8, 7, 5, 1, 10, 1];

A = zID(2);
B = zID(3);
C = zID(4);
D = zID(5);
E = zID(6);
F = zID(7);

 rng(A + B + C + D + 0 + F);
 KJ = round((C+0.8)*randn(7,7));
 

 KJ26 = KJ(2:6,2:6)