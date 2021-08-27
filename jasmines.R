# https://github.com/djnavarro/jasmines
#install.packages("ambient")
# remotes::install_github("djnavarro/jasmines")
library(ambient)
library(jasmines)
library(tidyverse)

mycolors <- c("#f72585", "#b5179e", "#7209b7", "#560bad", "#480ca8", "#3a0ca3", 
              "#3f37c9", "#4361ee", "#4895ef", "#4cc9f0")

use_seed(2) %>%
  entity_circle(grain = 100) %>%
  unfold_tempest(iterations = 10) %>%
  style_ribbon(background = "#E5E0A9")


use_seed(2) %>%
  entity_circle(grain = 10000, size = 0.5) %>%
  unfold_warp(iterations = 120) %>%
  style_ribbon(palette = "acton")

use_seed(5) %>%
  entity_heart(grain = 1000) %>%
  unfold_slice(iterations = 10) %>%
  style_ribbon(
    palette = "base", 
    colour = "ind", 
    background = "mistyrose"
  ) %>%
  style_overlay(border = "white")
