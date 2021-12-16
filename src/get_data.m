function ret = get_data(loads, chromosomes, sources)
    excess = 1;
    cost = 2;
    emission = 3;

    data = zeros(24, 3);

    [~, num_sources] = size(chromosomes);
    for i =1:length(data)
        data(i,excess) = sum(chromosomes(i, :)) - loads(i);
        for j=1:num_sources
            data(i, cost) = data(i, cost) + chromosomes(i, j)*sources(j, cost);
            data(i, emission) = data(i, emission) + chromosomes(i, j)*sources(j, emission);
        end
    end

    ret = zeros(1, 3);
    ret(excess) = sum(data(:, excess));
    ret(cost) = sum(data(:, cost));
    ret(emission) = sum(data(:, emission));

end