function fit = enviro_fitness(chromosome, sources, boundaries)
    emission = 3;
    fit = 0;
    [~, num_genes] = size(chromosome);
    for i=1:num_genes
        fit = fit + (chromosome(i) * sources(i, emission));
    end

    fit = (find_fitness(boundaries(emission, 1), boundaries(emission, 2), fit));
end