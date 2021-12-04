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

M = diag(masses,0); % put on diagonal
k = linspace(5,900);
store = [];

for i = 1:1:width(k)
    stiffness = ones(1,height(masses))*k(i); % building the stiffness values
    stiffness = [stiffness, 0];
    sums_springs = [stiffness(1:end-1)+stiffness(2:end)]; % making diagonal sums
    K = diag(sums_springs,0) + diag(-stiffness(2:end-1),1) + diag(-stiffness(2:end-1),-1);
    % making the stiffness matrix
    Dyn = K\M; % creating dynamic matrix

    [P,V] = eig(Dyn); % calculating eigenvalues
    omgs = sqrt(1./diag(V)); % showing natural frequencies
    
    if omgs(1) < 1
        store = [store, 0];
    elseif omgs(1) > 1 && store(1,i-1) < 1
        store = [store, 1];
        disp(['minimum stiffness to achieve a statble system is: ' num2str(k(i)) ' kN/m']) ;
    else 
        store = [store, 1];
    end
end

%from looking at store it is easy to see that k(254) is the last omg value < 1
%disp(["minimum stiffness to achieve a statble system is" num2str(k(254))])

