%
%  A function to plot a Bezier curve of degree 3 given by four
%  control points b1, b2, b3, b4 
%  The input is a 2 x 4 matrix cpoly having the bi as columns
%  The vector t specifies the values of the parameter t in [0 1]
%

function b = bezier3(t,cpoly)
n = size(t,2);
d = size(cpoly,1);
b = zeros(d,n);
 for i = 1: d
    b(i,:) = (1 - t).^3 * cpoly(i,1) + 3*t.*(1-t).^2 *cpoly(i,2) + 3*t.^2.*(1 - t) *cpoly(i,3) + t.^3 *cpoly(i,4);
 end
end
