%
% to perform affine interpolation between two points p, q
% w.r.t. an affine basis [r, s]
%
function pt = lerp(p, q, r, s, t)
pt = ((s - t)/(s - r))* p + ((t - r)/(s - r))* q;
end