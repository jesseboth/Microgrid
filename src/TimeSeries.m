%{
    Generate a time series for load
%}
function series = TimeSeries()


    % if the file exists, open it
    if isfile("TimeSeries.csv")
        series = load("TimeSeries.csv");
    else
        % create a new time series
        load_range = readtable("MaxMin.csv");
        load_range = load_range{:,:};

        x = 100;
        y = 24;
        % number for rows is x/inc 
        % the greater this ratio, the smoother the plot will be
        inc = 100; 

        ts = zeros(x, y);

        for i = 1:x
            for j = 1:y
                % get a random value within the defined range
                ts(i, j) =  randi([load_range(1,j),load_range(2,j)]);        
            end
        end 

        row = 1;
        series = zeros((x/inc)-1, y);
        for i = 1:inc:x
            get = ts(i:i+inc-1, :);        
            for j = 1:y         
                % smooth out the curve
                series(row, j) = round(mean(get(:,j)));
            end
            row = row+1;
        end
        % save the matrix
        writematrix(series,'TimeSeries.csv');
    end
end