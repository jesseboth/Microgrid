function enviro_plot(enviro)
    figure(3);
    hold on
    plot(enviro)    
    title('Environmental Impact');
    xlabel('Time');
    ylabel('Emissions (tons)');
    hold off
end