%{
    Displays the required data to the terminal    
    input:
            loads -         load vector
            chromosomes -   vector of chromosoms
            sources -       defined sources
%}
function get_data(loads, chromosomes, sources)
    excess = 1;
    cost = 2;
    emission = 3;

    data = zeros(24, 3);

    [~, num_sources] = size(chromosomes);
    for i =1:length(data)
        % determine excess power
        data(i,excess) = sum(chromosomes(i, :)) - loads(i);
        for j=1:num_sources
            % get cost
            data(i, cost) = data(i, cost) + chromosomes(i, j)*sources(j, cost);
            % get emission
            data(i, emission) = data(i, emission) + chromosomes(i, j)*sources(j, emission);
        end
    end

    ret = zeros(1, 3);
    ret(excess) = sum(data(:, excess));
    ret(cost) = round(sum(data(:, cost)), 2);
    ret(emission) = round(sum(data(:, emission)), 2);

    fprintf("Excess power produced: %dW\n", ret(excess));
    fprintf("Total cost for the day: $%.2f\n", ret(cost));
    fprintf("Total emission for the day %.2f tons\n", ret(emission))
end