# edited
# load libaries
library(tidyverse)
library(maps)
library(ggthemes)

# load world map data
world_map_data <- map_data("world")

# filter Ohio
ohio <- map_data("state") %>%
  filter(region == "ohio")

#load US cities list
us_cities <- read_csv("us_cities.csv")

# list of cities we want
list_c = c("Oxford", "Columbus", "Cincinnati","Dayton", "Athens", "Greenfield", 
           "Toledo", "Akron", "Bowling Green", "Cleveland", "Kent")

# filtering coordinates of desired cities
ohio_cities <- us_cities %>%
  filter(STATE_NAME=="Ohio") %>%
  filter(CITY %in% list_c) %>%
  filter(row_number() != 4, row_number() != 7, row_number() != 9,row_number() != 14)

# airport locations
airports <- data_frame(
  lat= c(39.5231,41.3410),
  lon = c(-83.6589,-82.3480),
  name= c("Airport 1", "Airport 2")
)

#plotting the map , it'll be messy if not zoomed
ggplot(ohio) +
  geom_polygon(aes(x=long, y=lat, group=group), fill="#B61E2E") +
  coord_map()+
  geom_point(data=ohio_cities, aes(x=LONGITUDE,y=LATITUDE),color="black", size=9, shape=17)+
  theme(
    panel.border = element_blank(),
    panel.grid.minor.x = element_blank(),
    panel.grid.major.x = element_blank(),
    panel.grid.minor.y = element_blank(),
    panel.grid.major.y = element_blank(),
    axis.ticks.x = element_blank(),
    axis.ticks.y = element_blank(),
    axis.text.x = element_blank(),
    axis.text.y = element_blank()
  )+
  labs(x="", y="")+
  geom_text(data = ohio_cities, aes(x=LONGITUDE,y=LATITUDE,label = CITY), color="navy",size=7,vjust = 1.8, hjust=-0.1)+
  geom_point(data=airports, aes(x=lon, y=lat), shape=18, color="yellow", size=12)+
  geom_text(data = airports, aes(x=lon,y=lat,label = name), color="yellow",size=7,vjust = 0.5, hjust=-0.2)
