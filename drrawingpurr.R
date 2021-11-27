# https://fronkonstin.com/2019/03/27/drrrawing-with-purrr/

library(tidyverse)

pentagon <- tibble(
  x    = accumulate(1:4, ~.x+cos(.y*2*pi/5), .init = 0),
  y    = accumulate(1:4, ~.x+sin(.y*2*pi/5), .init = 0),
  xend = accumulate(2:5, ~.x+cos(.y*2*pi/5), .init = cos(2*pi/5)),
  yend = accumulate(2:5, ~.x+sin(.y*2*pi/5), .init = sin(2*pi/5)))

ggplot(pentagon)+
  geom_segment(aes(x=x, y=y, xend=xend, yend=yend))+
  coord_equal()+
  theme_void()

polygon <- function(n) {
  tibble(
    x    = accumulate(1:(n-1), ~.x+cos(.y*2*pi/n), .init = 0),
    y    = accumulate(1:(n-1), ~.x+sin(.y*2*pi/n), .init = 0),
    xend = accumulate(2:n,     ~.x+cos(.y*2*pi/n), .init = cos(2*pi/n)),
    yend = accumulate(2:n,     ~.x+sin(.y*2*pi/n), .init = sin(2*pi/n)))
}

ggplot(polygon(6))+
  geom_segment(aes(x=x, y=y, xend=xend, yend=yend))+
  coord_equal()+
  theme_void()

ggplot(polygon(7))+
  geom_segment(aes(x=x, y=y, xend=xend, yend=yend))+
  coord_equal()+
  theme_void()

ggplot(polygon(8))+
  geom_segment(aes(x=x, y=y, xend=xend, yend=yend))+
  coord_equal()+
  theme_void()

ggplot(polygon(9))+
  geom_segment(aes(x=x, y=y, xend=xend, yend=yend))+
  coord_equal()+
  theme_void()

#(falta)
