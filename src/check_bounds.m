%{
    Check to see of the chromosome is within the defined bounds.
    input:
            chromosome - a single chromosome
            sources -    matrix of the defined sources
            bounds -     matrix of the defined bounds
    output:
            ret -        true or false within bounds
%}
function ret = check_bounds(chromosome, sources, bounds)
    vector = zeros(2, 1);
    [s_rows, s_cols] = size(sources);

    % loop through each gene, multiply by corresponding source value
    for i=1:s_rows
        for ii=2:s_cols
            vector(ii-1) = vector(ii-1) + (chromosome(i) * sources(i, ii));
        end
    end
    

    % return true of false if it is a feasible chromosome
    ret = 1;
    for i=2:length(bounds)
        if vector(i-1) < bounds(i, 1) || vector(i-1) > bounds(i, 2)
            ret = 0;
            break
        end
    end
end