library(leaflet)
library(rgdal)
library(tidyverse)

leaflet() %>%
  addProviderTiles(providers$Stamen.Watercolor, group = "Stamen Watercolor") %>%
  addProviderTiles(providers$Esri.WorldPhysical, group = "Physical Map") %>%
  addLayersControl(
    baseGroups = c("Stamen Watercolor", "Physical Map"),
    options = layersControlOptions(collapsed = FALSE)) %>% 
  setMaxBounds(lng1 = 30, lat1 = 40, lng2 = 60, lat2 = 70) %>%
  setView(lat = 44, lng = 35, zoom = 6) 
  