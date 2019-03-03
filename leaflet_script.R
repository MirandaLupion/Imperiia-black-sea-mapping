library(leaflet)
library(readr)
library(rgdal)
library(tidyverse)
library(tidyverse)

landmarks <- read_csv("Settlement_coordinates_for_James_viz - Sheet1.csv")

leaflet(data = landmarks) %>%
  addProviderTiles(providers$Stamen.Watercolor, group = "Stamen Watercolor") %>%
  addProviderTiles(providers$Esri.WorldPhysical, group = "Physical Map") %>%
  addLayersControl(
    baseGroups = c("Stamen Watercolor", "Physical Map"),
    options = layersControlOptions(collapsed = FALSE)) %>% 
  setMaxBounds(lng1 = 30, lat1 = 40, lng2 = 60, lat2 = 70) %>%
  setView(lat = 44, lng = 35, zoom = 6) %>%
  addCircleMarkers(~lng, ~lat, 
                   popup = ~as.character(name),
                   stroke = FALSE, 
                   fillOpacity = 0.5)
  