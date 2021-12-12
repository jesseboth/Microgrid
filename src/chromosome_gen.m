%{
    Creates a generation of chromosomes.
    input:
            pop - number of chromosomes to be produced
            format - rows for each gene, 2 colums (min, max)

    output: 
            chromosome - matrix of chromsoomes
%}

function chromosomes = chromosome_gen(pop, format)
    [num_genes, x] = size(format);
    chromosomes = zeros(pop, num_genes);

    mult = 1000;
    format = format*mult;
    
    for i=1:pop
        for j=1:num_genes               
            chromosomes(i,j) = randi(format(j,:))/mult;
        end
    end
end