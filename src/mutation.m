
function vector = mutation(pop, rate)
    vector = zeros(pop, 1);
    check = 1/rate;
    for i=1:pop
        if(randi(check) == 1)
            vector(i) = 1;
        end
    end
end