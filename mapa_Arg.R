arg <- geoAr::get_geo(geo = "ARGENTINA", level = "provincia")
ggplot(arg)+
  geom_sf(fill = "black", colour = "white",
          show.legend = "point")+
  theme_void()
