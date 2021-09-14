zID = [1, 8, 7, 5, 1, 10, 1]

A = zID(2)
B = zID(3)
C = zID(4)
D = zID(5)
E = zID(6)
F = zID(7)

 rng(A + B + C + D + 0 + F)
 NP = round((C+0.8)*randn(7,7))
 
arrHit = width(NP)
arrWit = length(NP)

i = 0

rows = 4


while i < rows
    i = i + 1
    NP(i,1:end) = NP(i,1:end) / NP(i,i)
    j = i
    while j < 7
        j = j + 1
        NP(j,1:end) = NP(j,1:end) - (NP(i,1:end) * NP(j,i))
    end
end

i = rows + 1

while i > 1
    i = i - 1 
    j = i
    while j > 1
        j = j - 1
        NP(j,1:end) = NP(j,1:end) - (NP(i,1:end) * NP(j,i))
    end
end
    
NP




