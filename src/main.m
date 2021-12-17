%{
    Microgrid Controller
    Author: Jesse Both
    
    Description:
        A microgrid controller to used to optimize the economic
        and environmental factors the are defined for each source.

    Instructions:
        1. Move all files into workspace
        2. Run Main
        3. Complete prompts in terminal

    Input:
        - Reproduction Method
        - Survival Method
    
    Ouput:
        - Excess power
        - Total cost for day
        - Total emissions for day

        - plot for economic factor
        - plot for environmental factor
        - plot for power & load vs time
        - plot for calculation time

    Optimizations:
        - lower cost is better:     $[.15, 6.55]
        - lower emissions is better: [.15, 3.75] tons     

    Constraints:
        - No black outs
        - Each chromsome must be within:
            * power range
            * cost range
            * emissions range

    Sources:
        Matlab Docs 
        [https://www.mathworks.com/help/matlab/referencelist.html?type=function]
%}

clear
clc
close all


pop=100;            % population
m_rate = .1;        % mutation rate
c_pt = 2;           % crossover point
good_enough = .08;  % when to stop
weights = [1, .6, .4];
% chromosome format -------------------------------------------------------
power = 1;
cost = 2; 
emission = 3;
source_1 = [20, .02, .01];
source_2 = [120, .20, .05];
source_3 = [15, .01, .02];
source_4 = [50, .02, .04];
sources = [source_1; source_2; source_3; source_4];

% define ranges
[num_sources, num_genes] = size(sources);
boundaries = zeros(num_genes, 2);
boundaries(1,:) = [15, 100];        % requested power range
boundaries(2,:) = [.15, 6.55];      % minimum cost to get max power
boundaries(3,:) = [.15, 3.75];      % minimum emissions to get max power
 % chromosome format -------------------------------------------------------


% get user information ----------------------------------------------------
disp('Choose a Reproduction Method');
r = input(" 1 - Mutation\n 2 - Crossover\n ");
while r > 2 || r < 1
    r = input(" \nInput a valid number\n 1 - Mutation\n 2 - Crossover\n ");
end
disp(" ");
disp("Choose a Survival Method");
s = input(" 1 - Random Selection\n 2 - Elitism\n ");
while s > 2 || s < 1
    s = input(" \nInput a valid number\n 1 - Random Selection \n 2 - Elitism\n ");
end
disp(" ");


if r == 1
    reproduction = @mass_mutate;
else
    reproduction = @crossover;
end

if s == 1
    survival = @random_selection;
else
    survival = @elitism;
end
% get user information ----------------------------------------------------

% generate the load
load = TimeSeries();

% generate the initial generation
chromosomes = chromosome_gen(pop, sources);


vector = zeros(24, num_sources);    % initialze vector for best chromosomes
econ = zeros(24, 1);                % initialize vector for econonmic factor
enviro = zeros(24, 1);              % intialize vector for environmental factor
time = zeros(24, 1);                % vector to store time
for i = 1:length(load)
    tic;

    % get fitness vector
    fit = fitness(chromosomes, sources, boundaries, weights, load(i));
    [best, best_i] = min(fit);

    % loop until a suitable chromosome is found
    while(~stop_condition(fit, good_enough))

        % reproduce with selected method
        chromosomes = reproduction(chromosomes, pop, sources, boundaries, m_rate, c_pt);
        fit = fitness(chromosomes, sources, boundaries, weights, load(i));

        % kill with selected method
        chromosomes = survival(pop, chromosomes, fit);

        % check fitness of modified set
        fit = fitness(chromosomes, sources, boundaries, weights, load(i));
        [best,best_i]=min(fit);
        
        % get rid of NaN
        if(isnan(best))
            best = 1;
        end
    end

    % store elapsed time
    elapsed = toc; 
    time(i) = elapsed;

    % store chromosome in vector
    vector = store_best(vector, fit, chromosomes, i);
    
    % store economic factor
    econ(i) = econ_fitness(chromosomes(best_i, :), sources, boundaries, weights);

    % store environmental factor
    enviro(i) = enviro_fitness(chromosomes(best_i, :), sources, boundaries, weights);
end

% plot information
enviro_plot(enviro);
econ_plot(econ);
power_plot(vector, load);
calculation_plot(time);

% output data
get_data(load, vector, sources)