# primer intento en hacer arte generativo
# https://koenderks.github.io/aRtsy/
# install.packages("aRtsy")
library(aRtsy)
library(RColorBrewer)

#' When you think of the act of painting, you probably imagine stroking paint on 
#' a canvas. This type of artwork tries to mimic that activity. The paint strokes 
#' algorithm is based on the simple idea that each next point on a grid-based 
#' canvas has a chance to take over the color of an adjacent colored point, but 
#' also has a minor chance of generating a new color. Going over the canvas like 
#' this results in strokes of paint. Repeating this a number of times creates 
#' more faded strokes of paint.

mycolors <- c("#f72585", "#b5179e", "#7209b7", "#560bad", "#480ca8", "#3a0ca3", 
              "#3f37c9", "#4361ee", "#4895ef", "#4cc9f0")

set.seed(2)
canvas_strokes(colors = mycolors, 
               neighbors = 1, p = 0.01, iterations = 7, 
               width = 500, height = 500, side = TRUE)



#' Collatz conjecture
#' The Collatz conjecture is also known as 3x+1. The algorithm draws lines 
#' according to a simple rule set:
  
# Take a random positive number.
# If the number is even, divide it by 2.
# If the number is odd, multiply the number by 3 and add 1.
# Repeat to get a sequence of numbers.

#' By visualizing the sequence for each number, overlaying sequences that are 
#' the same, and bending the edges differently for even and odd numbers in the 
#' sequence, organic looking coral structures can occur.

canvas_collatz(colors = mycolors, background = '#fafafa', n = 1234, 
               angle.even = 0.0075, angle.odd = 0.0145, side = FALSE)

#' According to wikipedia, a turmite is “a Turing machine which has an 
#' orientation in addition to a current state and a”tape" that consists of an 
#' infinite two-dimensional grid of cells". The classic algorithm consists of 
#' repeating the three simple steps shown below. However, the algorithm in aRtsy 
#' is slightly modified so that the turmite does not go off the canvas, but 
#' instead bounces back onto the canvas.

# Turn on the spot (left, right, up, or down),
# Change the color of the block,
# Move forward one block.

set.seed(66678)
canvas_turmite(color = '#b5179e', background = '#000000', p = 0.5, 
               iterations = 1e6, width = 1500, height = 500)



# Langton's ant -----------------------------------------------------------

# According to wikipedia, Langton’s ant is a turmite with a very specific set of 
# rules. In particular, the algorithm involves repeating the three rules shown 
# below. Beware, the problem (or blessing) of Langton’s ant is that it always 
# moves off the canvas…
# 
# On a non-colored block: turn 90 degrees clockwise, un-color the block, move 
# forward one block.
# On a colored block: turn 90 degrees counter-clockwise, color the block, move 
# forward one block.
# The ant is able to cycle through different colors which correspond to different 
# combinations of these rules.

canvas_ant(colors = mycolors, background = '#fafafa', iterations = 1e8,
           width = 200, height = 200)



# Planets -----------------------------------------------------------------


#' We all love space, and this type of artwork puts you right between the planets. 
#' The algorithm creates one or multiple planets in space and uses a cellular 
#' automata (inspired by an idea from Fronkonstin) to fill in their surfaces.

# Sun behind Earth and Moon

mycolors <- c(, , 
              , "#4cc9f0")

set.seed(55)
colors <- list(c('#f72585', '#b5179e', '#7209b7'),
               c('#560bad', '#480ca8', '#3a0ca3'), 
               c('#3f37c9', '#4361ee', '#4895ef'))
canvas_planet(colors, radius = c(800, 400, 150), 
              center.x = c(1, 500, 1100),
              center.y = c(1400, 500, 1000), 
              starprob = 0.005)


# Segments ----------------------------------------------------------------

#' This type of artwork mimics the style of the well-known paintings by the 
#' Dutch artist Piet Mondriaan. The position and direction of each line segment 
#' is determined randomly.

set.seed(1)
canvas_segments(colors = mycolors, background = '#ffffff', n = 1000, p = 0.3, H = 0.5)



# Diamonds ----------------------------------------------------------------

#' This function creates a set of diamonds on a canvas. The diamonds are filled 
#' in using a random color assignment.

set.seed(5)
canvas_diamonds(colors = mycolors, 
                background = '#fafafa', col.line = 'black', radius = 5, alpha = 0.80, 
                p = 0.2, width = 500, height = 500)


# Squares and rectangles --------------------------------------------------

#' This type of artwork is also a la Mondriaan, but uses a variety of squares 
#' and rectangles instead of lines. It works by repeatedly cutting into the 
#' canvas at random locations and coloring the area that these cuts create.

set.seed(16)
canvas_squares(colors = mycolors,
               cuts = 50, ratio = 1.618, width = 100, height = 100)



# Ribbons ----------------------------------------------------------------

#' This function creates colored ribbons with (or without) a triangle that 
#' breaks their paths. This path of the ribbon polygon is creating by picking 
#' one point on the left side of the triangle and one point on the right side at 
#' random and using these points as nodes.

set.seed(1)
canvas_ribbons(colors = mycolors,
               background = '#fdf5e6', triangle = TRUE)


# Polylines ---------------------------------------------------------------

#' This function draws many points on the canvas and connects these points into 
#' a polygon. After repeating this for all the colors, the edges of all polygons 
#' are drawn on top of the artwork.

set.seed(100)
canvas_polylines(colors = mycolors, 
                 background = '#fafafa', ratio = 0.5, iterations = 50, 
                 alpha = 0.5, size = 0.1, width = 500, height = 500)



# Functions ---------------------------------------------------------------

#' The idea for this type of artwork is taken over from the generativeart package. 
#' In this algorithm, the position of every single point is calculated by a 
#' formula which has random parameters.

set.seed(434)
canvas_function(color = '#3f37c9', background = '#4361ee')



# Mandelbrot --------------------------------------------------------------

#' This type of artwork visualizes the Mandelbrot set fractal, a perfect example 
#' of a complex structure arising from the application of simple rules. You can 
#' zoom in on the set and apply some color to create these nice images.

canvas_mandelbrot(colors = mycolors, zoom = 5.55)


# Circle maps -------------------------------------------------------------


#' This type of artwork is based on the concept of an Arnold tongue. According 
#' to wikipedia, Arnold tongues “are a pictorial phenomenon that occur when 
#' visualizing how the rotation number of a dynamical system, or other related 
#' invariant property thereof, changes according to two or more of its parameters”.

canvas_circlemap(colors = mycolors,
                 x_min = 10, x_max = 11, y_min = 0, y_max = 10, 
                 iterations = 100, width = 1500, height = 1500)
