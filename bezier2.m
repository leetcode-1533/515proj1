%
%  A function to plot a Bezier curve of degree 2 given by three
%  control points b1, b2, b3
%  The vector t specifies the values of the parameter t in [0 1]
%

function [Cx, Cy] = bezier2(t,b1,b2,b3)
  Cx = (1 - t).^2 * b1(1) + 2*t.*(1-t)*b2(1) + t.^2*b3(1);
  Cy = (1 - t).^2 * b1(2) + 2*t.*(1-t)*b2(2) + t.^2*b3(2);
end
