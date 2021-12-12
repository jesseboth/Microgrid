%{
This time series was designed by deciding what time of the day is probaby
the busiest.  The thought process was the usage would be low in the middle
of the night at high when people are home from work.  It would gradually
increase/decrease throughtout the other parts of the day.  The assumtption
is that a week day is being used.

To find the values, a range was given for each hour through out the day.
A value for each hour within these ranges is randomly selected.  A set
number of days x can be produced.  Another value, inc, determines how many
days will be averaged to smooth out the curve to make it appear more 
realistic. x/inc will determine how many days are output in the final
matrix.
%}

function TimeSeries()
    load_range = readtable("MaxMin.csv");
    load_range = load_range{:,:};

    x = 120;
    y = 24;
    inc = 20; % number for rows is x/inc | the greater this ratio, the smoother the plot will be


    ts = zeros(x, y);

    for i = 1:x
        for j = 1:y
            ts(i, j) =  randi([load_range(1,j),load_range(2,j)]);        
        end

    end 

    row = 1;
    series = zeros((x/inc)-1, y);
    for i = 1:inc:x-inc
        get = ts(i:i+inc, :);        
        for j = 1:y         
            series(row, j) = round(mean(get(:,j)));
        end
        row = row+1;
    end
    
    for i = 1:(x/inc)-1
        plot(series(i,:));
        hold on
    end
    hold off
    writematrix(series,'TimeSeries.csv');
%     type 'TimeSeries.csv';
end