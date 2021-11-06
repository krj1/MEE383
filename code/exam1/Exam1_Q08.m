
zID = [1, 8, 7, 5, 1, 10, 1];

A = zID(2);
B = zID(3);
C = zID(4);
D = zID(5);
E = zID(6);
F = zID(7);

x = 0;
y = 0;
r = 3;

min = (A+B+C):.1:360;
for i = 1:1:11
    min = [min,0:.1:360];
end

hr = F:.5/60:360;
t = [];
dt = [];

sec = (B+D+20):6:360;
for i = 1:1:719
    sec = [sec,(4):6:360];
end

for i = 1:1:width(min)
    if abs(min(i) - hr(i)) >= 120 && abs(min(i-1) - hr(i-1)) < 120;
        if abs(min(i) - sec(i)) >= 120 && abs(min(i-1) - sec(i-1)) < 120;
            disp(['the hands are 120 degrees apart at t = ' num2str(i) ' seconds']);
        end
    end
    
end
