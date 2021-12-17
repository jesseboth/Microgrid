clear
clc
close all


pop=100;           % population
m_rate = .1;        % mutation rate
c_pt = 2;           % crossover point
good_enough = .03;  % when to stop
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
[num_sources, num_genes] = size(sources);
boundaries = zeros(num_genes, 2);
boundaries(1,:) = [15, 100];        % requested power range
boundaries(2,:) = [.15, 6.55];      % minimum cost to get max power
boundaries(3,:) = [.15, 3.75];      % minimum emissions to get max power
 
weights = [1, .6, .4];

% chromosome format -------------------------------------------------------
c = chromosome_gen(pop, sources);
% v = mutation(pop, m_rate);

% m = mutate(c(1,:), sources, boundaries);
child = crossover(c, pop, sources, boundaries, m_rate, c_pt)
length(child)

% xyz = random_selection(90, c)
% fit = fitness(c,sources, boundaries, weights, 45);
% min(fit)
% c = elitism(5, c, fit);
% fit = fitness(c,sources, boundaries, weights, 45)
% min(fit)



% timeseries = TimeSeries();

% vector = zeros(24, num_sources);
% econ = zeros(24, 1);
% enviro = zeros(24, 1);
% for i=1:length(timeseries)



%     best = 1000;
%     % c(best_i,:)
%     [timeseries(i), output, best];
% end
% enviro_plot(enviro);
% econ_plot(econ);
% power_plot(vector, timeseries);
% data = get_data(timeseries, vector, sources)
