function [years, temps, midline, lsqr] = generalCountry(x)
%This function reads in data from a file that contains average
%temperatures for countries from 1900 to 2013.
%Input: Country
%Output: Years array, Temperatures array, Midpoints for Initial and Final
%Year, and LSQR array

    %import data and initialize data struct
    countryData = importdata('GlobalLandTemperaturesByCountry.csv');
    j = 0;
    data(4000000) = struct('Year', []   , 'Month', [], 'Country', [],...
        'AvgTemp', []);
    %iterate through data and compare if current row contains city input
    for i = 1:length(countryData)
        current = countryData{i,1};
        TF = contains(current,x);
        %if row contains city, split row string into arrays, for time
        %convert time into year value and make numerical
        if TF == 1 
            [time, a] = strtok(current, ',');
            year = str2double(time(1:4));
            %for 1900 and later, split rest of string and convert month 
            %and temperature to numerical values. 
            %assign data values into data struct with fields
            if year >= 1900
                [avtemp, b] = strtok(a, ',');
                [~, c] = strtok(b, ',');
                [country, d] = strtok(c, ',');
                j = j+1;
                month = str2double(time(6:7));
                data(j) = struct('Year', year, 'Month', month,...
                    'Country', country,'AvgTemp', avtemp);
                data(j).AvgTemp = str2double(data(j).AvgTemp);
            end
        
        end
    
    end
    %delete empty values from preallocated struct
    data(j:end) = [];
    %preallocate arrays
    years = zeros(1, length(data));
    temps = zeros(1, length(data));
    %take into account months and make new vector for years and temps
    for k = 1:length(data)
        years(k) = data(k).Year + ((data(k).Month)./12);
        temps(k) = data(k).AvgTemp;
    end
    %create lsqr fit trend line array using years and temperatures
    m = polyfit(years,temps,1);
    lsqr = zeros(1,length(years));
    for i = 1:length(years)
        lsqr(i) = m(1)*years(i)+m(2);
    end
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
    %find minimum and maximum of two arrays and average to get average temp
    initialLine = [min(initial) min(final)];
    finalLine = [max(initial) max(final)];
    midinitial = (min(initial)+max(initial))/2;
    midfinal = (min(final)+max(final))/2;
    midline = [midinitial midfinal];
               
end
    

