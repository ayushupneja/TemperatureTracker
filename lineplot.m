function lineplot(tempMax, cityNames)
for i = 1:length(cityNames)
    subplot(2,1,2)
    plot(3*(1:length(tempMax)), tempMax)
    hold on
    xlabel('Time (hrs)')
    ylabel('Max Temperature over 5 days')
    legend(cityNames)
end
