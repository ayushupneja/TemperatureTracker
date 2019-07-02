cityData = {'Timbuktu|ml','Boston|us','Beijing|cn','Cape Town|za', 'McMurdo Station|aq','Rome|it','Nairobi|ke','Kuwait City|kw','Rio de Janeiro|br'}; 
cityNames = {'Timbuktu', 'Boston', 'Beijing', 'Cape Town', 'McMurdo Station', 'Rome', 'Nairobi', 'Kuwait City', 'Rio de Janeiro'};
weatherData = zeros(1,length(cityData));
city = strrep(cityData, '|', ',');
url = 'http://api.openweathermap.org/data/2.5/forecast?APPID=70e9f383955e7372c06948520cd38387&units=imperial';

key='c510b45b1131adf027f7249600f6c354';

for i = 1:length(city)
    resp=webread(url,'APPID',key,'q',cityNames{i});
    tempMax = zeros(1,length(resp.list));
    for j = 1:length(resp.list)
        try
            tempMax(j) = resp.list(j).main.temp_max;
        catch
            tempMax(j) = resp.list{j}.main.temp_max;
        end
    end
    lineplot(tempMax, cityNames)
    weatherData(i) = mean(tempMax);
    
    fprintf('RETREIVING WEATHER DATA FOR %s... \n', cityNames{i});
end

hold on

scatterplot(weatherData, cityNames)
 
