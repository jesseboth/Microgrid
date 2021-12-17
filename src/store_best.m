%{
    store the best chromosome
    input:
            vector -        current vector
            fitness -       fitness vector
            chromosomes -   vector of chromosomes
            time -          time index
    output:
            vector - vector with updated chromosome at time
%}
function vector = store_best(vector, fitness, chromosomes, time)
    [~, best_i] = min(fitness);

    vector(time, :) = chromosomes(best_i, :);

end