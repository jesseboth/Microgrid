%{
    Perform the elitism survival technique on the chromosomes.
    input:
            pop -           required population size
            chromosomes -   vector of chomosomes
            fitnes -        calculated fitness vector
    output:
            ret -           reduced to 'elite' chromosomes  
%}
function ret = elitism(pop, chromosomes, fitness)
    [cur_pop, num_genes] = size(chromosomes);
    diff = cur_pop - pop;

    % check if there are too many chromosomes
    if pop < cur_pop

        % initialize vectors
        ret = zeros(pop, num_genes);
        rm = zeros(diff, 2);
        rm(1:diff,1) = (1:1:(diff))';
        rm(1:diff,2) = fitness(1:diff,1);

        % find the worst chromosomes
        for i=diff+1:cur_pop
            [m, x] = min(rm(:,2));
            if fitness(i) > m
                % store new 'bad' chromosomes
                rm(x, 1) = i;
                rm(x, 2) = fitness(i);
            end

        end

        % put the best chomosomes in a vector
        j = 1;
        for i=1:cur_pop
            if ~ismember(i, rm)               
                ret(j,:) = chromosomes(i,:);
                j = j+1;
            end
        end
    else
        % return the original vector
        ret = chromosomes;
    end
end