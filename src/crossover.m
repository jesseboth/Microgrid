function children = crossover(parent1, parent2, pop, rate, cross)
    num_children = ceil(pop*rate);
    num_genes = length(parent1);
    parents = [parent1; parent2];
    children = zeros(num_children, num_genes);

    for i=1:2:num_children
            choose = randi(2);
            next = 1;
            if choose == 1
                next = 2;
            end

            % child 1
            children(i, 1:cross) = parents(choose, 1:cross);
            children(i, cross:num_genes) = parents(next, cross:num_genes);

            % child 2
            children(i+1, 1:cross) = parents(next, 1:cross);
            children(i+1, cross:num_genes) = parents(choose, cross:num_genes);
    end
end