zID = [1, 8, 7, 5, 1, 10, 1]

A = zID(2)
B = zID(3)
C = zID(4)
D = zID(5)
E = zID(6)
F = zID(7)

 rng(A + B + C + D + 0 + F)
 KJ = round((C+0.8)*randn(7,7))
 
arrHit = width(KJ)
arrWit = length(KJ)

i = 0

rows = 6


while i < rows
    i = i + 1
    KJ(i,1:end) = KJ(i,1:end) / KJ(i,i)
    j = i
    while j < 7
        j = j + 1
        KJ(j,1:end) = KJ(j,1:end) - (KJ(i,1:end) * KJ(j,i))
    end
end


    
KJ




