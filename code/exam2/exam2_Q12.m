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
KJ1 = KJ(1:end,1);
KJ2 = KJ(1:end,end);
KJ1(2,1) = 10;


masses = abs([KJ1;KJ2]);
masses = sort(masses);

M = diag(masses,0); % put on diagonal
k_nom = 300*1.5;
k_flip = fliplr(k_nom);

test1 = nat_frq(k_nom,masses,M);
test2 = nat_frq(k_flip,masses,M);


k_nom = 350*1.5;
k_flip = fliplr(k_nom);

test3 = nat_frq(k_nom,masses,M);
test4 = nat_frq(k_flip,masses,M);

k_from_Q10 = 511.2626;
mass_from_Q10 = abs([KJ1;KJ2]);
M_from_Q10 = diag(mass_from_Q10,0);


if test1 == test2
     disp(['TRUE, the natural frequencies are the same']);
else
     disp(['FALSE, the \omega the natural frequencies are not the same']);
end

if test3 == test4
     disp(['TRUE, the natural frequencies are the same']);
else
     disp(['FALSE, the \omega the natural frequencies are not the same']);
end



w_Q10 = nat_frq(k_from_Q10, mass_from_Q10,M_from_Q10);
test3 = nat_frq(k_nom,masses,M);


dif = abs(w_Q10 - test3)
     
function nat = nat_frq(k,masses,M)
    rng(383);
    k_min = ones(1,height(masses)+1)*k; % building the stiffness values
    stiffness = k_min.*(1 + 0.5*rand(15,1)).';
    stiffness = sort(stiffness);
    
    sums_springs = [stiffness(1:end-1)+stiffness(2:end)]; % making diagonal sums
    K = diag(sums_springs,0) + diag(-stiffness(2:end-1),1) + diag(-stiffness(2:end-1),-1);
    % making the stiffness matrix
    Dyn = K\M; % creating dynamic matrix

    [P,V] = eig(Dyn); % calculating eigenvalues
    nat = sqrt(1./diag(V)); % showing natural frequencies
end
    

