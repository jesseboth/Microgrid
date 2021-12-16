function power_plot(power, load)
    figure(1);
    hold on

    plot(load(1, :));

    v = zeros(length(load), 1);
    for i=1:length(load)
        v(i) = sum(power(i,:));
    end
    plot(v);

    title('Power and Load');
    xlabel('Time');
    ylabel('Power (W)');
    hold off
end

