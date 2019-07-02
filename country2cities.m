function [names] = country2cities(country)
%This function reads in data from a file that contains average
%temperatures for countries and cities from 1900 to 2013.
%Input: Country
%Output: Cities in the Country

    %import data and initialize data struct
    cityData = importdata('GlobalLandTemperaturesByCity.csv');
    j = 0;
    data(400000) = struct('Year', [], 'Month', [],...
                'City', [],'Country', [],...
                'AvgTemp', []);
    %iterate through data and compare if current row contains country input
    for i = 1:length(cityData)
        current = cityData{i,1};
        TF = contains(current,country);
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
                [city, d] = strtok(c, ',');
                [nation, ~] = strtok(d, ',');
                j = j+1;
                month = str2double(time(6:7));
                avtemp = str2double(avtemp);
                data(j) = struct('Year', year, 'Month', month,...
                'City', city,'Country', nation,...
                'AvgTemp', avtemp);
            end
        end
    end
    %delete empty values from preallocated struct
    data(j+1:end) = [];
    %preallocate arrays
    names = strings(1,length(data));
    %make new vector for names of cities
    for k = 1:length(data)
        names(k) = data(k).City;
    end
    names = unique(names);
    %check for any errors in names of cities, if present, remove from array
    for i = 1:length(names)
        if strfind(names(i), '.')
            names{i} = [];
        end
    end
    names = rmmissing(names);
end
