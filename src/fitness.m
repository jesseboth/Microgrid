function vector = fitness(chromosomes, sources, boundaries, goal_power)
    cur_pop = length(chromosomes);
    vector = zeros(cur_pop, 1);

    power = 1;
    cost = 2; 
    emission = 3;
    for i = 1:cur_pop
        f1 = sum(chromosomes(i,:));
        if(f1 < goal_power)
            f1 = nan;
        end
        f2 = econ_fitness(chromosomes(i,:), sources, boundaries);
        f3 = enviro_fitness(chromosomes(i,:), sources, boundaries);
        vector(i) = abs((((f1*f2)+(f1*f3))/goal_power));

        % vector(i) = (f1*f2*f3)/goal_power;
    end

end