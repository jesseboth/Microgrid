function ret = mutate(chromosome, sources, boundary)
    ret = [];
    
    for i=1:length(sources)
        if randi([0, 1]) > 0
            chromosome(i) = randi([0, sources(i, 1)]);
        end      
    end


    ret = [];
    if check_bounds(chromosome, sources, boundary)
        ret = chromosome;
    end
end 