function ret = stop_condition(fit, stop)
    ret = 0;
    if(min(fit) < stop)
        ret = 1;
    end
end