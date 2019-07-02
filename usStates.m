function [years, temps, midline, data, States, lsqr] = usStates()
%This function reads in data from a file that contains average
%temperatures for countries from 1900 to 2013.
%Input: None
%Output: Years array, Temperatures array, Midpoints for Initial and Final
%Year, Data Structure, States array, and LSQR array

    %import data and split strings into respective arrays 
    stateData = importdata('GlobalLandTemperaturesByState.csv');
    [time, a] = strtok(stateData, ',');
    [avtemp, b] = strtok(a, ',');
    [~, c] = strtok(b, ',');
    [state, d] = strtok(c, ',');
    [country, ~] = strtok(d, ',');
    %remove header row from arrays
    time(1) = [];
    avtemp(1) = [];
    state(1)= [];
    country(1) = [];
    year = zeros(1,length(time));
    month = zeros(1,length(time));
    %preallocate data struct
    j = 0;
    data(4000000) = struct('Year', [], 'Month', [],'State', [],...
    'Country', [], 'AvgTemp', []);
    %iterate through data and find rows with country United States
    for i = 1:length(state)
        if length(country{i}) == 13
            %convert year strings into numerical arrays
            temp = time{i};
            year(i) = str2double(temp(1:4));
            %for 1900 and later, convert month and temperature to 
            %numerical values and assign data values into data struct
            if year(i) >= 1900
                j = j+1;
                month(i) = str2double(temp(6:7));
                data(j) = struct('Year', year(i), 'Month', month(i),...
                    'State', state(i),'Country', country(i),...
                    'AvgTemp', avtemp(i));
                data(j).AvgTemp = str2double(data(j).AvgTemp);
            end
        end
    end
    %delete empty values from preallocated struct
    data(j:end) = [];
    %preallocate arrays
    years = zeros(1, length(data));
    temps = zeros(1, length(data));
    States = strings(1,length(data));
    %take into account months and make new vector for years,temps,states
    for k = 1:length(data)
        years(k) = data(k).Year + ((data(k).Month)./12);
        temps(k) = data(k).AvgTemp;
        States(k) = data(k).State;
    end
    States = unique(States);
    %check for any errors in temp array, if present, remove from array
    a = isnan(temps);
    x = find(a==1);
    temps(x) = [];
    years(x) = [];
    %create lsqr fit trend line array using years and temperatures
   % m = polyfit(years,temps,1);
    lsqr = zeros(1,length(years));
    %for i = 1:length(years)
     %   lsqr(i) = m(1)*years(i)+m(2);
    %end
    %create initial (1900) and final (2013) array of temperatures
    k = 0;
    l = 0;
    for r = 1:length(data)
        for w = 1900
            if data(r).Year == w
                k = k+1;
                initial(k) = data(r).AvgTemp;
            end
        end
        for w = 2013
            if data(r).Year == w
                l = l+1;
                final(l) = data(r).AvgTemp;
            end
        end
    end
    %find minimum and maximum of two arrays and average to get average tem
    initialLine = [min(initial) min(final)];
    finalLine = [max(initial) max(final)];
    midinitial = (min(initial)+max(initial))/2;
    midfinal = (min(final)+max(final))/2;
    midline = [midinitial midfinal];
end