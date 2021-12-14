%{
    Creates a generation of chromosomes.
    input:
            pop - number of chromosomes to be produced
            sources - [power, cost/W, emission/W]

    output: 
            chromosome - matrix of chromsoomes
%}
function chromosomes = chromosome_gen(pop, sources)
    [num_sources, num_genes] = size(sources);
    chromosomes = zeros(pop, num_genes);

    % mult = 1000;
    % sources = sources*mult;
    for i=1:pop
        for j=1:num_sources
            if randi([0, 1]) > 0
                chromosomes(i, j) = randi([0, sources(j, 1)]);
            end      
        end
    end

end