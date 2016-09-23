%
%  To plot the de Casteljau shells showing the construction
%  of a point
%

function drawcurvdecas(b,m)
  bb = b;
  hold on;
  for i = 1: m
     bbx = bb(1,1:m + 2 - i);
     bby = bb(2,1:m + 2 - i);
     bb = bb(:,m + 3 - i:end);
     plot(bbx,bby)
  end
  plot(bb(1),bb(2),'*r')
  hold off
end