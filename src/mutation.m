%{
    Determine which chomosomes shoud be mutated randomly
    input:
            pop -   population size
            rate -  mutation rate
    output:
            vector - vector, 1 means mutate, 0 means keep    
%}
function vector = mutation(pop, rate)
    vector = zeros(pop, 1);
    check = pop*rate;

    % randomly determine if mutation should occur
    for i=1:check
        vector(randi(pop)) = 1;
    end
end