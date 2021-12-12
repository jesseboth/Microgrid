function fit = enviro_fitness(boundaries, gene)
    enviro = 3; 
    fit = find_fitness(boundaries(enviro, 1), boundaries(enviro, 2), gene);
end