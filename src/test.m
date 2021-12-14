pop=500;        % population
m_rate = .05;   % mutation rate
c_pt = 3;       % crossover point
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
%               lower cost is better - [.15, 24] - [.01, .2] $
%               lower emission is better - [.3, 6] - [.01, .05] tons
% define ranges
[x, num_genes] = size(sources);
boundaries = zeros(num_genes,2);
for i=1:num_genes    
    boundaries(i,:) = [min(sources(:,i)), max(sources(:,i))];
end
 
% chromosome format -------------------------------------------------------
c = chromosome_gen(pop, sources);
v = mutation(pop, m_rate);

m = mutate(c(1,:), sources, boundaries);
child = crossover(c, pop, sources, boundaries, m_rate, c_pt);

out = econ_fitness(c(15, :), sources)
out = enviro_fitness(c(15, :), sources)

fit = fitness(c,sources, goal_power);
% % xyz = random_selection(50, c);
% xyz = elitism(80, c, fit);
