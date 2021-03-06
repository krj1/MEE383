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
 

 KJ26 = KJ(2:6,2:6);
 syms l;
 
 dep = KJ26-(l*eye(5));
 
 
 poly_KJ26 = det(dep)
 
 lambdas = roots([-1,-15,-196,-3021,-4432,77280])
 
eign_vecs = [];
 for i = 1:1:5
    mat = KJ26-(lambdas(i)*eye(5));
    mat = crappy_rref(mat);
    mat = mat(:,5);
    mat(end) = 1; 
    mat_mag = norm(mat);
    eign_vecs = [eign_vecs, mat/mat_mag];
 end

eign_vecs
eigendiagonal = lambdas .* eye(5) 




KJ26_to_the_fourth_power = KJ26^4 
raising_KJ26_using_eign_vecs = eign_vecs*eigendiagonal.^4*inv(eign_vecs)






function ans = crappy_rref(arr)
arrHit = width(arr);
arrWit = length(arr);

i = 0;

rows = width(arr) - 1;


while i < rows
    i = i + 1;
    arr(i,1:end) = arr(i,1:end) / arr(i,i);
    j = i;
    while j < width(arr);
        j = j + 1;
        arr(j,1:end) = arr(j,1:end) - (arr(i,1:end) * arr(j,i));
    end
end

i = rows + 1;

while i > 1
    i = i - 1 ;
    j = i;
    while j > 1
        j = j - 1;
        arr(j,1:end) = arr(j,1:end) - (arr(i,1:end) * arr(j,i));
    end
end
 ans = arr;
end