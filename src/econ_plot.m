function econ_plot(econ)
    figure(2);
    hold on
    plot(econ)    
    title('Economic Impact');
    xlabel('Time');
    ylabel('Cost ($) Per Wat');
    hold off
end