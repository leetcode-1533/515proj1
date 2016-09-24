clear
% For 6 points at a minimum, 3 sements will be created.
% For N points, N-3 semetns will be created

% xy = [0.3, 0.7, 0.1, 0.8, 0.4;
%        0.1, 0.6, 0.9, 0.5, 0.1];
% xy = zeros(2, 5);
% for i = 1:7
%     [xy(1,i), xy(2,i)] = ginput(1);
% end
load('xy_sample.mat');
xy = xy(:, 1:6);
plot(xy(1,:),xy(2,:), 'r*-');

N = size(xy, 2);
b = zeros(4, N-2, 2);
% First row
b(1, 1, :) = xy(:, 1);
b(2, 1, :) = xy(:, 2);
b(3, 1, :) = (xy(:, 2) + xy(:, 3))./2;
b(4, 1, :) = 0.25*xy(:, 1) + 7*xy(:, 2)/12 + xy(:, 3)/6;
b(1, 2, :) = b(4, 1, :);
% last row
b(2, N-2, :) = (xy(:, N-2) + xy(:, N-1))./2;
b(3, N-2, :) = xy(:, N-1);
b(4, N-2, :) = xy(:, N);


for jj = 2: N-3
    b(2, jj, :) = 2*xy(:, jj)/3 + xy(:, jj+1)/3;
    b(3, jj, :) = xy(:, jj)/3 + 2*xy(:, jj+1)/3;
end

for jj = 2: N - 3
   b(4, jj, :) = (b(3, jj, :) + b(2, jj + 1, :))./2;
   b(1, jj + 1, :) = b(4, jj, :);
end

t = 0:0.01:1;
for i = 1: N
    hold on
    b_mat = squeeze(b(:,i,:));
    c_xy = bezier3(t, b_mat');
    plot(c_xy(1,:), c_xy(2,:))
end