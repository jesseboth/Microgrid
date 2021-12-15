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
 
weights = [1, .5, .5];

% chromosome format -------------------------------------------------------
c = chromosome_gen(pop, sources);
v = mutation(pop, m_rate);

m = mutate(c(1,:), sources, boundaries);
child = crossover(c, pop, sources, boundaries, m_rate, c_pt);

% out = econ_fitness([17, 42, 0, 35], sources, boundaries)
% out = econ_fitness([17, 42, 0, 35], sources, boundaries)
% out = econ_fitness([0,17,12,19], sources, boundaries)
% out = econ_fitness([12, 0, 14, 13], sources, boundaries)
% out = econ_fitness([15, 20, 50, 15], sources, boundaries)

a = [17, 42, 0, 35];
b = [0,17,12,19];
d = [20, 15, 15, 50];
e = [20, 15, 15, 50];

v = [a; b; d; e];
% fit = fitness(v, sources, boundaries, weights, 80)
% fit = fitness(v, sources, boundaries, weights, 100)

% out = enviro_fitness(c(15, :), sources, boundaries);

% fit = fitness(v,sources, boundaries, weights, 100)
% min(fit)

% for s = 15:90
%     best = 1000;
%     fit = fitness(c,sources, boundaries, weights, s);
%     % [best,best_i]=min(abs(fit-1));
%     [best, best_i] = min(fit);
%     output = sum(c(best_i,:));
%     out_fit1 = econ_fitness(c(best_i, :), sources, boundaries, weights);
%     out_fit2 = enviro_fitness(c(best_i, :), sources, boundaries, weights);

%     while(best > good_enough)
%         for i=1:pop
%             m = mutate(c(i,:), sources, boundaries);
%             if(~isempty(m))
%                 c(i,:) = m;
%             end
%         end

%         fit = fitness(c,sources, boundaries, weights, s);
%         % [best,best_i]=min(abs(fit-1));
%         [best,best_i]=min(fit);
%         if(isnan(best))
%             best = 1000;
%         end
%     end
%     output = sum(c(best_i,:));
%     out_fit1 = econ_fitness(c(best_i, :), sources, boundaries, weights);
%     out_fit2 = enviro_fitness(c(best_i, :), sources, boundaries, weights);
%     % c(best_i,:)
%     [s, output, best, out_fit1, out_fit2]

% end

% test_c = [20,15,15,49]
% out_fit1 = econ_fitness(test_c, sources, boundaries)
% out_fit2 = enviro_fitness(test_c, sources, boundaries)


% xyz = random_selection(90, c);
% fit = fitness(c,sources, boundaries, weights, 45);
% min(fit)
% c = elitism(5, c, fit);
% fit = fitness(c,sources, boundaries, weights, 45)
% min(fit)



timeseries = TimeSeries();

vector = zeros(24, num_sources);
econ = zeros(24, 1);
enviro = zeros(24, 1);
for i=1:length(timeseries)



    best = 1000;
    fit = fitness(c,sources, boundaries, weights, timeseries(i));
    [best, best_i] = min(fit);

    while(~stop_condition(fit, good_enough))
        for j=1:pop
            m = mutate(c(j,:), sources, boundaries);
            if(~isempty(m))
                c(j,:) = m;
            end
        end

        fit = fitness(c,sources, boundaries, weights, timeseries(i));
        % [best,best_i]=min(abs(fit-1));
        [best,best_i]=min(fit);
        if(isnan(best))
            best = 1000;
        end
    end
    output = sum(c(best_i,:));

    vector = store_best(vector, fit, c, i);
    econ(i) = econ_fitness(c(best_i, :), sources, boundaries, weights);
    enviro(i) = enviro_fitness(c(best_i, :), sources, boundaries, weights);
    
    % c(best_i,:)
    [timeseries(i), output, best];
end
enviro_plot(enviro);
econ_plot(econ);
power_load_vs_time(vector, timeseries);