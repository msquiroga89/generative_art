# https://github.com/djnavarro/jasmines
#install.packages("ambient")
#remotes::install_github("djnavarro/jasmines")
library(ambient)
library(jasmines)
library(tidyverse)

use_seed(5) %>%
  entity_circle(grain = 7985) %>%
  unfold_tempest(iterations = 15) %>%
  style_ribbon(background = "wheat")



use_seed(1) %>%
  entity_circle(grain = 1000, size = 2) %>%
  unfold_warp(iterations = 100) %>%
  style_ribbon(palette = "rainbow")

use_seed(5) %>%
  entity_heart(grain = 1000) %>%
  unfold_slice(iterations = 10) %>%
  style_ribbon(
    palette = "base", 
    colour = "ind", 
    background = "mistyrose"
  ) %>%
  style_overlay(border = "white")
