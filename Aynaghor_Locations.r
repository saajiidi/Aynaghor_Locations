
install.packages("leaflet")
install.packages("htmlwidgets")
# Load required libraries
library(leaflet)
library(htmlwidgets)

# Replace with your published Google Sheet link
sheet_url <- "https://docs.google.com/spreadsheets/d/e/2PACX-1vQyW2GaApIo_jB4Kbh5jv5aPuN-eIlb3P__-EC6bUHQvGf7siqPh04JfxfNYNFCg3VHwDUO1DSry4HT/pub?output=csv"

# Read the data
data <- read.csv(sheet_url)

# Display the data
head(data)

# Create a leaflet map
m <- leaflet(data) %>%
  addTiles() %>%  # Add default OpenStreetMap tiles
  setView(lng = 90.3563, lat = 23.6850, zoom = 7) %>%  # Center on Bangladesh
  addCircleMarkers(
    lng = ~Longitude,
    lat = ~Latitude,
    radius = 5,
    color = "red",
    stroke = FALSE,
    fillOpacity = 0.8,
    popup = ~paste(
      "<b>Location:</b>", Location, "<br>",
      "<b>Latitude:</b>", Latitude, "<br>",
      "<b>Longitude:</b>", Longitude
    ),
    label = ~Location
  )

# Display the map
m

# Save the map as an HTML file
saveWidget(m, file = "interactive_map.html")