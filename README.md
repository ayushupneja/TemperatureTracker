#Project Description
Background:
Our application is designed to provide people with a history of land temperatures in nearly every country and city in the world.  If one Google searches climate change in different countries, it’s impossible to quickly find mass data analysis for so many countries in a straightforward program. There is a lot of data to sift through, and skewed studies to stray away from. Thus, we created our application which is designed to be as ergonomic and simple as possible.

Country Tab:
In the first tab, the user has the option to input any country of their desire. A graph will appear, where the data points for each month from 1900-2013 are plotted in addition to a Least-Squares Regression Line for the data. The average temperatures in 1900 and 2013 are printed to a text file, in addition to the projection for 2100. From here, the user has the option to either choose a city in the country or choose a state in the United States by pressing “Choose Cities” or “Choose US State”, respectively.

Cities Tab:
When the user clicks the “Choose Cities” button in the Country Tab, it transfers them to the Cities Tab. There, the list of cities in the country they entered will begin to load in the text area underneath the “Loading list of cities…” label. Once the list of cities has initialized, the user can enter any of the cities in the text box next to the “Enter a City!” label and press done for the data points for each month from 1900-2013 to be plotted on the graph. A Least-Squares Regression Line will also be plotted. Finally, the average temperatures in 1900 and 2013 are printed to a text file, in addition to the projection for 2100. After that, the user will have the option to either enter a new country or choose a US State by pressing “Choose Cities” or “Choose US State”, respectively.

US States Tab:
When the user clicks the “Choose US State” in either the Cities Tab or the Country Tab, it transfers them to the US States Tab. There, the list of the states will start initializing for the user to reference before typing the state they desire in the text box next to the “Enter a State!” label and pressing the “Done” button. A plot of the data points for each month from 1900-2013 will be plotted on the graph in addition to a Least-Squares Regression Line will also be plotted. Additionally, the average temperatures in 1900 and 2013 are printed to a text file, in addition to the projection for 2100.

#Requirements
Where we meet everything

Reading and analyzing a data set of substantial size (minimum 100,000 data points)
4 functions outside the app with 3 types of reading in data;
Reading in Cities from GlobalLandTemperaturesByCity
Line 8 in country2cities() function
Line 9 in cityData() function
Reading in Countries from GlobalLandTemperaturesbyCountry
Line 9 in globalCountry() function
Reading in States from GlobalLandTemperaturesbyState
Line 9 in usStates() function
Writing to a file using fprintf
3 functions inside the app
Lines 99-103 - opening file, printing user’s chosen city, min and max temperatures for 1900 and 2013 of city, closing file
Lines 134-139 - opening file, printing user’s chosen country, min and max temperatures for 1900 and 2013 of country, closing file
Lines 158-162 - opening file, printing user’s chosen state, min and max temperatures for 1900 and 2013 of state, closing file
Plotting meaningful data points relevant to the problem
Plotting Average Temperatures for City inside the app
Lines 112-124  - Clears graphs, plots data, titles graph, sets x and y labels, sets axes
Plotting Average Temperatures for Country inside the app
Lines 141-148 - Plots data and holds, sets axes
Plotting Average Temperatures for State inside the app
Line 156 - Clears graph
Lines 178-186 - Plots data, sets x and y labels, titles graph, holds data
- - 

#Tutorial
What to do when using our application
For the country input, the data sorts through data for hundreds of countries, each country having data for years 1743-2013. To eliminate gaps in the data, our code accounts for 1900-2013. Because of the large amount of data, there are often significant delays in iterating through the data. As a result several things should be noted before running our files:

1: When clicking any buttons for any result, please do not type or click anything else until the result comes onto the page or our program will malfunction.

2: The first country tab will graph within 3-7 seconds for any country.

3: The city tab will take a bit longer as it is indexing through an 8 million row .csv file. As a result, please give it time. Inputting a country with a huge amount of cities such as the United States will take considerably longer as the if/for loops are triggered. However, inputting most countries normally within 1-2 minutes.

4: Some examples of countries to input are: Spain, Mexico, Thailand, Russia

5: No quotes are required in any of our text boxes

6: Please wait for the list of cities and states to load in their respective tabs when you click the “Choose City” and “Choose US State” buttons.

7: Do NOT click the tabs at our top, our buttons switch the tabs for you and other functions depend on those same buttons.
