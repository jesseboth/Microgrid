function ret = elitism(pop, chromosomes, fitness)
    [cur_pop, num_genes] = size(chromosomes);
    diff = cur_pop - pop;
    if pop < cur_pop
        ret = zeros(pop, num_genes);
        rm = zeros(diff, 2);
        rm(1:diff,1) = (1:1:(diff))';
        rm(1:diff,2) = fitness(1:diff,1);

        for i=diff+1:cur_pop
            m = max(rm(:,2));
            if fitness(i) < m                   
                x = indexof(rm(:,2), m);
                rm(x, 1) = i;
                rm(x, 2) = fitness(i);
            end
        end

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

function ret = indexof(array, val)
    len = length(array);
    ret = 0;
    for i=1:len
        if array(i) == val
            ret = i;
            break
        end
    end

end