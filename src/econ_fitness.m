function fit = econ_fitness(chromosome, sources, boundaries, weights)
    cost = 2;
    fit = 0;
    [~, num_genes] = size(chromosome);
    for i=1:num_genes
        fit = fit + (chromosome(i) * sources(i, cost));
    end
    fit = weights(cost) * (find_fitness(boundaries(cost, 1), boundaries(cost, 2), fit));
end
