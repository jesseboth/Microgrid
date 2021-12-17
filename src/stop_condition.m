%{
    Determine if the GA should stop.    
    input:
            fit -   current best fitness
            stop -  good enough point
    output:
            ret -   true or false
%}
function ret = stop_condition(fit, stop)
    ret = 0;
    if(min(fit) < stop)
        ret = 1;
    end
end