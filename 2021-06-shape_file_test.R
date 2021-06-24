install.packages("rgdal")   # R wrapper around GDAL / OGR
install.packages("ggplot2") # for general plotting
install.packages("ggmaps")  # for fortifying shapefiles

library(rgdal)   # R wrapper around GDAL / OGR
library(ggplot2) # for general plotting
library(ggmaps)  # for fortifying shapefiles

# First read in the shapefile, using the path to the shapefile name minus the extension as arguments

shapefile <- readOGR("path/to/shapefile/", "name_of_shapefile")

# Next the shapefile has to be converted to a dataframe for use in ggplot2
shapefile_df <- fortify(shapefile)

# Now the shapefile can be plotted as either a geom_path or a geom_polygon
# Paths handle clipping better. Polygons can be filled
# Need aesthetics long, lat and group.

map <- ggplot() +
geom_path(data = shapefile_df,
        aes(x = long, y = lat, group = group),
        color = 'gray', fill = 'white', size = .2)

print(map)

# using ggplot2 function coord_map will make things look better and it will also let you change the projection . But sometimes with large shapefiles it makes everything blow up.

map_projected <- map +
    coord_map()

print(map_projected)