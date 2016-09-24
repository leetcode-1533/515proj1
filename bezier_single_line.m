% function [left, right] = bezier_single_line(b)
clear
    b = load('xy_sample_2.mat');

    n = size(b, 2);
    temp_x = spalloc(n, n, n*(1+n)/2);
    temp_x(1,:) = b(1,:);