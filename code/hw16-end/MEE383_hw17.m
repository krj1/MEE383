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
 

[P,D] = eig(KJ); % standard function call to get eigenvectors in P and values on diagonal of D

flag = 1; % Flag to indicate whether to skip the complex conjugate of an eigenvalue
for i=1:length(diag(D)) % Run through the eigenvalues
    R = isreal(D(i,i)); % checking if real or imaginary
    if(R) % for real lambda, the steps are easy
        Q(:,i) = P(:,i); % store the real vector
        C(i,i) = D(i,i); % put the real eigenvalue in the same diagonal position of C
    elseif(flag) % if the first of the complex eigenvalue complement
        Q(:,i) = real(P(:,i)); % real part on the eigenvector
        Q(:,i+1) = -imag(P(:,i)); % negative imaginary part of eigenvector in NEXT column
        C(i,i) = real(D(i,i));  % putting the real part on the diagonals
        C(i+1,i+1) = real(D(i,i)); 
        C(i,i+1) = -imag(D(i,i)); % putting the negative components at the off diagonal locations
        C(i+1,i) = imag(D(i,i));
        flag = 0; % indicating that next time through, skip the complex conjugate
    else
        flag = 1; % reseting flag after passing through complex conjugate
    end
end


KJ^8

Q*C.^8*inv(Q)

isreal(Q)
isreal(C)

