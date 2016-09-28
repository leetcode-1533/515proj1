% 
%   create two closer bazier curve control points(called left and right) based on the input
%
function [left, right] = bezier_single_line(xy, t)
    n = size(xy, 2);

    temp_x = spalloc(n, n, n*(1+n)/2); % using sparse matrix for storage
    temp_y = spalloc(n, n, n*(1+n)/2);

    temp_x(1,:) = xy(1,:);
    temp_y(1,:) = xy(2,:);
    % do the interpolation
    for ii = 2:n
        for jj = 1:n+1-ii
            temp_x(ii, jj) = t*temp_x(ii - 1, jj) + (1-t)*temp_x(ii - 1, jj+1);
            temp_y(ii, jj) = t*temp_y(ii - 1, jj) + (1-t)*temp_y(ii - 1, jj+1);
        end
    end
    % get the edges
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
    

    
