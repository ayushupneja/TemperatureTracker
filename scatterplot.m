function scatterplot(weatherData, cityNames)
subplot(2,1,1)
 for i = 1:9
    figure(1)
    scatter(1:length(cityNames), weatherData, '*')
    xticklabels(cityNames)
    title('Max Temperatures over 5 days');
    xlabel('Cities');
    ylabel('Temperature (F)');  
 end 