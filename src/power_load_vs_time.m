function power_load_vs_time(power, load)
    plot(load(1, :));
    hold on
    v = zeros(length(load), 1);
    for i=1:length(load)
        v(i) = sum(power(i,:));
    end
    plot(v);
    hold off
end

