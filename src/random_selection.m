function ret = random_selection(pop, chromosomes)
    [cur_pop, num_genes] = size(chromosomes);

    if pop < cur_pop
        ret = zeros(pop, num_genes);
        rm = randperm(cur_pop, (cur_pop - pop));
        j = 1;
        for i=1:cur_pop
            if ~ismember(i, rm)                
                ret(j,:) = chromosomes(i,:);
                j = j+1;
            end
        end
    else
        ret = chromosomes;
    end
end