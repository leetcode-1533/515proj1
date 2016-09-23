%
% To plot a Bezier cubic
%  Control points in the 2 x 4 array cpoly
%
t = [0: 0.05: 1];

cpoly = [0  1  2  3; 0  4  5  0];


C = bezier3(t, cpoly);
plot(C(1,:), C(2,:), cpoly(1,:), cpoly(2,:))

