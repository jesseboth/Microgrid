%{
    Plot the power and load with respect to time
    input:
            power - power determination from GA
            load -  load from time series
%}
function power_plot(power, load)
    figure(1);
    hold on

    plot(load(1, :));

    v = zeros(length(load), 1);

    % get the sum of each chromosomes power output
    for i=1:length(load)
        v(i) = sum(power(i,:));
    end
    plot(v);

    title('Power and Load');
    xlabel('Time');
    ylabel('Power (W)');
    hold off
end

