function container = bezier_lineappro(d, container, current, remaining, t)
    container(current, :,:) = d';
    % if still in the process of iteration, recursive further
    if remaining > 0
        [left, right] = bezier_single_line(d, t);
        container = bezier_lineappro(left, container, current*2, remaining - 1, t);
        container = bezier_lineappro(right, container, current*2 + 1, remaining - 1, t);
    end
    
    
