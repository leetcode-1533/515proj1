%
%  Examples of construction of a point using the 
%  de Casteljau algorithm
%

r = 0; s = 1;
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
