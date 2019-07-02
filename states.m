function [years, temps, data, States] = usStates()

    stateData = importdata('GlobalLandTemperaturesByState.csv');
    [time, a] = strtok(stateData, ',');
    [avtemp, b] = strtok(a, ',');
    [~, c] = strtok(b, ',');
    [state, d] = strtok(c, ',');
    [country, ~] = strtok(d, ',');

    time(1) = [];
    avtemp(1) = [];
    state(1)= [];
    country(1) = [];
    year = zeros(1,length(time));
    month = zeros(1,length(time));

    j = 0;
    data(4000000) = struct('Year', [], 'Month', [],'State', [],...
    'Country', [], 'AvgTemp', []);
    for i = 1:length(state)
        if length(country{i}) == 13
            temp = time{i};
            year(i) = str2double(temp(1:4));
            if year(i) >= 1990
                j = j+1;
                month(i) = str2double(temp(6:7));
                data(j) = struct('Year', year(i), 'Month', month(i),...
                    'State', state(i),'Country', country(i),...
                    'AvgTemp', avtemp(i));
                data(j).AvgTemp = str2double(data(j).AvgTemp);
            end
        end
    end
    data(j:end) = [];
    years = zeros(1, length(data));
    temps = zeros(1, length(data));
    for k = 1:length(data)
        years(k) = data(k).Year + ((data(k).Month)./12);
        temps(k) = data(k).AvgTemp;
    end
    States = strings(1,length(data));
    for l = 1:length(data)
        States(l) = data(l).State;
    end
    States = unique(States);
end