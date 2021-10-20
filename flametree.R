# install.packages("flametree")
# https://flametree.djnavarro.net/articles/articles/getting-started.html
library(flametree)

flametree_grow() %>% # crea un dataframe
  flametree_plot() # crea el plot

# cambios posibles: seed
flametree_grow(seed = 358) %>% 
  flametree_plot() 

# trees and times
flametree_grow(trees = 2, time = 10) %>% # crea un dataframe
  flametree_plot() # crea el plot

# scale (toma un vector de números positivos para crear la longitud de las ramas)
flametree_grow(scale = c(0.9, 1, 0.6),
               time = 9) %>% # crea un dataframe
  flametree_plot() # crea el plot

# angle (vector de grados para la orientación)
flametree_grow(scale = c(0.9, 1, 0.6),
               time = 9,
               angle = c(25, 15, -5)) %>% # crea un dataframe
  flametree_plot()

# asignar colores
flametree_grow(scale = c(0.9, 1, 0.6),
               time = 9,
               angle = c(25, 15, -25)) %>% 
  flametree_plot(
    palette = c("#613659","#211522", "#c197d2", "#d3b1c2")
  )

# spark linear
spark_linear(x = 2, y = 3)
flametree_grow(scale = c(0.9, 1, 0.6),
               time = 9,
               angle = c(25, 15, -25),
               seg_col = spark_linear(x = 2, y = 3)) %>%
  flametree_plot(
    palette = c("#613659","#211522", "#c197d2", "#d3b1c2")
  )

# shift_x y shift_y para que esto cambie entre ramas (y) y entre árboles (x)
flametree_grow(trees = 3,
               scale = c(0.9, 1, 0.6),
               time = 9,
               angle = c(25, 5, -25),
               seg_col = spark_linear(x = 2, y = 3),
               shift_x = spark_linear(tree = 1)) %>% 
  flametree_plot(
    palette = red_bean
  )

# distintos tipos de árboles
flametree_grow(trees = 3,
               scale = c(0.9, 1, 0.6),
               time = 9,
               angle = c(25, 5, -25),
               seg_col = spark_linear(x = 2, y = 3),
               shift_x = spark_linear(tree = 1)) %>% 
  flametree_plot(
    palette = northern_lights,
    style = "voronoi"
  )

flametree_grow(trees = 3,
               scale = c(0.9, 1, 0.6),
               time = 9,
               angle = c(25, 5, -25),
               seg_col = spark_linear(x = 2, y = 3),
               shift_x = spark_linear(tree = 1)) %>% 
  flametree_plot(
    palette = c("#613659","#211522", "#c197d2", "#d3b1c2"),
    style = "nativeflora"
  )

flametree_grow(trees = 3,
               scale = c(0.9, 1, 0.6),
               time = 9,
               angle = c(25, 5, -25),
               seg_col = spark_linear(x = 2, y = 3),
               shift_x = spark_linear(tree = 1)) %>% 
  flametree_plot(
    palette = c("#613659","#211522", "#c197d2", "#d3b1c2"),
    style = "minimal"
  )

flametree_grow(trees = 3,
               scale = c(0.9, 1, 0.6),
               time = 9,
               angle = c(25, 5, -25),
               seg_col = spark_linear(x = 2, y = 3),
               shift_x = spark_linear(tree = 1)) %>% 
  flametree_plot(
    palette = c("#613659","#211522", "#c197d2", "#d3b1c2"),
    style = "themegray"
  )


# Paletas -----------------------------------------------------------------

northern_lights <- c("#1dc690", "#278ab0", "#1c4670", "#eaeae0")
calm <- c("#613659","#211522", "#c197d2", "#d3b1c2")
wild_orchid <- c("#005437", "#debad6", "#340744", "#741aac")
red_bean <- c("#ba0f30", "#2f2440", "#c6b79b", "#ff2511")
