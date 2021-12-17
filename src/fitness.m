%{
    Determines the overall fitness of the chromosome
    input:
            chromosomes -   vector of chromosomes
            sources -       vector of soures
            boundaries -    defined boundaries
            weights -       defined weights
            goal_power -    load goal
    output: 
            vector -        vector of fitness corresponding to chomosomes  
%}
function vector = fitness(chromosomes, sources, boundaries, weights, goal_power)
    cur_pop = length(chromosomes);
    vector = zeros(cur_pop, 1);

    for i = 1:cur_pop
        % get power fitness
        f1 = sum(chromosomes(i,:))* weights(1);
        if(f1 < goal_power)
            f1 = nan;
        end

        % get economic fitness
        f2 = econ_fitness(chromosomes(i,:), sources, boundaries, weights);
        % get environmental fitness
        f3 = enviro_fitness(chromosomes(i,:), sources, boundaries, weights);

        % ¯\_(ツ)_/¯ Math is made up anyway.
        vector(i) = (((f2+f3)/2) * (f1/goal_power))/goal_power * 10;
    end

end