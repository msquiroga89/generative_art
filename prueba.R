library(tidyverse)
set.seed(25545)
df <- tibble(crossing(x = sample(1:100, 200, replace = TRUE),
             y = sample(1:10, 5, replace = TRUE)))

df2 <- tibble(crossing(x = sample(-100:1, 20, replace = TRUE),
                      y = sample(-10:1, 5, replace = TRUE)))

ggplot(df, aes(x*y,y))+
  geom_line()+
  coord_polar()+
  theme_void()

set.seed(3)
df3 <- tibble(crossing(x = sample(1:100, 20, replace = TRUE),
                      y = sample(1:1000, 50, replace = TRUE)))

df3 <- tibble(x = rnorm(1000, mean = 5, sd =10),
              y = rnorm(1000, mean = 6, sd = 5))

ggplot(df3)+
  geom_density2d(aes(x,y))+
  coord_polar()+
  theme_void()


# M -----------------------------------------------------------------------

eme <- tibble(x = c(1,2,2,3,4,4,5,5,4,3,2,1,1),
              y = c(0,0,2,1,2,0,0,3,3,2,3,3,0))

ggplot()+
  geom_polygon(data = eme, aes(x,y), fill = "darkgreen")+
  geom_path(data = eme, aes(x,y), color = "red")+
  theme_void()

####

set.seed(2005)
df4 <- tibble(x = rnorm(300, mean = 5, sd = 100),
              y = rnorm(300, mean = 6, sd = 9),
              z = rnorm(300, mean = 7, sd = 10))

df4 %>% 
  ggplot(aes(x,y))+
  geom_area()+
  theme_void()

ggsave("images/noname",
       bg = "transparent",
       device = "png")

df4 %>% 
  ggplot()+
  theme_void()+
  geom_density(aes(y))+
  geom_density(aes(x, color = "red"))+
  geom_density(aes(z, color = "green"))


df5 <- tibble(a = rnorm(1000, mean = 1, sd = 1),
              b = rnorm(1000, mean = 1, sd = 2),
              c = rnorm(1000, mean = 1, sd = 3),
              d = rnorm(1000, mean = 1, sd = 4),
              e = rnorm(1000, mean = 1, sd = 5),
              f = rnorm(1000, mean = 1, sd = 6),
              g = rnorm(1000, mean = 1, sd = 7),
              h = rnorm(1000, mean = 1, sd = 8),
              i = rnorm(1000, mean = 1, sd = 9),
              j = rnorm(1000, mean = 1, sd = 10),
              k = rnorm(1000, mean = 1, sd = 11),
              l = rnorm(1000, mean = 1, sd = 12)
              )

df5 %>% 
  ggplot()+
  theme_void()+
  geom_density(aes(a), color = "dodgerblue4")+
  geom_density(aes(b), color = "dodgerblue3")+
  geom_density(aes(c), color = "dodgerblue2")+
  geom_density(aes(d), color = "dodgerblue1")+
  geom_density(aes(e), color = "dodgerblue")+
  geom_density(aes(f), color = "dodgerblue1")+
  geom_density(aes(g), color = "dodgerblue1")+
  geom_density(aes(h), color = "dodgerblue1")+
  geom_density(aes(i), color = "dodgerblue1")+
  geom_density(aes(j), color = "dodgerblue1")+
  geom_density(aes(k), color = "dodgerblue1")+
  geom_density(aes(l), color = "dodgerblue1")

paleta <- sample(colours(distinct = TRUE), 100)

df4 %>% 
  ggplot()+
  theme_void()+
  geom_dotplot(aes(x))

df4 %>% 
  ggplot()+
  theme_void()+
  geom_freqpoly(aes(x))

df4 %>% 
  ggplot()+
  theme_void()+
  geom_function(aes(x), fun = sqrt)

df4 %>% 
  ggplot()+
  theme_void()+
  geom_path(aes(x,z))

df4 %>% 
  ggplot()+
  theme_void()+
  geom_ribbon(aes(x = z, ymin = x, ymax = y))

df4 %>% 
  ggplot()+
  theme_void()+
  geom_spoke(aes(x, y, angle = 45, radius = 20))

###
library(ambient)
simplex <- noise_simplex(c(500, 500), pertubation = 'normal', 
                         pertubation_amplitude = 40)
set.seed(678)
ggplot(as.data.frame(simplex))+
  geom_point(aes(V1, V50), color = sample(paleta2, 1), size = 0.25)+
  geom_point(aes(V3, V49), color = sample(paleta2, 1), size = 0.25)+
  geom_point(aes(V5, V48), color = sample(paleta2, 1), size = 0.25)+
  geom_point(aes(V7, V47), color = sample(paleta2, 1), size = 0.25)+
  geom_point(aes(V8, V46), color = sample(paleta2, 1), size = 0.25)+
  geom_point(aes(V9, V45), color = sample(paleta2, 1), size = 0.25)+
  geom_point(aes(V10, V44), color = sample(paleta2, 1), size = 0.25)+
  geom_point(aes(V11, V43), color = sample(paleta2, 1), size = 0.25)+
  geom_point(aes(V12, V42), color = sample(paleta2, 1), size = 0.25)+
  geom_point(aes(V13, V41), color = sample(paleta2, 1), size = 0.25)+
  geom_point(aes(V14, V40), color = sample(paleta2, 1), size = 0.25)+
  geom_point(aes(V15, V39), color = sample(paleta2, 1), size = 0.25)+
  geom_point(aes(V16, V38), color = sample(paleta2, 1), size = 0.25)+
  geom_point(aes(V17, V37), color = sample(paleta2, 1), size = 0.25)+
  geom_point(aes(V18, V36), color = sample(paleta2, 1), size = 0.25)+
  geom_point(aes(V19, V35), color = sample(paleta2, 1), size = 0.25)+
  geom_point(aes(V20, V34), color = sample(paleta2, 1), size = 0.25)+
  geom_point(aes(V21, V33), color = sample(paleta2, 1), size = 0.25)+
  geom_point(aes(V22, V32), color = sample(paleta2, 1), size = 0.25)+
  geom_point(aes(V23, V31), color = sample(paleta2, 1), size = 0.25)+
  geom_point(aes(V24, V30), color = sample(paleta2, 1), size = 0.25)+
  geom_point(aes(V25, V29), color = sample(paleta2, 1), size = 0.25)+
  geom_point(aes(V26, V28), color = sample(paleta2, 1), size = 0.25)+
  geom_point(aes(V27, V27), color = sample(paleta2, 1), size = 0.25)+
  theme_void()+
  theme(
    panel.background = element_rect(fill = "black")
  )

paleta2 <- RColorBrewer::brewer.pal(9, "Set3")

ggplot(as.data.frame(simplex))+
  geom_polygon(aes(V1, V50), color = sample(paleta2, 1), size = 0.25)+
  geom_polygon(aes(V3, V49), color = sample(paleta2, 1), size = 0.25)+
  geom_polygon(aes(V5, V48), color = sample(paleta2, 1), size = 0.25)+
  geom_polygon(aes(V7, V47), color = sample(paleta2, 1), size = 0.25)+
  geom_polygon(aes(V8, V46), color = sample(paleta2, 1), size = 0.25)+
  geom_polygon(aes(V9, V45), color = sample(paleta2, 1), size = 0.25)+
  geom_polygon(aes(V10, V44), color = sample(paleta2, 1), size = 0.25)+
  geom_polygon(aes(V11, V43), color = sample(paleta2, 1), size = 0.25)+
  geom_polygon(aes(V12, V42), color = sample(paleta2, 1), size = 0.25)+
  geom_polygon(aes(V13, V41), color = sample(paleta2, 1), size = 0.25)+
  geom_polygon(aes(V14, V40), color = sample(paleta2, 1), size = 0.25)+
  geom_polygon(aes(V15, V39), color = sample(paleta2, 1), size = 0.25)+
  geom_polygon(aes(V16, V38), color = sample(paleta2, 1), size = 0.25)+
  geom_polygon(aes(V17, V37), color = sample(paleta2, 1), size = 0.25)+
  geom_polygon(aes(V18, V36), color = sample(paleta2, 1), size = 0.25)+
  geom_polygon(aes(V19, V35), color = sample(paleta2, 1), size = 0.25)+
  geom_polygon(aes(V20, V34), color = sample(paleta2, 1), size = 0.25)+
  geom_polygon(aes(V21, V33), color = sample(paleta2, 1), size = 0.25)+
  geom_polygon(aes(V22, V32), color = sample(paleta2, 1), size = 0.25)+
  geom_polygon(aes(V23, V31), color = sample(paleta2, 1), size = 0.25)+
  geom_polygon(aes(V24, V30), color = sample(paleta2, 1), size = 0.25)+
  geom_polygon(aes(V25, V29), color = sample(paleta2, 1), size = 0.25)+
  geom_polygon(aes(V26, V28), color = sample(paleta2, 1), size = 0.25)+
  geom_polygon(aes(V27, V27), color = sample(paleta2, 1), size = 0.25)+
  theme_void()+
  theme(
    panel.background = element_rect(fill = "black")
  )


ggplot(as.data.frame(simplex))+
  geom_path(aes(V1, V50), color = sample(paleta2, 1), size = 0.25)+
  geom_path(aes(V3, V49), color = sample(paleta2, 1), size = 0.25)+
  geom_path(aes(V5, V48), color = sample(paleta2, 1), size = 0.25)+
  geom_path(aes(V7, V47), color = sample(paleta2, 1), size = 0.25)+
  geom_path(aes(V8, V46), color = sample(paleta2, 1), size = 0.25)+
  geom_path(aes(V9, V45), color = sample(paleta2, 1), size = 0.25)+
  geom_path(aes(V10, V44), color = sample(paleta2, 1), size = 0.25)+
  geom_path(aes(V11, V43), color = sample(paleta2, 1), size = 0.25)+
  geom_path(aes(V12, V42), color = sample(paleta2, 1), size = 0.25)+
  geom_path(aes(V13, V41), color = sample(paleta2, 1), size = 0.25)+
  geom_path(aes(V14, V40), color = sample(paleta2, 1), size = 0.25)+
  geom_path(aes(V15, V39), color = sample(paleta2, 1), size = 0.25)+
  geom_path(aes(V16, V38), color = sample(paleta2, 1), size = 0.25)+
  geom_path(aes(V17, V37), color = sample(paleta2, 1), size = 0.25)+
  geom_path(aes(V18, V36), color = sample(paleta2, 1), size = 0.25)+
  geom_path(aes(V19, V35), color = sample(paleta2, 1), size = 0.25)+
  geom_path(aes(V20, V34), color = sample(paleta2, 1), size = 0.25)+
  geom_path(aes(V21, V33), color = sample(paleta2, 1), size = 0.25)+
  geom_path(aes(V22, V32), color = sample(paleta2, 1), size = 0.25)+
  geom_path(aes(V23, V31), color = sample(paleta2, 1), size = 0.25)+
  geom_path(aes(V24, V30), color = sample(paleta2, 1), size = 0.25)+
  geom_path(aes(V25, V29), color = sample(paleta2, 1), size = 0.25)+
  geom_path(aes(V26, V28), color = sample(paleta2, 1), size = 0.25)+
  geom_path(aes(V27, V27), color = sample(paleta2, 1), size = 0.25)+
  theme_void()+
  theme(
    panel.background = element_rect(fill = "black")
  )
