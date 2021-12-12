function fit = econ_fitness(boundaries, gene)
    cost = 2; 
    fit = find_fitness(boundaries(cost,1), boundaries(cost, 2), gene);
end
