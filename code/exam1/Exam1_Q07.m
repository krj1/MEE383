

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

min = (A+B+C):6:360;
for i = 1:1:5
    min = [min,(A+B+C):6:360];
end

hr = F:.5:180;
t = [];
dt = [];

for i = 1:1:width(min)
    if abs(min(i) - hr(i)) >= 180 && abs(min(i-1) - hr(i-1)) < 180;
        t = [t,i];
        i
    end
    
end

for i = 1:1:width(t)-1
    dt = [dt,t(1,i+1)-t(1,i)];
end
xinc = 1:1:width(dt);

scatter(xinc,dt);
ylim([60 64]);
