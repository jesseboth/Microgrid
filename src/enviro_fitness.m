function fit = enviro_fitness(chromosome, sources)
    cost = 3;
    fit = 1; 
    for i=1:length(chromosome)
        if(chromosome(i))
            fit = fit + sources(i, cost);
        end
    end
end