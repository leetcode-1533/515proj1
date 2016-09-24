load('xy_sample_2.mat');
xy = xy(:, 1:4);
hold on
axis([0,1,0,1])
plot(xy(1,:),xy(2,:), 'c*-');
