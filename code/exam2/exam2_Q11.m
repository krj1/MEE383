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
k = linspace(5,300,900)*1.5;
store = [];
min_omg = [];
max_omg = [];




for i = 1:1:width(k)
    rng(383);
    k_min = ones(1,height(masses)+1)*k(i); % building the stiffness values
    stiffness = k_min.*(1 + 0.5*rand(15,1)).';
    
    sums_springs = [stiffness(1:end-1)+stiffness(2:end)]; % making diagonal sums
    K = diag(sums_springs,0) + diag(-stiffness(2:end-1),1) + diag(-stiffness(2:end-1),-1);
    % making the stiffness matrix
    Dyn = K\M; % creating dynamic matrix

    [P,V] = eig(Dyn); % calculating eigenvalues
    omgs = sqrt(1./diag(V)); % showing natural frequencies
    
    min_omg = [min_omg, min(omgs)];
    max_omg = [max_omg, max(omgs)];
    
end



plot(k,max_omg);
hold on
plot(k,min_omg);
hold off
title('Natural Frequency Vs Spring Stiffness [N/m]','FontSize',18)
xlabel('spring stiffness [N/m]','FontSize',18)
ylabel('Natural Frequency','FontSize',18)
legend('max \omega','min \omega','FontSize',18,'Location','northwest')

