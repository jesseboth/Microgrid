function vector = store_best(vector, fitness, chromosomes, time)
    [~, best_i] = min(fitness);

    vector(time, :) = chromosomes(best_i, :);

end