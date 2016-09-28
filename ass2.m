clear
% load('xy_sample.mat');

hold on
axis([0,1,0,1])

iter = 6;
num_points = 8;
t = 0.5;

for i = 1:num_points
    [xy(1,i), xy(2,i)] = ginput(1);
    plot(xy(1,:),xy(2,:), 'r*-');
end


container = zeros(2^(iter+1)-1, num_points, 2);
container = bezier_lineappro(xy, container, 1, iter, t);


for plot_iter = iter:iter
%     pause()
    plot_iter
    for i = 2^(plot_iter):2^(plot_iter+1)-1
        line_appro = squeeze(container(i, :,:))';
        plot(line_appro(1,:), line_appro(2,:),'k');
    end
end