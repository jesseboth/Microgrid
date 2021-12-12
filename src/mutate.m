function chromosome = mutate(chromosome, boundary)
    mult = 1000;
    boundary = boundary*mult;
    for i=1:length(chromosome)               
        chromosome(i) = randi(boundary(i,:))/mult;
    end
end 