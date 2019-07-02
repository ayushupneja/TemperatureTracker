
clear
clc
%initializing data cells
tic
cityData = importdata('CitiesData.csv');
[time, a] = strtok(cityData, ',');
[avtemp, b] = strtok(a, ',');
[tempError, c] = strtok(b, ',');
[city, d] = strtok(c, ',');
[country, ~] = strtok(d, ',');
%discarding header row
time(1) = [];
avtemp(1) = [];
tempError(1) = [];
city(1)= [];
country(1) = [];
%splitting time into year/month
year = zeros(1,length(time));
month = zeros(1,length(time));
for i = 1:length(time)
    temp = time{i};
    year(i) = str2double(temp(1:4));
    month(i) = str2double(temp(6:7));
end
%creating data struct of all vars
for i = (length(cityData) - 1):-1:1
    dataStruct(i) = struct('Country', country(i), 'City', city(i),...
        'Year', year(i), 'Month', month(i), 'AvgTemp',...
        avtemp(i),'AvgTempError', tempError(i));
    %converting avgtemp and error to num
    dataStruct(i).AvgTemp = str2double(dataStruct(i).AvgTemp);
    dataStruct(i).AvgTempError = str2double(dataStruct(i).AvgTempError);
    %discarding everything before 1990
    if dataStruct(i).Year < 1900
        dataStruct(i) = [];
    end
end
toc