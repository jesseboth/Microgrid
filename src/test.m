    pop=100;
m_rate = .1;
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
%               lower emission is better
%               lower cost is better

% define ranges
[x, num_genes] = size(sources);
boundary = zeros(num_genes,2);
for i=1:num_genes    
    boundary(i,:) = [min(sources(:,i)), max(sources(:,i))];
end
 
% chromosome format -------------------------------------------------------
c = chromosome_gen(pop, boundary);
v = mutation(pop, .1);

m = mutate([1, 2, 3], boundary);

child = crossover(c(15,:), c(37,:), pop, .1, randi(2));

c(15, cost);
out = econ_fitness(boundary, c(15, 2));

fit = fitness(boundary, c, 73);
% xyz = random_selection(50, c);
xyz = elitism(80, c, fit);
