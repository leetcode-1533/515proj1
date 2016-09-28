clear

hold on
axis([0,1,0,1])

iter = 1; % number of iteration
num_points = 8; % number of points, when n = 4, it is the solution for 2.1
t = 0.5; % t value, usual 0.5

% get input
for i = 1:num_points
    [xy(1,i), xy(2,i)] = ginput(1);
    plot(xy(1,:),xy(2,:), 'r*-');
end

% variable container contains all stages of the interpolation, for i times,
% there are 2^(i+1) -1 in total
container = zeros(2^(iter+1)-1, num_points, 2);
% do the approximation recursively
container = bezier_lineappro(xy, container, 1, iter, t);

% plot the last stage iteration result
for plot_iter = iter:iter
    plot_iter % print iter stage
    for i = 2^(plot_iter):2^(plot_iter+1)-1
        line_appro = squeeze(container(i, :,:))';
        plot(line_appro(1,:), line_appro(2,:),'k');
    end
end