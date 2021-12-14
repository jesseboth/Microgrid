function ret = mutate(chromosome, sources, boundary)
    ret = [];
    for i=1:length(chromosome)               
        chromosome(i) = randi([0, 1]);
    end
    if check_bounds(chromosome, sources, boundary)
        ret = chromosome;
    end
end 