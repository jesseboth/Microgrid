%{
    plot the economic factor for the system
    input: 
            econ: vector of economic factors over time
%}
function econ_plot(econ)
    figure(2);
    hold on
    plot(econ)    
    title('Economic Impact');
    xlabel('Time');
    ylabel('Cost ($) Per Watt');
    hold off
end