function ret = check_bounds(chromosome, sources, bounds)
    vector = zeros(length(bounds), 1);
    for i=1:length(chromosome)
        if chromosome(i)
            vector = vector + sources(i, :)';
        end
    end
    
    ret = 1;
    for i=1:length(vector)
        if vector(i) < bounds(i,1) | vector(i) > bounds(i, 2)
            ret = 0;
            break
        end
    end
end