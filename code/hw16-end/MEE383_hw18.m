clear all; close all;

masses = [10;18;17;15;11;10;11] %inputs of separate masses
M = diag(masses,0) % put on diagonal
k = linspace(255,300,450);
store = [];

for i = 1:1:width(k)
    stiffness = [k(i);k(i);k(i);k(i);k(i);k(i);k(i);k(i)]; % building the stiffness values
    sums_springs = [stiffness(1:end-1)+stiffness(2:end)]; % making diagonal sums
    K = diag(sums_springs,0) + diag(-stiffness(2:end-1),1) + diag(-stiffness(2:end-1),-1);
    % making the stiffness matrix
    Dyn = K\M; % creating dynamic matrix

    [P,V] = eig(Dyn); % calculating eigenvalues
    omgs = sqrt(1./diag(V)); % showing natural frequencies
    
    if omgs(1) < 1
        store = [store, 0];
    else
        store = [store, 1];
    end
end

%from looking at store it is easy to see that k(254) is the last omg value < 1
disp(["minimum stiffness to achieve a statble system is" num2str(k(254))])








stiffness = [k(254);k(254);k(254);k(254);k(254);k(254);k(254);0]; % building the stiffness values

sums_springs = [stiffness(1:end-1)+stiffness(2:end)]; % making diagonal sums
K = diag(sums_springs,0) + diag(-stiffness(2:end-1),1) + diag(-stiffness(2:end-1),-1);
% making the stiffness matrix
Dyn = K\M; % creating dynamic matrix

[P,V] = eig(Dyn); % calculating eigenvalues
omgs = sqrt(1./diag(V)); % showing natural frequencies

x = 2*[1,2,3,4,5,6,7]; col_str = ['rgkbcgm'];
for mode_selected = 4 % running through different modes
    disp(["the eigen value for the 4 mode is" num2str(1/omgs(4)^2)])
    x_extremes = [P(:,mode_selected)']; % scale of oscillation
    figure(1); 
    for i = [[0:.1:1],[1:-.1:-1],[-1:.1:1],[1:-.1:0]] % from zero to extrema twice
        clf;
        for j =1:length(x)
            plot([x(j)-x_extremes(j)*i],1,'s','MarkerSize',12,'Color',col_str(j));
            % Putting markers on the line showing relative motion
            hold on;
        end
        xlim([0,16]);
        title(['the ',num2str(mode_selected),'th mode at omega = ',num2str(omgs(mode_selected))]);
        pause(.2) % showing motion within natural frequency mode
    end
    pause(0.2); % moving to next mode
end

disp(["if the last spring is attached to the wall k can decrease the minimum value for k would be" num2str(92.6726)])




stiffness = [92.6726;92.6726;92.6726;92.6726;92.6726;92.6726;92.6726;92.6726]; % building the stiffness values

sums_springs = [stiffness(1:end-1)+stiffness(2:end)]; % making diagonal sums
K = diag(sums_springs,0) + diag(-stiffness(2:end-1),1) + diag(-stiffness(2:end-1),-1);
% making the stiffness matrix
Dyn = K\M; % creating dynamic matrix

[P,V] = eig(Dyn); % calculating eigenvalues
omgs = sqrt(1./diag(V)); % showing natural frequencies

x = 2*[1,2,3,4,5,6,7]; col_str = ['rgkbcgm'];
for mode_selected = 4 % running through different modes
    disp(["the eigen value for the 4 mode is" num2str(1/omgs(4)^2)])
    x_extremes = [P(:,mode_selected)']; % scale of oscillation
    figure(1); 
    for i = [[0:.1:1],[1:-.1:-1],[-1:.1:1],[1:-.1:0]] % from zero to extrema twice
        clf;
        for j =1:length(x)
            plot([x(j)-x_extremes(j)*i],1,'s','MarkerSize',12,'Color',col_str(j));
            % Putting markers on the line showing relative motion
            hold on;
        end
        xlim([0,16]);
        title(['the ',num2str(mode_selected),'th mode at omega = ',num2str(omgs(mode_selected))]);
        pause(.2) % showing motion within natural frequency mode
    end
    pause(1.0); % moving to next mode
end
