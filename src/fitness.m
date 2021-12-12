function vector = fitness(boundaries, chromosomes, goal_power)
    cur_pop = length(chromosomes);
    vector = zeros(cur_pop, 1);

    power = 1;
    cost = 2; 
    emission = 3;
    for i = 1:cur_pop
        f1 = find_fitness(goal_power, boundaries(power, 2), chromosomes(i, power));
        f2 = econ_fitness(boundaries, chromosomes(i, cost));
        f3 = enviro_fitness(boundaries, chromosomes(i, emission));
        vector(i) = (f1 + f2 + f2)/length(boundaries);  
    end

end