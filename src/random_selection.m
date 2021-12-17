%{
    Randomly select chromosomes to keep to reduce population
    input:
            pop -           population size
            chromosomes -   vector of chromosomes
    output:
            ret -           reduced population
%}
function ret = random_selection(pop, chromosomes, ~)
    [cur_pop, num_genes] = size(chromosomes);

    if pop < cur_pop
        ret = zeros(pop, num_genes);    
        
        % get a random permuation of ints
        rm = randperm(cur_pop, (cur_pop - pop));
        j = 1;
        for i=1:cur_pop
            % if the index is in rm, remove the chromosome
            if ~ismember(i, rm)                
                ret(j,:) = chromosomes(i,:);
                j = j+1;
            end
        end
    else
        % keep all chromosomes
        ret = chromosomes;
    end
end