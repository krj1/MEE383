zID = [1, 8, 7, 5, 1, 10, 1]

A = zID(2)
B = zID(3)
C = zID(4)
D = zID(5)
E = zID(6)
F = zID(7)

 rng(A + B + C + D + 0 + F)
 KJ = round((C+0.8)*randn(7,7))
arr1 = KJ(:,1) * 1
arr2 = KJ(:,2) * -1
arr3 = KJ(:,3) * 2
arr4 = KJ(:,4) * -2
arr5 = KJ(:,5) * 4
arr6 = KJ(:,6) * -10
arr7 = KJ(:,7) * 1

arrSum = arr1 + arr2 + arr3 + arr4 + arr5 + arr6 + arr7
KJ
arrSum
