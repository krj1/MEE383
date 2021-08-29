import numpy as np
zID = np.array([1,8,7,5,1,10,1])
A = zID[1]
B = zID[2]
C = zID[3]
D = zID[4]
E = zID[5]
F = zID[6]

calc1 = A*(B+C)
calc2 = D/E-((A*10)+F)
calc3 = (((B*10)+A)**C)+(D-F)**E

print(calc1)
print(calc2)
print(calc3)