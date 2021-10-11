# https://blog.djnavarro.net/posts/2021-09-07_water-colours/

library(tidyverse)
file <- fs::path("fotos/2.JPG")
knitr::include_graphics(file)


# para importar la imagen y adaptarla
import_image <- function(path, width, height) {
  geometry <- paste0(width, "x", height) # e.g., "100x60"
  path %>% 
    magick::image_read() %>% 
    magick::image_scale(geometry)
}

# para convertir la imgen en datos
construct_matrix <- function(image) {
  
  # read matrix
  mat <- image %>% 
    as.raster() %>%
    as.matrix()
  
  # use the row and column names to represent co-ordinates
  rownames(mat) <- paste0("y", nrow(mat):1) # <- flip y
  colnames(mat) <- paste0("x", 1:ncol(mat))
  
  return(mat)
}

# para transformar la matriz a un tibble:


construct_tibble <- function(mat) {
  
  # convert to tibble
  tbl <- mat %>%
    as.data.frame() %>%
    rownames_to_column("y") %>%
    as_tibble() 
  
  # reshape
  tbl <- tbl %>%
    pivot_longer(
      cols = starts_with("x"),
      names_to = "x",
      values_to = "shade"
    ) 
  
  # tidy
  tbl <- tbl %>%
    arrange(x, y) %>% 
    mutate(
      x = x %>% str_remove_all("x") %>% as.numeric(),
      y = y %>% str_remove_all("y") %>% as.numeric(),
      id = row_number()
    )
  
  return(tbl)
}

# conversión
jas <- file %>% 
  import_image(width = 100, height = 60) %>% 
  construct_matrix() %>% 
  construct_tibble()

jas

# una función para definir un tema de ggplot que no tenga en cuenta cosas como
# legends, scales, etc
ggplot_themed <- function(data) {
  data %>% 
    ggplot(aes(x, y)) +
    coord_equal() + 
    scale_size_identity() + 
    scale_colour_identity() + 
    scale_fill_identity() + 
    theme_void() 
  }

# versión pixelada de la foto
jas %>% 
  ggplot_themed() + 
  geom_tile(aes(fill = shade)) 

jas %>% 
  ggplot_themed() + 
  geom_point(aes(colour = shade)) 

# acá lo que hace es extraer los channels de los colores (que están en RGB)
extract_channels <- function(tbl) {
  rgb <- with(tbl, col2rgb(shade))
  hsv <- rgb2hsv(rgb)
  tbl <- tbl %>% 
    mutate(
      red = rgb[1, ],
      grn = rgb[2, ],
      blu = rgb[3, ],
      hue = hsv[1, ],
      sat = hsv[2, ],
      val = hsv[3, ]
    )
  return(tbl)
}


# y lo aplica al anterior
jas <- extract_channels(jas)
jas

# una forma de usar esto podría ser convertirlo en blanco y negro
map_size <- function(x) {
  ambient::normalise(1-x, to = c(0, 2))
}

jas %>% 
  ggplot_themed() +  
  geom_point(
    mapping = aes(size = map_size(val)),
    colour = "black", 
    show.legend = FALSE
  )

# otra opción que surge de las anteriores es retener el color y la saturación,
# y usar el tamaño de los puntos para representar la intensidad del valor
jas %>% 
  ggplot_themed() +  
  geom_point(
    mapping = aes(
      colour = hsv(hue, sat, .5), 
      size = map_size(val)
    ), 
    show.legend = FALSE
  )

## Arte con generadores de ruido


field <- function(points, frequency = .1, octaves = 1) {
  ambient::curl_noise(
    generator = ambient::fracture,
    fractal = ambient::billow,
    noise = ambient::gen_simplex,
    x = points$x,
    y = points$y,
    frequency = frequency,
    octaves = octaves,
    seed = 1
  )
}

shift <- function(points, amount, ...) {
  vectors <- field(points, ...)
  points <- points %>%
    mutate(
      x = x + vectors$x * amount,
      y = y + vectors$y * amount,
      time = time + 1,
      id = id
    )
  return(points)
}



points_time0 <- expand_grid(x = 1:50, y = 1:30) %>% 
  mutate(time = 0, id = row_number())

ggplot_themed(points_time0) + 
  geom_point(size = .5)



points_time1 <- shift(points_time0, amount = 1)
points_time2 <- shift(points_time1, amount = 1)
points_time3 <- shift(points_time2, amount = 1)

pts <- bind_rows(
  points_time0, 
  points_time1, 
  points_time2,
  points_time3
)



map_size <- function(x) {
  ambient::normalise(x, to = c(0, 2))
}
map_alpha <- function(x) {
  ambient::normalise(-x, to = c(0, .5))
}



pts %>% 
  ggplot_themed() +  
  geom_point(
    mapping = aes(
      size = map_size(time), 
      alpha = map_alpha(time),
      color = rainbow(6000)
    ),
    show.legend = FALSE
  )+
  theme(panel.background = element_rect(fill = "ghostwhite"))


iterate <- function(pts, time, step, ...) {
  bind_rows(accumulate(
    .x = rep(step, time), 
    .f = shift, 
    .init = pts
  ))
}



pts <- points_time0 %>% 
  iterate(time = 3, step = 1)



extract_points <- function(data) {
  data %>% 
    select(x, y, id) %>% 
    mutate(time = 0)
}



pts <- jas %>% 
  extract_points() %>% 
  iterate(time = 20, step = .1)

map_size <- function(x) {
  ambient::normalise(x^2, to = c(0, 3.5))
}

datapoints <- 100800
library(RColorBrewer)
palette <- aRtsy::colorPalette(name = 'random', n = 100800)

pts %>% 
  ggplot_themed() +  
  geom_point(
    mapping = aes(size = log(map_size(time))),
    alpha = .01,
    show.legend = FALSE, 
    color = palette
  ) 

restore_points <- function(jas, pts) {
  jas %>% 
    select(-x, -y) %>% 
    full_join(pts, by = "id") %>% 
    arrange(time, id) }



jas <- restore_points(jas, pts)
jas




map_size <- function(x, y) {
  ambient::normalise((1 - x) * y^2, to = c(0, 5))
}

jas %>% 
  ggplot_themed() +  
  geom_point(
    mapping = aes(
      colour = hsv(hue, sat, .5), 
      size = map_size(val, time)
    ), 
    alpha = .03,
    show.legend = FALSE
  )




jas <- file %>% 
  import_image(width = 300, height = 220) %>% 
  construct_matrix() %>% 
  construct_tibble() %>% 
  extract_channels()



pts <- jas %>% 
  extract_points() %>% 
  iterate(
    time = 40, 
    step = .2, 
    octaves = 10, 
    frequency = .05
  )

jas <- jas %>%
  restore_points(pts)

jas

map_size <- function(x, y) {
  12 * (1 - x) * (max(y)^2 - y^2) / y^2
}



jas %>% 
  ggplot_themed() +  
  geom_point(
    mapping = aes(
      colour = shade, 
      size = map_size(val, time)
    ), 
    alpha = 1,
    stroke = 0,
    show.legend = FALSE
  ) 

pic

pic +
  scale_x_continuous(limits = c(11, 190), expand = c(0, 0)) +
  scale_y_continuous(limits = c(7, 114), expand = c(0, 0))










