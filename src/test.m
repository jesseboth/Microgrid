pop=100;           % population
m_rate = .1;        % mutation rate
c_pt = 2;           % crossover point
good_enough = .1;  % when to stop
% chromosome format -------------------------------------------------------
power = 1;
cost = 2; 
emission = 3;
source_1 = [20, .02, .01];
source_2 = [120, .20, .05];
source_3 = [15, .01, .02];
source_4 = [50, .02, .04];
sources = [source_1; source_2; source_3; source_4];
% Optimizations:
%               lower cost is better - $[.15, 4.55]
%                                      $[.01, .2] per W
%               lower emission is better - [.15, 3.25] tons 
%                                          [.01, .05] tons per W

% define ranges
[~, num_genes] = size(sources);
boundaries = zeros(num_genes, 2);
boundaries(1,:) = [15, 100];        % requested power range
boundaries(2,:) = [.15, 4.55];      % minimum cost to get max power
boundaries(3,:) = [.15, 3.25];      % minimum emissions to get max power
 
% chromosome format -------------------------------------------------------
c = chromosome_gen(pop, sources);
v = mutation(pop, m_rate);

m = mutate(c(1,:), sources, boundaries);
child = crossover(c, pop, sources, boundaries, m_rate, c_pt);

out = econ_fitness(c(15, :), sources, boundaries);
out = enviro_fitness(c(15, :), sources, boundaries);

fit = fitness(c,sources, boundaries, 80);

for s = 15:100
    best = 1000;
    fit = fitness(c,sources, boundaries, s);
    [best,best_i]=min(abs(fit-1));
    output = sum(c(best_i,:));
    out_fit1 = econ_fitness(c(best_i, :), sources, boundaries);
    out_fit2 = enviro_fitness(c(best_i, :), sources, boundaries);

    while(best > good_enough)
        for i=1:pop
            m = mutate(c(i,:), sources, boundaries);
            if(~isempty(m))
                c(i,:) = m;
            end
        end

        fit = fitness(c,sources, boundaries, s);
        [best,best_i]=min(abs(fit-1));
        if(isnan(best))
            best = 1000;
        end
    end
    output = sum(c(best_i,:));
    out_fit1 = econ_fitness(c(best_i, :), sources, boundaries);
    out_fit2 = enviro_fitness(c(best_i, :), sources, boundaries);
    % c(best_i,:)
    [s, output, best, out_fit1, out_fit2]

end


% test_c = [20,15,15,49]
% out_fit1 = econ_fitness(test_c, sources, boundaries)
% out_fit2 = enviro_fitness(test_c, sources, boundaries)


% xyz = random_selection(90, c);
% fit = fitness(c,sources, boundaries, 45)
% c = elitism(90, c, fit)
% fit = fitness(c,sources, boundaries, 45)

