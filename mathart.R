# https://github.com/marcusvolz/mathart
# devtools::install_github("marcusvolz/mathart")
# install.packages("ggforce")

library(mathart)
library(ggforce)
library(Rcpp)
library(tidyverse)


# Mollusc ---------------------------------------------------------------

df <- mollusc()
df1 <- df %>% mutate(id = 1)
df2 <- df %>% mutate(id = 2)
df3 <- df %>% mutate(id = 3)

c <- ggplot() +
  geom_point(aes(x, y, colour = "#f72585"), df1, size = 0.03, alpha = 0.03) +
  geom_path( aes(x, y, colour = "#b5179e"), df1, size = 0.03, alpha = 0.03) +
  geom_point(aes(x, z, colour = "#7209b7"), df2, size = 0.03, alpha = 0.03) +
  geom_path( aes(x, z, colour = "#560bad"), df2, size = 0.03, alpha = 0.03) +
  geom_point(aes(y, z, colour = "#480ca8"), df3, size = 0.03, alpha = 0.03) +
  geom_path( aes(y, z, colour = "#3a0ca3"), df3, size = 0.03, alpha = 0.03) 
  #facet_wrap(~id, nrow = 2, scales = "free") +
  #theme_blankcanvas(margin_cm = 0.5)

ggsave("mollusc03.png", width = 80, height = 80, units = "cm")


# 2 -----------------------------------------------------------------------

df <- mollusc(n_s = 844, n_t = 584, alpha = 115, phi = 24)
df1 <- df %>% mutate(id = 1)
df2 <- df %>% mutate(id = 2)
df3 <- df %>% mutate(id = 3)

d <- ggplot() +
  geom_point(aes(x, y, colour = "#f72585"), df1, size = 0.03, alpha = 0.03) +
  geom_path( aes(x, y, colour = "#b5179e"), df1, size = 0.03, alpha = 0.03) +
  geom_point(aes(x, z, colour = "#7209b7"), df2, size = 0.03, alpha = 0.03) +
  geom_path( aes(x, z, colour = "#560bad"), df2, size = 0.03, alpha = 0.03) +
  geom_point(aes(y, z, colour = "#480ca8"), df3, size = 0.03, alpha = 0.03) +
  geom_path( aes(y, z, colour = "#3a0ca3"), df3, size = 0.03, alpha = 0.03) 
#facet_wrap(~id, nrow = 2, scales = "free") +
  #theme_classic()

ggsave("mollusc04.png", width = 80, height = 80, units = "cm")



# Lorenz attractor --------------------------------------------------------

df <- lorenz_attractor(a=20, b=8/3, c=28, n=1000000)

p <- ggplot() +
  geom_path(aes(x, z), df, alpha = 0.15, size = 0.03) +
  coord_equal() +
  xlim(-25, 25) + ylim(2.5, 52.5) +
  theme_blankcanvas(margin_cm = 0)

ggsave("lorenz_attractor.png", p, width = 20, height = 20, units = "cm")
