function children = crossover(chromosomes, pop, sources, boundary, rate, cross)
    ret = [];
    parent1 = chromosomes(randi([1, length(chromosomes)]), :);
    parent2 = chromosomes(randi([1, length(chromosomes)]), :);

    % ensure diversity
    while parent1 == parent2
        parent2 = chromosomes(randi([1, length(chromosomes)]), :);
    end


    num_children = floor(pop*rate);
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
    children = children(1:num_children,:);   % truncate for odd num_children

    rm_i = 1;
    for i = 1:length(children)        
        if ~check_bounds(children(rm_i,:), sources, boundary)
            % ret(ret_i,:) = children(i,:);
            children(rm_i,:) = [];
            rm_i = rm_i-1;
            % ret_i = ret_i+1;
        end
        rm_i = rm_i+1;
    end
end