% To plot a Bezier curve of degree 2
% Control points, b1, b2, b3
%
figure(1);
b1 = [0; 0];
b2 = [3; 3];
b3 = [6; 0];

% create coordinates for the control polygon
%
cpx = [b1(1) b2(1) b3(1)];
cpy = [b1(2) b2(2) b3(2)];

t = 0: 0.01: 1;
Cx = (1 - t).^2 * b1(1) + 2*t.*(1-t)*b2(1) + t.^2*b3(1);
Cy = (1 - t).^2 * b1(2) + 2*t.*(1-t)*b2(2) + t.^2*b3(2);
plot(Cx, Cy, cpx, cpy)
%

% Now we call the function bezier2
%
figure(2);
b2 = [2; -3];

%
% create coordinates for the control polygon
%
cpx = [b1(1) b2(1) b3(1)];
cpy = [b1(2) b2(2) b3(2)];

[Cx, Cy] = bezier2(t,b1,b2,b3);
plot(Cx, Cy, cpx, cpy)