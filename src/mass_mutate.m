%{
    Performs mutations on all the necessay chromosomes
    input:
            c -         vector of chromosomes
            sourcse -   defind sources
            boundaries - defined boundaries
            m_rate -    mutation rate
    output:
            c - vector of mutate chromosomes
%}
function c = mass_mutate(c, pop, sources, boundaries, m_rate, ~)

    % find which chromosomes to mutate
    which = mutation(pop, m_rate);
    for i =1:length(which)
        %mutate if necessary
        if (which(i))
            c(i,:) = mutate(c(i,:), sources, boundaries);
        end
    end
end