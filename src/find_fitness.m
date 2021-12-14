function fit = find_fitness(min, max, gene)
    m1 = gene - min;
    if m1 < 0
        fit = 0;
    else
        m2 = max - min;
        fit = (m1/m2);
    end
end