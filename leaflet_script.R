library(leaflet)
library(readr)
library(rgdal)
library(tidyverse)
library(tidyverse)

# Data

landmarks <- read_csv("Settlement_coordinates_for_James_viz - Sheet1.csv")

leaflet() %>%
  
  # Basemaps 
  
  addProviderTiles(providers$Stamen.Watercolor, group = "Stamen Watercolor") %>%
  addProviderTiles(providers$Esri.WorldPhysical, group = "Physical Map") %>%
  
  # Layer control
  
  addLayersControl(
    baseGroups = c("Stamen Watercolor", "Physical Map"),
    overlayGroups = c("Settlements"),
    options = layersControlOptions(collapsed = FALSE)) %>% 
  
  # View controls
  
  setMaxBounds(lng1 = 30, lat1 = 40, lng2 = 60, lat2 = 70) %>%
  setView(lat = 44, lng = 35, zoom = 6) %>%
  
  # Settlement layers
  
  addCircleMarkers(data = landmarks, 
                   ~lng, ~lat, 
                   popup = ~as.character(name),
                   radius = 6,
                   color = "red",
                   stroke = FALSE, 
                   fillOpacity = 0.5,
                   group = "Settlements")

# Potential improvements:
# could use colorpal to distinguish between large and small settlements in color or icon
# pal <- colorFactor(c("navy", "red"), domain = c("settlement", "city"))
# Potential for an outline of the two sites 

  