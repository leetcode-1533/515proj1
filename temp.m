%% sample for bazier3
clear
xy = [0.3, 0.7, 0.1, 0.8;
       0.1, 0.6, 0.9, 0.5];
hold on
plot(xy(1,:),xy(2,:), 'r*');
k = convhull(xy(1,:),xy(2,:));
plot(xy(1,k),xy(2,k),'r-');

t = 0:0.01:1;
c_xy = bezier3(t, xy);

plot(c_xy(1,:), c_xy(2,:))



%% sample for bazier2
clear
xy = [[0.3, 0.7, 0.1],
       [0.1, 0.6, 0.9]];
hold on
scatter(xy(1,:),xy(2,:), 'r*');

t = 0:0.01:1;
[cx, cy] = bezier2(t, xy(:,1), xy(:,2), xy(:,3));

plot(cx, cy)
%% Decas Example

r = 0; 
s = 1;
t = 0.5;

cpoly = [0  1  2  3; 0  4  5  0];

m = 3;
res = decas(cpoly,r,s,t);
figure(1)
drawcurvdecas(res,m)

cpoly = [0 1 2 3 4 5; 0 3.5 4.5 5 4 0];

m = 5;

res = decas(cpoly,r,s,t);
figure(2)
drawcurvdecas(res,m)