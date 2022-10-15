# F1 Data Analysis: Wet Races
### Attribution
All data on Formula One retrieved from Ergast API: http://ergast.com/mrd/terms/

# Overview
Prompted by the recent number of rain events in the 2022 F1 season, I was curious about the frequency of wet weather races in the history of the sport. I decided to use the Ergast API to retrieve the data and perform some analysis on it.

# Methodology
In order to determine which of the 1079 races in the Ergast database can be classified as 'wet', I iterated through the 'races' dataframe and retrieved the html text from the wikipedia page for each event. Unfortunately, only a certain number of the grand prix wikipedia pages have the specific weather description in the info box. Because of this I have decided to instead simply search the entire wikipedia page for either of the word 'wet' or 'rain'. This means that all of the data is representative of race weekends that likely experienced rain during track times rather than the grand prix itself.

```
#I am certain that this code can be refactored to run faster (currently takes more than 4 minutes). I have not yet put in the time to do so.

for index, row in races.iterrows():
    wiki = requests.get(races.iloc[index]['url']).text
    count = len(re.findall(' wet | rain ', wiki))

    if count >= 1:
        wet_races_id.append(races.iloc[index]['raceId'])
        wet_races_names.append(races.iloc[index]['name'])
        wet_races_year.append(races.iloc[index]['year'])
```

This, however, does not greatly affect the results of the analysis because I believe that the results show that rain is becoming more a more frequent element in F1 and therefore more thorough and repeatable systems should be put into place in order to ensure that race events can ran as scheduled while still being safe for the drivers.

Currently, I foresee two main issues with this methodology that might affect the data. Firstly, just because the word 'wet' or 'rain' may appear on the grand prix wikipedia page, this does not necessarily mean that rainfall occurred while F1 cars were on track that weekend. Secondly, I believe that the more recent the grand prix is , the longer and more complex its wikipedia page is. This increases the likelihood that the words 'wet' or 'rain' appear on the page.

I also ran a search through the same wikipedia pages to find races that have been stopped prematurely. I believe that every race that has been stopped prematurely as a section in its wikipedia page infobox which states 'Scheduled distance: ...' (as opposed to 'Distance'). Similar to the first search criteria, I used this phrase to find all races that have been stopped prematurely. I also searched for the words 'wet' or 'rain' on pages that contain 'Scheduled distance' to determine if the races cancellation was possibly due to weather.

```
for index, row in races.iterrows():
    wiki = requests.get(races.iloc[index]['url']).text
    count = len(re.findall('Scheduled distance', wiki))
    rain_count = len(re.findall(' wet | rain ', wiki))

    if count >= 1:
        short_races_id.append(races.iloc[index]['raceId'])
        short_races_names.append(races.iloc[index]['name'])
        short_races_year.append(races.iloc[index]['year'])

        if rain_count >= 1:
            short_races_reason.append('Rain')
        elif rain_count == 0:
            short_races_reason.append('Not Rain')
```

# Results
![Fig. 1 - Wet Races per Year](/Figures/Fig.%201%20-%20Wet%20Races%20per%20Year.png)
<sup>Fig. 1 - Wet Races per Year</sup>

Figure 1 shows the number of grand prix wikipedia pages that contain the word 'wet' or 'rain' per year. While there may be some errors in this methodology (please inform me if there is), the general trend in this data is very clear: F1 experiences more wet weather as time progresses.

![Fig. 2 - Short Races per Year](/Figures/Fig.%202%20-%20Short%20Races%20per%20Year.png)
<sup>Fig. 2 - Short Races per Year</sup>

Figure 2 shows the number of grand prix wikipedia pages that contain the words 'Scheduled distance' per year. As described in the methodology, these are the number of races per year that did not reach their scheduled race distance due to any reason (not only because of weather).

![Fig. 3 - Wet & Short Races per Year](/Figures/Fig.%203%20-%20Wet%20%26%20Short%20Races%20per%20Year.png)
<sup>Fig. 3 - Wet & Short Races per Year</sup>

Figure 3 combines the previous two figures.

![Fig. 4 - Recent Wet Races Heat Map](/Figures/Fig.%204%20-%20Recent%20Wet%20Races%20Heat%20Map.png)
<sup>Fig. 4 - Recent Wet Races Heat Map</sup>

Figure 4 shows a heat map (with only two scales, 0 or 1) which only includes races that have been in active use since the year 2000 (important notes: firstly, this only includes the grand prix name, not necessarily the name of the track(s), secondly, this includes the total history of races that have been held since 2000 (ie. the Belgian Grand Prix has been held since 2000 and therefore all of its history has been shown)).

![Fig. 5 - Number of Wet Races per Driver](/Figures/Fig.%205%20-%20Number%20of%20Wet%20Races%20per%20Driver.png)
<sup>Fig. 5 - Number of Wet Races per Driver</sup>

Figure 5 shows the number of 'wet weekend races' ran by drivers in descending order showing the top 40 of all F1 drivers.

#To Do
Analyze weather data history for all current track locations.