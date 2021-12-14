function fit = econ_fitness(chromosome, sources, boundaries)
    cost = 2;
    fit = 0;
    [~, num_genes] = size(chromosome);
    for i=1:num_genes
        fit = fit + (chromosome(i) * sources(i, cost));
    end
    fit = (find_fitness(boundaries(cost, 1), boundaries(cost, 2), fit));
end
