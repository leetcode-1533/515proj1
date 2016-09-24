% function [left, right] = bezier_single_line(b, t)
clear
    load('xy_sample.mat');
    t = 0.5;
%     xy = xy(:,1:4);
    n = size(xy, 2);

    temp_x = spalloc(n, n, n*(1+n)/2);
    temp_y = spalloc(n, n, n*(1+n)/2);

    temp_x(1,:) = xy(1,:);
    temp_y(1,:) = xy(2,:);
    
    for ii = 2:n
        for jj = 1:n+1-ii
            temp_x(ii, jj) = t*temp_x(ii - 1, jj) + (1-t)*temp_x(ii - 1, jj+1);
            temp_y(ii, jj) = t*temp_y(ii - 1, jj) + (1-t)*temp_y(ii - 1, jj+1);
        end
    end
    
    left = zeros(2, n);
    right = zeros(2, n);
    
    for ii = 1:n
        left(1, ii) = temp_x(ii, 1);
        left(2, ii) = temp_y(ii, 1);
    end
    
    for ii = 1:n
        right(1, ii) = temp_x(n+1 - ii, ii);
        right(2, ii) = temp_y(n+1 - ii, ii);
    end
    
    hold on 
    t = 0:0.01:1;

    plot(xy(1,:),xy(2,:),'r*');
%     c_xy = bezier3(t, xy);
%     plot(c_xy(1,:), c_xy(2,:))
    
    plot(left(1,:),left(2,:),'b');
%     c_xy = bezier3(t, left);
%     plot(c_xy(1,:), c_xy(2,:))
% 
    plot(right(1,:),right(2,:),'k');
%     c_xy = bezier3(t, right);
%     plot(c_xy(1,:), c_xy(2,:))

    
