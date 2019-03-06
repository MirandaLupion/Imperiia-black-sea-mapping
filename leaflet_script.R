library(leaflet)
library(readr)
library(rgdal)
library(tidyverse)
library(tidyverse)

# Data

landmarks <- read_csv("Settlement_coordinates_for_James_viz - Sheet1.csv")

# Coloring for markers
# pal <- colorFactor(c("navy", "red"), domain = c("town", "military"))
# Then in addCircleMarkers color = ~pal(type)


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
  # Can add blurbs in clickable pop ups
  
  addCircleMarkers(data = landmarks, 
                   ~lng, ~lat, 
                   label = ~as.character(name),
                   labelOptions = labelOptions(noHide = F, direction = "bottom",
                                               style = list(
                                                 "color" = "black",
                                                 "font-family" = "serif",
                                                 "font-style" = "normal",
                                                 "font-weight" = "bold",
                                                 "box-shadow" = "3px 3px rgba(0,0,0,0.25)",
                                                 "font-size" = "12px",
                                                 "border-color" = "rgba(0,0,0,0.5)")),
                   radius = 6,
                   color = "red",
                   stroke = FALSE, 
                   fillOpacity = 0.8,
                   group = "Settlements") %>%
  
  # Measurement tool
  
  addMeasure()

# Potential improvements:
# could use colorpal to distinguish between large and small settlements in color or icon
# pal <- colorFactor(c("navy", "red"), domain = c("settlement", "city"))
# Potential for a rectangle outline of the two sites 

  