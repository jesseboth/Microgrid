%{
    Perform a mutation on a single chromosome.
    inputs:
            chromosome - a single chromosome
            sources -    defined sources
            boundary -   defined boundary   
    outputs:
            ret -        mutated chromosome or []
%}
function ret = mutate(chromosome, sources, boundary)
    ret = [];

    new_c = chromosome;     % initialize new chromosomes
    for i=1:length(sources)
            % get new genes
            new_c(i) = randi([1, sources(i, 1)]);
    end

    % check if it is a feasible chromosome
    ret = chromosome;
    if check_bounds(new_c, sources, boundary)
        ret = new_c;
    end
end 