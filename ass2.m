clear
% load('xy_sample.mat');

hold on
axis([0,1,0,1])

iter = 6;
num_points = 8;
for i = 1:8
    [xy(1,i), xy(2,i)] = ginput(1);
    plot(xy(1,:),xy(2,:), 'r*');
end


container = zeros(2^(iter+1)-1, length(xy), 2);
container = bezier_lineappro(xy, container, 1, iter, 0.5);



for i = 2^(iter):2^(iter+1)-1
    line_appro = squeeze(container(i, :,:))';
    plot(line_appro(1,:), line_appro(2,:),'k');
end