function ret = check_bounds(chromosome, sources, bounds)
    vector = zeros(2, 1);
    [s_rows, s_cols] = size(sources);
    for i=1:s_rows
        for ii=2:s_cols
            vector(ii-1) = vector(ii-1) + (chromosome(i) * sources(i, ii));
        end
    end
    
    ret = 1;
    for i=2:length(bounds)
        if vector(i-1) < bounds(i, 1) | vector(i-1) > bounds(i, 2)
            ret = 0;
            break
        end
    end
end