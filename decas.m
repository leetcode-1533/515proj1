%
%  Function to compute a point on the Bezier
%  curve and all the line segments involved 
%  in computing this point using the 
%  de Casteljau algorithm
%
%  control polygon cpoly
%  curve parmeter t
%  affine frame (r, s)
%  the output is a sequence of points lseg
%

function lseg = decas(cpoly, r, s, t)
m = size(cpoly, 2) - 1;
bb = cpoly;
lseg = cpoly;
b = [];
  for j = 1: m 
     for i = 1: m - j + 1
        b = [b, lerp(bb(:,i), bb(:,i+1), r, s, t)];  
     end
     lseg = [lseg,b];
     bb = b; 
     b = [];
  end
end