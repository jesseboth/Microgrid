%{
    plot the calculation time for the system
    input: 
            calc: vector of times
%}
function calculation_plot(calc)
    figure(4);
    hold on
    plot(calc)    
    title('Calculation Time');
    xlabel('Time');
    ylabel('Calculation Time');
    hold off
end