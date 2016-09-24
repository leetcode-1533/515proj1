clear
% For 6 points at a minimum, 3 sements will be created.
% For N points, N-3 semetns will be created
init_point = 6;
% xy = [0.3, 0.7, 0.1, 0.8, 0.4;
%        0.1, 0.6, 0.9, 0.5, 0.1];
% xy = zeros(2, 5);
% for i = 1:5
%     [xy(1,i), xy(2,i)] = ginput(1);
% end

load('xy_sample.mat');
xy = xy(:, 1:init_point);
t = 0:0.01:1;

hold on
axis([0,1,0,1])
plot(xy(1,:),xy(2,:), 'c*-');

N = size(xy, 2);
b = zeros(4, N-3, 2);
% First row
b(1, 1, :) = xy(:, 1);
b(2, 1, :) = xy(:, 2);
b(3, 1, :) = (xy(:, 2) + xy(:, 3))./2;
b(4, 1, :) = 0.25*xy(:, 2) + 7*xy(:, 3)/12 + xy(:, 4)/6;
b(1, 2, :) = b(4, 1, :);
% last row
b(2, N-3, :) = (xy(:, N-2) + xy(:, N-1))./2;
b(3, N-3, :) = xy(:, N-1);
b(4, N-3, :) = xy(:, N);


for jj = 2: N-4
    b(2, jj, :) = 2*xy(:, jj + 1)/3 + xy(:, jj + 2)/3;
    b(3, jj, :) = xy(:, jj + 1)/3 + 2*xy(:, jj + 2)/3;
end

for jj = 2: N - 4
   b(4, jj, :) = (b(3, jj, :) + b(2, jj + 1, :))./2;
   b(1, jj + 1, :) = b(4, jj, :);
end

for i = 1: N-3
    b_mat = squeeze(b(:,i,:));
    b_mat_points = b_mat';
    
    last_bpoint_plot = plot(b_mat_points(1,:),b_mat_points(2,:), 'x:');
    
    c_xy = bezier3(t, b_mat');
    last_bazier_plot = plot(c_xy(1,:), c_xy(2,:));
end

%% Interactive Plot
while(1)
    % New input
    [xy(1,1 + N), xy(2,1 + N)] = ginput(1);
    plot(xy(1,:),xy(2,:), 'c*-');
    N = N + 1;

    % Update the last row
    b(2, N-3, :) = (xy(:, N-2) + xy(:, N-1))./2;
    b(3, N-3, :) = xy(:, N-1);
    b(4, N-3, :) = xy(:, N);
    % Update the second last row
    jj = N - 4;
    b(2, jj, :) = 2*xy(:, jj + 1)/3 + xy(:, jj + 2)/3;
    b(3, jj, :) = xy(:, jj + 1)/3 + 2*xy(:, jj + 2)/3;

    b(4, jj, :) = (b(3, jj, :) + b(2, jj + 1, :))./2;
    b(1, jj + 1, :) = b(4, jj, :);

    % Plot
    delete(last_bpoint_plot);
    delete(last_bazier_plot);

    for i = N - 4: N -3
        b_mat = squeeze(b(:,i,:));
        b_mat_points = b_mat';

        last_bpoint_plot = plot(b_mat_points(1,:),b_mat_points(2,:), 'x:');

        c_xy = bezier3(t, b_mat');
        last_bazier_plot = plot(c_xy(1,:), c_xy(2,:));
    end
end



