%{
    Creates a generation of chromosomes.
    input:
            pop - number of chromosomes to be produced
            sources - [power, cost/W, emission/W]

    output: 
            chromosomes - matrix of chromsoomes
%}
function chromosomes = chromosome_gen(pop, sources)
    [num_sources, num_genes] = size(sources);
    chromosomes = zeros(pop, num_genes);
    
    % generate random chromosomes corresponding to source constraints
    for i=1:pop
        for j=1:num_sources
            chromosomes(i, j) = randi([0, sources(j, 1)]);
        end
    end

end