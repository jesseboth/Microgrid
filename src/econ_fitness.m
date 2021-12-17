%{
    Finds the economic fitness factor for a chormosome.
    input:
            chromosome -    a single chromosome array
            sources -       defined sources
            boudaries -     defined boundaries
            weights -       defined weights
    output:
            fit -           economic fitness
%}  
function fit = econ_fitness(chromosome, sources, boundaries, weights)
    cost = 2;   % cost index
    fit = 0;    % initialize
    [~, num_genes] = size(chromosome);
    for i=1:num_genes
        fit = fit + (chromosome(i) * sources(i, cost));
    end
    % find fitness factor.
    fit = weights(cost) * (find_fitness(boundaries(cost, 1), boundaries(cost, 2), fit));
end
