zID = [1, 8, 7, 5, 1, 10, 1];
clc;
A = zID(2);
B = zID(3);
C = zID(4);
D = zID(5);
E = zID(6);
F = zID(7);

rng(A+B+C+D+E+F);
small4x4 = round(3.8*rand(4,4)-1.9);

tic();
slowDet(small4x4)
toc();
tic();
slightlyLessSlowDet(small4x4)
toc();
tic();
det(small4x4)
toc();


function coex = slightlyLessSlowDet(arr)
    U = arr;
    for i = 1:1:4
        for j = i+1:1:4
            
            temp2 = eye(4,4);
           
            temp2(j,i) = -1*U(j,i);
            U = temp2 * U;
        end
    end
    U = det(U);
    coex = U;
    
end
function coex = slowDet(arr)
    runningSum2 = 0;
    for i = 1:1:width(arr)
        runningSum1 = 0;
        small3x3 = [arr(2:end,1:i-1), arr(2:end,i+1:end)];

        for j = 1:1:3;
            small2x2 = [small3x3(2:end,1:j-1), small3x3(2:end,j+1:end)];
            res = small3x3(1,j) * ((small2x2(1,1) * small2x2(2,2)) - (small2x2(1,2) * small2x2(2,1)));
            
            if mod(j,2) == 0
                runningSum1 = runningSum1 - res;
            else
                runningSum1 = runningSum1 + res;
            end
        end
        if mod(i,2) == 0
                runningSum2 = runningSum2 - runningSum1;
            else
                runningSum2 = runningSum2 + runningSum1;
        end
    end


    
    coex = runningSum2;
    
    
end