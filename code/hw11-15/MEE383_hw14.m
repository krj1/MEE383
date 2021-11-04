zID = [1, 8, 7, 5, 1, 10, 1];

A = zID(2);
B = zID(3);
C = zID(4);
D = zID(5);
E = zID(6);
F = zID(7);

rng(A+B+C+D+E+F);
small4x4 = round(3.8*rand(4,4)-1.9);


slowDet(small4x4)


function coex = slowDet(arr)
    for i = 1:1:width(arr)
        
        small3x3 = [arr(2:end,1:i-1), arr(2:end,i+1:end)];

        for j = 1:1:3;
            small2x2 = [small3x3(2:end,1:j-1), small3x3(2:end,j+1:end)];
            small2x2
            %res = small3x3(1,j) * (small2x2(1,1) * small2x2(2,2)) - (small2x2(1,2) * small2x2(2,1));
            %res
            %small2x2
            %small3x3
        end
        

    end
    
    coex = small2x2;
    
    
end