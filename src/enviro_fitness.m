%{
    Finds the environmental fitness factor for a chormosome.
    input:
            chromosome -    a single chromosome array
            sources -       defined sources
            boudaries -     defined boundaries
            weights -       defined weights
    output:
            fit -           environmental fitness
%} 
function fit = enviro_fitness(chromosome, sources, boundaries, weights)
    emission = 3;   % emission index
    fit = 0;        % initialize
    [~, num_genes] = size(chromosome);
    for i=1:num_genes
        fit = fit + (chromosome(i) * sources(i, emission));
    end
    % find fitness factor.
    fit = weights(emission) * (find_fitness(boundaries(emission, 1), boundaries(emission, 2), fit));
end