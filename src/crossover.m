%{
    Performs crossover with 2 random parents.
    input:
            chromosomes -   matrix of chromosomes
            pop -           wanted int for population size
            sources -       defined sources
            boundary -      defined boundaries
            rate -          defined mutation rate
            cross -         defined cross point
    output:
            ret -           chromosomes with appened feasible children
%}
function ret = crossover(chromosomes, pop, sources, boundary, rate, cross)
    ret = [];

    % choose 2 random parents
    parent1 = chromosomes(randi([1, length(chromosomes)]), :);
    parent2 = chromosomes(randi([1, length(chromosomes)]), :);

    % ensure diversity
    while parent1 == parent2
        parent2 = chromosomes(randi([1, length(chromosomes)]), :);
    end

    num_children = floor(pop*rate);     % determine number of children
    num_genes = length(parent1);
    parents = [parent1; parent2];
    children = zeros(num_children, num_genes);

    % produce 2 children opposite of each other from parents
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

    % check each child to see if it is feasible
    rm_i = 1;
    for i = 1:length(children)        
        if ~check_bounds(children(rm_i,:), sources, boundary)
            children(rm_i,:) = [];
            rm_i = rm_i-1;
        end
        rm_i = rm_i+1;
    end

    % return chromosomes with appended children
    ret = [chromosomes; children];
end