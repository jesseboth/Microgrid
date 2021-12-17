%{
    Performs mutations on all the necessay chromosomes
    input:
            c -         vector of chromosomes
            sourcse -   defind sources
            boundaries - defined boundaries
            m_rate -    mutation rate
    output:
            ret - vector of chromosmes and mutated chromosomes
%}
function ret = mass_mutate(c, pop, sources, boundaries, m_rate, ~)

    % find which chromosomes to mutate
    which = mutation(pop, m_rate);
    new_c = zeros(pop*m_rate, length(sources));
    for i =1:length(which)
        %mutate if necessary
        if (which(i))
            new_c(i,:) = mutate(c(i,:), sources, boundaries);
        end
    end
    % return chromosomes with appended mutations
    ret = [chromosomes; children]
end